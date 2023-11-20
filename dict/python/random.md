random module

# 乱数生成期の初期化

    >>> random.seed(10000000)

# ランダムなバイト列の生成

    >>> random.randbytes(8)
    b'\xaf\x0e\xa2\x8f\xc4\x16(\xec'

# ランダムな要素を取得

    >>> random.choice(range(10))
    5

# ランダムな範囲から整数を取得

    >>> random.randrange(10)
    5
    >>> random.randrange(5, 10)
    8

# ランダムな整数を取得
指定した範囲（含む）から整数を取得する。

    >>> random.randint(0,1)
    1
    >>> random.randint(0,1)
    0

# ランダムに撹拌

    >>> l = list(range(1, 10))
    >>> random.shuffle(l)
    >>> l
    [5, 7, 8, 2, 1, 9, 4, 6, 3]
