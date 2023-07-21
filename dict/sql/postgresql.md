PostgreSQL

# psql

    $ psql -h192.168.xxx.xxx -p5432 -Upostgres -dpostgres
    
    -q
        静かに実行
    -c QUERY
        QUERYを実行
    -f FILE
        FILEからクエリを読み込んで実行
    -A
        桁そろえなしで出力
    --csv
        CSV形式で出力
    -F DELIM
        DELIM区切りで出力

## pgpass.conf
pgpass.confを作成すると認証情報をpsqlに渡す必要がなくなる。

    $ cat C:/Users/xxx/AppData/Roaming/postgresql/pgpass.conf
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

    $ pg_dump -h localhost -p 5432 -U postgres -d <database> -n <schema>

## archive形式
以下の書式で標準出力にpg_restoreが解釈可能なバイト列を出力する。

    $ pg_dump -Fc <database>

# import
## script形式

    $ psql -h localhost -U postgres -d <database>
    DROP SCHEMA IF EXISTS <schema> CASCADE;
    $ psql -h localhost -U postgres -d <database> -f xxx.dump

## archive形式
以下の書式でダンプファイルからリストアを行う。

    $ pg_restore -h localhost -U postgres -d <database> -C xxx.dump
    
    -C -- create database before restore.

事前にデータベースを削除する場合は以下のようにする。

    DROP DATABASE IF EXISTS <database>;
