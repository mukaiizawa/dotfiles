マークダウンチュートリアル

# 見出し
`#`から始まる行は見出しと見做す。
    # title1
    ## title2
    ### title3
    #### title4
    ##### title5
    ###### title6

# ハイパーリンク
`[表示文字](リンク先URL)`と記述することにより、リンク先URLへのハイパーリンクと見做す。

# リスト
`-`, `+`, `*`のいずれかで始まる行をリスト、`1.`で始まる行を順序付きリストと見做す。

インデントによりネストしたリストを表現できる。

順序付きリストは同じ番号を用いてもよい。そうすることにより保守が楽になる。

    - list1
        - nested_list1
        - nested_list2
    - list2
    - list3

    1. orderd_list1
        1. nested_orderd_list1
        1. nested_orderd_list2
    1. orderd_list2
    1. orderd_list3

# 引用
`>`から始まる行は引用文と見做す。

ネストすることにより引用の引用を表すことができる。

    > quotation1
    > quotation1
    > quotation1
    >> quotation2
    >> quotation2
    >> quotation2

# 強調
`*`または`_`で囲まれた文字を強調文字と見做す。

    *emphasis*
    __emphasis__

# 水平線
`_`, `*`, `-`を3つ以上連続した場合水平線と見做す。

# ソースコード
インラインでソースコードを埋め込む場合はバッククォートで囲む。

半角スペース4つから始まる行はソースコードと見做す。
