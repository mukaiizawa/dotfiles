package bufio

# 概要
バッファリング機能をもつI/Oを提供する。

# Reader
## Readerの生成
func NewReader(rd io.Reader) *Reader
バッファサイズがデフォルトのReaderを返す。
## 先読み
func (b *Reader) Peek(n int) ([]byte, os.Error)
Peekは次のnバイト先読みする。
Peekがnバイトより少ない値を返す場合はその理由も返される。
## 一文字読み込み
func (b *Reader) ReadRune() (rune int, size int, err os.Error)
ReadRuneはUTF-8エンコードされた文字を一文字読み込みruneに設定する。
読み込んだバイト数はsizeに設定する。
