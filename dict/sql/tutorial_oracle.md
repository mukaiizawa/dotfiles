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

## パスワードの更新
    ALTER USER SCOTT IDENTIFIED BY <password>;

## 管理ユーザのパスワード更新
管理ユーザのパスワード更新はOS認証によるログインを行う必要がある。
    SET ORACLE_SID=REYDB
    SQLPLUS / AS SYSDBA
    SQL> ALTER USER SYSTEM IDENTIFIED BY <password>;
    SQL> ALTER USER SYS IDENTIFIED BY <password>;

## パスワードの無期限化
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

## パスワードの大文字小文字の無視
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON=FALSE SCOPE=BOTH;

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

# impdb
impdbはデータベースにテーブルやスキーマなどをインポートするためのツールである。

## 書式
    IMPDP <USER>/<PASS>@<SID> DUMPFILE=<DMPFILE> LOGFILE=<LOGFILE> SCHEMAS=<SCHEMA> [REMAP_TABLESPACE=<FROM>:<TO>]*

## 注意事項
従来のimpとは互換性がない。別のDBから表領域を指定し直してインポート可能。
