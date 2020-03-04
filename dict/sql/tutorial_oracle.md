Oracle tutorial

# 概要
Oracleデータベース固有の覚書をまとめる。

# ログファイル
12cでは次のパスにログが出力される。

    oracle/gdiag/rdbms/<SID>/<SID>/trace/<SID>_xxx.trc

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

# PFILE/SPFILE
Oracleには初期化パラメータを指定するファイルが二種類存在し、それぞれPFILE(パラメーターファイル)とSPFILE(サーバパラメーターファイル)という。

## PFILE/SPFILEの確認
次のSQLを実行するとSPFILEが使用されている場合は、結果にその場所が表示される。

    SHOW PARAMETER PFILE
    SHOW PARAMETER SPFILE

## PFILE/SPFILEの作成
PFILE(SPFILE)を作成するには次の方法がある。

- エディタで編集(PFILE)
- SPFILE(PFILE)から作成
- メモリから作成

PFILE(SPFILE)を作成するには次の書式を用いる。

    CREATE <dest> = ' <dest_path> ' FROM { MEMORY | <src> } = ' <src_path> ' };
    <dest> ::= { PFILE | SPFILE }
    <src> ::= { SPFILE | PFILE }
    <dest_path> -- 作成するPFILE(SPFILE)の場所
    <src_path> -- 作成元のSPFILE(PFILE)の場所
    ただし、<dest>と<src>が同一であってはならない。

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
    DROP USER <user_name> [CASCADE];

## パスワード
### パスワードの更新

    ALTER USER <user> IDENTIFIED BY <password>;

### 管理ユーザのパスワード更新
管理ユーザのパスワード更新はOS認証によるログインを行う必要がある。

    SET ORACLE_SID=<oracle_sid>
    SQLPLUS / AS SYSDBA
    SQL> ALTER USER SYSTEM IDENTIFIED BY <password>;
    SQL> ALTER USER SYS IDENTIFIED BY <password>;

### パスワードの無期限化

    ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

### パスワードの大文字小文字の無視

    ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON=FALSE SCOPE=BOTH;

## ユーザのロックの確認
次のSQLでユーザがロックされているか確認ができる。

    SELECT USERNAME, ACCOUNT_STATUS, FROM DBA_USERS WHERE USERNAME = ' <user_name> ';

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

## 表制約管理テーブル
Oracleには表の制約を管理してるテーブルがある。

制約は次の通り。

    制約名          概要
    ----------------------------------------------------------------------
    NOT NULL制約    列の値がNULL以外の値であること。
    UNIQUE制約      列の組の値が表内で一意であること。
                    ただしNULLは例外として複数存在しても構わない。
    PRIMARY KEY制約 その列によって表内で行を一意に識別できること。
                    この制約は表に対して一つまで定義可能。
                    また、NULLも許可しない。
    REFERENCES制約  指定した列の参照先が存在していること。
    CHECK制約       列の値が指定した条件をに対してTRUEまたはUNKNOWNであること。

Oracleでは、表制約は次のテーブルから確認可能。

    テーブル名称     対象オブジェクト
    --------------------------------------------------------------
    USER_CONSTRAINTS ログインユーザが所有している制約
    ALL_CONSTRAINTS  ログインユーザがアクセス可能な制約
    DBA_CONSTRAINTS  データベース内のすべての制約


## テーブル定義の更新
テーブルの列の追加、更新はALTER文を使用する。

    <query> ::= ALTER TABLE <table_name> { ADD | MODIFY } (
                    <expr>
                    [, <expr>] ...
                );
    <expr> ::= <column_name> <type> [<constraints>]
    <type> :;= VARCHAR2(xx) | NUMBER(xx) | etc...

# SQLPlus
SQLPlusはクライアントからサーバに接続するツールである。

## リスナーを経由しない接続
DBサーバなど、直接ログインできる環境においては、リスナーを経由せずに接続可能。

ただし、環境変数`ORACLE_HOME`が設定されている必要がある。

    set oracle_home=xxx
    sqlplus system/<pass>

## 接続設定
クライアントから接続するときの識別子は'tnsnames.ora'で管理されている。

    <oracle_home>/product/<version>/client_1/network/admin/tnsnames.ora

サンプルファイルが同ディレクトリ内のsampleディレクトリ内にある。

Oracle Net Configuration Assistantを用いて設定すると次のような記述が追加される。

    <alias> =
      (DESCRIPTION =
        (ADDRESS_LIST =
          (ADDRESS = (PROTOCOL = TCP) (HOST = 192.xxx.xxx.xxx) (PORT = 1521)))
        (CONNECT_DATA = (SERVICE_NAME = <oracle_sid>)))
    <alias> -- SQLPlusで使用するエイリアス
    <oracle_sid> -- オラクルのSID

## ファイル読み込み

    sqlplus -L -S <user>/<pass>@<sid> @<file>

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

`DATA_PUMP_DIR`というディレクトリオブジェクトを作成してユーザ<user>に権限を付与する例を示す。

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

無効なオブジェクトがある場合は次のクエリを実行する。

    $SQLPlus / as sysdba
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
                     表領域を複数マップする場合は次の書式となる。
                     REMAP_TABLESPACE=(FROM:TO,FROM2:TO2, ... ,FROMN:TON)

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

# ホストのIPアドレスの変更手順
OracleデータベースをインストールしたホストのIPアドレスを変更する一例を示す。

## spfileの修正
spfile内にホストのIPアドレスを保持していることがあるため次の手順で修正を行う。

現在のspfileの場所を取得し、spfileからpfileの作成。

    sqlplus / as sysdba
    SELECT VALUE FROM V$SYSTEM_PARAMETER WHERE NAME = 'spfile';
    CREATE PFILE='<spfile_dir>\initORCL.ORA' FROM SPFILE;

pfileをテキストエディタで編集し、pfileからspfileを生成する。

    CREATE SPFILE='<spfile>' FROM PFILE='<spfile_dir>\initORCL.ora';

## oraファイルの変更
以下の場所のファイルのIPアドレスを修正する。

    <oracle_home>\NETWORK\ADMIN\listener.ora
    <oracle_home>\NETWORK\ADMIN\tnsnames.ora
    <oracle_home>\NETWORK\ADMIN\sqlnet.ora

Oracleのサービスを再起動して、リスナーを介した接続が可能になっていれば成功である。
