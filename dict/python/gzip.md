gzip module

# 読み込み
gz圧縮されたファイルを一行ずつ処理。

    with gzip.open(gz,'r') as fp:
        for line in fp:
            write(line)

# 書き込み
テキストファイルをgz圧縮。

    with open(txt, 'rb') as fin:
        with gzip.open(gz, 'wb') as fout:
            fout.writelines(fin)
