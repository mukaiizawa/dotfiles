PostgreSQL

# psql

    psql -h 192.168.xxx.xxx -U postgres -d postgres -f xxx.sql

## pgpass.conf
pgpass.confを作成すると認証情報をpsqlに渡す必要がなくなる。

    C:/Users/xxx/AppData/Roaming/postgresql/pgpass.conf
    # pgpass.conf
    # hostname:port:database:username:password
    192.168.xxx.xxx:5432:postgres:postgres:xxxx
    ...

# kill session

    SELECT pg_terminate_backend(pid)
    FROM pg_stat_activity
    WHERE datname = '<database>' AND pid <> pg_backend_pid();
    
    <database> -- database name.

# export
## script形式
以下の書式で標準出力にpsqlが解釈可能なsqlを出力する。

必要に応じてリダイレクトするとよい。

    pg_dump -h <host> -p <port> -U <user> -d <database> -n <schema>
    
    <host> -- host name.
    <port> -- port no.
    <user> -- user name.
    <database> -- database name.
    <schema> -- schema name.

## archive形式
以下の書式で標準出力にpg_restoreが解釈可能なバイト列を出力する。

    pg_dump -Fc <database>
    
    database -- database name.

# import
## script形式

    psql -h localhost -U postgres -d <database>
    # DROP SCHEMA IF EXISTS <schema> CASCADE;
    psql -h localhost -U postgres -d <database> -f xxx.dump

## archive形式
以下の書式でダンプファイルからリストアを行う。

    pg_restore -h <host> -d <database> -C <dump>
    
    -C -- create database before restore.
    dump -- dump file name.

事前にデータベースを削除する場合は以下のようにする。

    DROP DATABASE IF EXISTS <database>;
    
    <host> -- host name.
    <port> -- port no.
    <database> -- database name.
