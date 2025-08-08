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
    -t
        ヘッダとフッタを省略
    --csv
        CSV形式で出力
    -F DELIM
        DELIM区切りで出力
    -v X=Y
        パラメーターXを値Yで定義する。
        `-v ON_ERROR_STOP=1`などのように組み込みのパラメーターに値を指定する他、
        任意のパラメーターに値を設定して参照することも可能。

## パスワードファイル
認証情報をあらかじめファイルに保存しておくことで、psqlなどで認証を省略することができる。このファイルのことをパスワードファイルという。

パスワードファイルは`~/.pgpass`（windowsの場合は`%APPDATA%\postgresql\pgpass.conf`）または、環境変数`PGPASSFILE`で指定した場所に配置する。

    $ cat C:/Users/xxx/AppData/Roaming/postgresql/pgpass.conf
    # pgpass.conf
    # hostname:port:database:username:password
    192.168.xxx.xxx:5432:postgres:postgres:xxxx
    *:*:*:*:password
    ...

上から順に最初にマッチしたレコードが使用される。

各列にはワイルドカード`*`を使用することが可能。

# pg_dump
よく使うオプションを以下に示す。

    -a
        データのみをダンプし、スキーマをダンプしない。
    -f FILE
        FILEに出力する。
    -C
        ダンプにデータベース生成用コマンドを含める。
    -s
        スキーマのみをダンプし、データはダンプしない。
    -n SCHEMA
        指定したスキーマSCHEMAをダンプする。このオプションは複数回指定可能。
    -t TABLE
        指定したテーブルTABLEをダンプする。このオプションは複数回指定可能。

# export
## script形式
以下の書式で標準出力にpsqlが解釈可能なsqlを出力する。

    $ pg_dump -h localhost -p 5432 -U postgres -d <database> -n <schema> -f <dumpfile>

## archive形式
以下の書式で標準出力にpg_restoreが解釈可能なバイト列を出力する。

    $ pg_dump -Fc <database>

# import
## script形式

    $ psql -h localhost -U postgres -d <database>
    drop schema if exists <schema> cascade;
    $ psql -h localhost -U postgres -d <database> -f xxx.dump

## archive形式
以下の書式でダンプファイルからリストアを行う。

    $ pg_restore -h localhost -U postgres -d <database> -C xxx.dump
    
    -C -- create database before restore.

事前にデータベースを削除する場合は以下のようにする。

    drop database if exists <database>;

# 所有者の変更
`xxx`スキーマのテーブルの所有者を`yyy`に変更するクエリを生成するクエリ。

    select concat('alter table ', schemaname, '.', tablename, ' owner to yyy;')
    from pg_tables
    where schemaname ='xxx'

# セッションの取得・削除
以下のクエリでセッションを確認できる。実行するユーザの権限によって項目がnullになることがあるので注意。

    select * from pg_stat_activity;

確認したセッションは以下の書式でkillすることができる。

    select pg_terminate_backend(pid)
    from pg_stat_activity
    where datname = '<database>' and pid <> pg_backend_pid();
    
    <database> -- database name.

以下のクエリで最大接続数を確認できる。

    show max_connections;

# デッドロックの確認・解除
以下のクエリで取得中のロックが確認できる。

    select l.pid, l.granted, d.datname, l.locktype, relation, relation::regclass, transactionid,l.mode
    from
        pg_locks l
        left join pg_database d on l.database = d.oid
    where l.pid != pg_backend_pid()
    order by l.pid;

問題のあるpidは次のクエリで要求を取消できる。

    select pg_cancel_backend(<pid>);

# テーブル一覧の取得
以下のクエリで該当スキーマに存在するテーブルの一覧を取得できる。

    select schemaname, tablename, tableowner
    from pg_tables
    where schemaname = 'foo';

# DDLの出力
`pg_dump`に`-s`オプションを使用するとデータは対象外となるので、それを利用してDDLを出力できる。

    $ pg_dump -h localhost -U postgres -d <database> -s -n <schema> > ddl.sql

# DBの複製

    $ pg_dump -h <host> -U postgres -d <database> -Fc -f dump_file.dump
    $ createdb -h <host> -U postgres <new_database>
    $ pg_restore -h <host> -U postgres -d <new_database> dump_file.dump
