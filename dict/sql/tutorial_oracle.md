Oracle tutorial

# 概要
Oracleデータベース固有の覚書をまとめる。

# 起動
ホストマシンでSQLPlusを起動して実行する。
    SQLPlus / AS SYSDBA
    SQL> STARTUP

# 停止
ホストマシンでSQLPlusを起動して実行する。
    SQLPLUS / AS SYSDBA
    SQL> SHUTDOWN IMMEDIATEk

# インスタンス
Oracleインストール後にインスタンスの作成を行う必要がある。

インスタンスの作成はこの文書では扱わない。

# 表領域
## 表領域の作成
表領域を作成する例を示す。

    -- 永続表領域
    CREATE SMALLFILE TABLESPACE <table_space_name> DATAFILE <table_space_path> SIZE 1G AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO; 

    -- 一時表領域
    CREATE SMALLFILE TEMPORARY TABLESPACE <table_space_name> TEMPFILE <table_space_path> SIZE 1G AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;

## 表領域の削除
    DROP TABLESPACE <table_space> INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

# ユーザ
## ユーザの作成
ユーザを作成するSQLの例を示す。必要に応じてGRANT文で権限を与える。

    CREATE USER <user_name> PROFILE "DEFAULT" IDENTIFIED BY <pass> DEFAULT TABLESPACE <table_space> TEMPORARY TABLESPACE <table_space> ACCOUNT UNLOCK;
    GRANT UNLIMITED TABLESPACE TO <user_name>;
    GRANT ...;
    ...

## ユーザの削除
CASCADE句を付けるとユーザに紐づくオブジェクトも同時に削除される。
    DROP USER <user_name> CASCADE;

## パスワード
### パスワードの更新
    ALTER USER SCOTT IDENTIFIED BY <password>;

### 管理ユーザのパスワード更新
管理ユーザのパスワード更新はOS認証によるログインを行う必要がある。
    SET ORACLE_SID=REYDB
    SQLPLUS / AS SYSDBA
    SQL> ALTER USER SYSTEM IDENTIFIED BY <password>;
    SQL> ALTER USER SYS IDENTIFIED BY <password>;

### パスワードの無期限化
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

### パスワードの大文字小文字の無視
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON=FALSE SCOPE=BOTH;

## ユーザのロックの確認
次のSQLでユーザがロックされているか確認ができる。
    SELECT USERNAME, ACCOUNT_STATUS, FROM DBA_USERS WHERE USERNAME = ' <user_name>';

## ユーザのロックの解除
    ALTER USER <user_name> ACCOUNT UNLOCK;

# テーブル
## オブジェクト管理テーブル
OracleにはOracleのオブジェクトを管理するテーブルがある。

    テーブル名称     対象オブジェクト
    --------------------------------------------------------------
    USER_TAB_COLUMNS ログインユーザが所有しているオブジェクト
    ALL_TAB_COLUMNS  ログインユーザがアクセスできるオブジェクト
    DBA_TAB_COLUMNS  データベース内すべてのオブジェクト

これらのテーブルに共通の、主要な列を示す。
    列名            説明
    ----------------------------------------------------------------------
    OWNER         所有者
    TABLE_NAME    テーブルの名称
    COLUMN_NAME   列の名称
    DATA_TYPE     列のデータ型 
    DATA_LENGTH   列のバイト単位の長さ 
    DATA_SCALE    数値の小数点以下の桁 
    NULLABLE      列のNULL制約の有無。NULL制約がある場合はNそうでなければY
    DATA_DEFAULT  列のデフォルト値 

# SQLPlus
SQLPlusはクライアントからサーバに接続するツールである。

## 接続設定
クライアントから接続するときに識別子は'tnsnames.ora'で管理されている。
    {oracle_home}/product/{version}/client_1/network/admin/tnsnames.ora

サンプルファイルがsampleの下にある。

Oracle Net Configuration Assistantを用いて設定すると次のような記述が追加される。
    <alias> =
      (DESCRIPTION =
        (ADDRESS_LIST =
          (ADDRESS = (PROTOCOL = TCP) (HOST = 192.xxx.xxx.xxx) (PORT = 1521)))
        (CONNECT_DATA = (SERVICE_NAME = <oracle_sid>)))
    <alias> -- SQLPlusで使用するエイリアス
    <oracle_sid> -- オラクルのSID

# Oracle Data Pump
Oracle 10gから導入されたテクノロジー。

論理バックアップの取得やデータベース間のデータ移動を可能にする。

Oracle Data Pumpを使用する作業項目は次の通り。
- 移行元
  - ダンプファイルをエクスポートするフォルダを作成
  - ディレクトリオブジェクトの作成
  - ディレクトリオブジェクトの権限付与
  - オブジェクトのエクスポート
- 移行先
  - ダンプファイルをインポートするフォルダを作成
  - ディレクトリオブジェクトの作成
  - ディレクトリオブジェクトの権限付与
  - invalidオブジェクトを再コンパイルする

## ディレクトリオブジェクトの作成と権限の付与
Oracle Data Pumpを使用するにはディレクトリオブジェクトの作成と権限の付与が必要になる。

'DATA_PUMP_DIR'というディレクトリオブジェクトを作成してユーザ<user>に権限を付与する例を示す。
    CREATE OR REPLACE DIRECTORY DATA_PUMP_DIR AS 'C:\app\oracle\admin\dpdump';
    GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO <user>;

次のSQLで定義されているディレクトリオブジェクトを確認できる。
    SELECT DIRECTORY_NAME, DIRECTORY_PATH FROM ALL_DIRECTORIES;

## データのエクスポート
あるスキーマをエクスポートする例を示す。
    expdp system/******@<oracle_sid> DIRECTORY=DATA_PUMP_DIR DUMPFILE=EXPDAT.DMP SCHEMAS=<schema>

## データのインポート
先にエクスポートしたダンプファイルをインポートする例を示す。
    impdp system/******@<oracle_sid> DIRECTORY=DATA_PUMP_DIR DUMPFILE=EXPDAT.DMP SCHEMAS=<schema> NOLOGFILE=y

## オブジェクトのリビルド
次のSQLで無効なオブジェクトがないか確認する。
    SELECT OWNER, OBJECT_TYPE, STATUS, OBJECT_NAME FROM ALL_OBJECTS WHERE STATUS='INVALID';

無効なオブジェクトがある場合は次のファンクションを実行する。
    $ SQLPlus / as sysdba
    SQL> CALL UTL_RECOMP.RECOMP_SERIAL('NEW_ONE');

### インポート先の変更
インポート時にエクスポート時の環境と異なる場合に次のオプションを指定する。

    オプション       意味
    -------------------------------------------------------------
    REMAP_SCHEMA     export時と異なるスキーマにimportする
                     例) FROMスキーマからTOスキーマに変更する場合
                     REMAP_SCHEMA=FROM:TO
    REMAP_TABLESPACE export時と異なる表領域にimportする
                     例) FROM表領域のオブジェクトをTO表領域にimportする場合
                     REMAP_TABLESPACE=FROM:TO

## 主要なオプション
主要なオプションを示す。

    オプション  意味
    -------------------------------------------------------------
    DUMPFILE    <data_pump_dir>:<file_name>
    TABLES      テーブル名を指定
    SCHEMAS     スキーマ名を指定
    TABLESPACES 表領域名を指定
    FULL        FULL=Y  でデータベース全体を指定
    CONTENT     CONTENT=data_only 表のデータのみ
                CONTENT=metadata_only 表の定義のみ
                CONTENT=all(デフォルト) 表のデータと定義の両方
    NOLOGFILE   NOLOGFILE=y で、ログファイルの出力を行わない
    EXCLUDE     一部のオブジェクトを除く
