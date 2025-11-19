コードスニペット

# UACによる権限昇格

    $ Start-process cmd -Verb runas

# wslが起動しない場合

    $ Start-processes cmd -Verb runas
    $ Restart-Service -Name vmcompute,vmms -Verbose -PassThru
