curl

# curl

    curl [options...] <url>

## options

    -d
        HTTP POST dataを指定する。
    -i
        HTTP response headersを表示する。
    -I
        HTTP response headersのみ表示する。
    -s
        silent modeで実行する。
    -k
        セキュアでないサーバへの接続を許可する。
    -X METHOD
        METHODでリクエストを行う。デフォルトはGET。

# Examples
## JSONをPOST

    $ curl -X POST "https://example.com/spam" -H 'Content-Type: application/json' -d'{ "name": "Tanaka", "age": 26 }'
