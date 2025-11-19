コードスニペット

# UACによる権限昇格

    $ powershell Start-process cmd -Verb runas

# wslが起動しない場合
要管理者権限。

    $ powershell Start-processes cmd -Verb runas
    $ Restart-Service -Name vmcompute,vmms -Verbose -PassThru
