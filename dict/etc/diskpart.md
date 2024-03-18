# diskpart
diskpart コマンドインタープリターは、コンピューターのドライブ (ディスク、パーティション、ボリューム、または仮想ハード ディスク) を管理するためのプログラムである。

## 指定したパーティションを限界まで縮小

    $ diskpart
    list disk
    select disk N
    list partition
    select partition N
    shrink
    exit
