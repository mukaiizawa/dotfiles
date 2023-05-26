cron

# cron
`cron`は、unix系OSのjob schedulerである。

# crontab
`cron`へのjobの登録は`crontab`によって行う。

    $ crontab -e

コマンドを実行すると、設定ファイルがエディタによって開かれる。ファイルの各行はjobに対応する。

    +------------ minute (0 - 59)
    | +---------- hour (0 - 23)
    | | +-------- day of the month (1 - 31)
    | | | +------ month (1 - 12)
    | | | | +---- day of the week (0 - 6) (Sunday to Saturday)
    | | | | |
    | | | | |
    | | | | |
    * * * * * <command to execute>

`l` optionでjobの一覧を表示できる。

    $ crontab -l
    * * * * * ls

`u` optionでuserを指定できる。optionを省略した場合はlogin userを指定したものと見做される。

    $ crontab -euroot
