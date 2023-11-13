cron

# cron
`cron`は、unix系OSのjob schedulerである。jobの登録は`/etc/crontab`の編集によって行う。

    # Example of job definition:
    # +---------------- minute (0 - 59)
    # |  +------------- hour (0 - 23)
    # |  |  +---------- day of month (1 - 31)
    # |  |  |  +------- month (1 - 12) OR jan,feb,mar,apr ...
    # |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    # |  |  |  |  |
    # *  *  *  *  * user-name  command to be executed
    * * * * * root echo 'foo'

# crontab
`crontab`を用いると、ユーザ単位で`cron`を管理できる。

`e` optionを指定すると、ログインユーザで実行するjobを定義できる。書式はuserが指定できない点を除いて`/etc/crontab`と同一である。

    $ crontab -e

    # Example of job definition:
    # +---------------- minute (0 - 59)
    # |  +------------- hour (0 - 23)
    # |  |  +---------- day of month (1 - 31)
    # |  |  |  +------- month (1 - 12) OR jan,feb,mar,apr ...
    # |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    # |  |  |  |  |
    # *  *  *  *  *  command to be executed
    * * * * * echo 'foo'

`u` optionでuserを指定できる。

    $ crontab -euroot

`l` optionでjobの一覧を表示できる。

    $ crontab -l
    * * * * * echo 'foo'

# cron実行結果の確認
`cron`の実行結果は以下のファイルに出力される。

    /var/log/cron
