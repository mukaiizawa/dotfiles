Cookie

# 概要
このドキュメントではHTTPヘッダのCookieについてまとめる。
また、ここに書いてある内容はすべて網羅しているわけではない。

# Cookieの設定
クッキーはHTTPレスポンスのSet-Cookieヘッダフィールドを用いて設定する。
    Set-Cookie: name=value [; attribute] ...
    attribute ::= {
        Domain=domain
        | Path=path
        | Max-Age=sec
        | Expires=date_time
        | Secure
    }
    name -- クッキーの名前
    value -- クッキーの値
    domain -- クッキーの有効なドメイン
    path -- クッキーの有効なパス
    sec -- クッキーの生存時間[sec]
    date_time -- クッキーを破棄する日時
各属性については後述する。
複数のクッキーを指定する場合は、その数だけヘッダを用意する。
    Set-Cookie: cookie1=val1
    Set-Cookie: cookie2=val2
    ...
## Domain属性
Domain属性はクッキーの送信するドメインを指定する。
この属性が指定された場合、指定されたドメインとそのサブドメインのみに送信される。
例えば、次のクッキーを仮定する。
    Set-Cookie: name=val; Domain=exsample.com
この場合、次のURLでは送信される。
    http://exsample.com
    http://y.exsample.com
    http://z.exsample.com
次のURLでは送信されない。
    http://exsample.x.com
Domain属性が指定されていない場合は、
このクッキーを設定したホストのみがクッキーの送信対象となる。
また、この属性値は現在のホスト名を含むものでなければならない。
現在のホスト名が含まれていない場合は無視される。
## Path属性
Pathはクッキーが送信されるURLの範囲を指定する属性である。
次のSet-Cookieヘッダで設定されたクッキーを考える。
    Set-Cookie: name=val; path=/foo
この場合、クッキーはURLに/fooが含まれていない場合は送信しない。
Path属性が省略された場合は、現在のURLのパスが設定される。
すべてのURLでクッキー送信させるには次のように指定する。
    Set-Cookie: name=val; path=/
## Max-Age属性
クッキーの生存時間を秒数で指定する。
次の例は、生存期間を一時間としたものである。
    Set-Cookie: name=val; max-age=3600
後述するExpires属性がある場合、こちらを常に優先する。
Expires属性とMax-Age属性が指定されていない場合、
ブラウザ終了時にクッキーは破棄される。
## Expires属性
クッキーを破棄する時刻を指定する。
書式は別途調べること。
## Secure属性
Secure属性を指定すると、このクッキーはHTTPS通信でしか送信されなくなる。
秘匿する必要があるクッキーは必ずこの属性を指定しなければならない。

# Cookieの参照
CookieはHTTPリクエストのCookieヘッダとしてクライアントからサーバに送られる。
書式はSet-Cookieと同じである。
