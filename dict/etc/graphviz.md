graphviz

# 概要
graphvizはグラフを描画するためのソフトウェア群である。

# dot
dotはdot言語を解釈してグラフを生成するプログラムである。

## Synopsis

    dot [OPTION]... [FILE]...

## Options
主要なオプションを以下に示す。

    -T FORMAT
        指定したFORMATで出力する。
        有効なFORMATの一部を以下に示す。
        - bmp
        - gif
        - jpeg
        - pdf
        - plain
        - png
        - svg
    -o FILE
        指定したFILEに出力する。
    -O
        入力ファイルにTオプションの拡張子を付与したファイルを出力する。

## Examples
ファイルinput.dotを引数にfoo.pngを出力する。

    $ dot -Tpng -ofoo.png input.dot

標準入力からouput.svgを出力する。

    $ echo 'digraph { a -> b }' | dot -Tsvg > output.svg

# dot言語
dot言語はdotが解釈する言語である。

## BMF

    graph = [strict] (graph | digraph) [ ID ] '{' stmt_list '}'
    stmt_list = [ stmt [ ';' ] stmt_list ]
    stmt = node_stmt
            | edge_stmt
            | attr_stmt
            | ID '=' ID
            | subgraph
    attr_stmt = (graph | node | edge) attr_list
    attr_list = '[' [ a_list ] ']' [ attr_list ]
    a_list = ID '=' ID [ (';' | ',') ] [ a_list ]
    edge_stmt = (node_id | subgraph) edgeRHS [ attr_list ]
    edgeRHS = edgeop (node_id | subgraph) [ edgeRHS ]
    node_stmt = node_id [ attr_list ]
    node_id = ID [ ':' port ]
    port = ID [ ':' compass_pt ]
            | compass_pt
    subgraph = [ subgraph [ ID ] ] '{' stmt_list '}'
    compass_pt = n | ne | e | se | s | sw | w | nw | c | _

Cスタイルのコメントをサポートする。即ち、`//`から行末までと`/*`から`*/` で囲まれた文字列は無視される。

## Examples

    digraph {
    
      /* graph settings, reserved word. */
      graph [
        layout = dot
        rankdir = LR
        newrank = true
      ]
    
      /* common node settings, reserved word. */
      node [
        style=filled
        shape=rect
      ]
    
      /* common edge settings, reserved word. */
      edge [
        fontname="Helvetica,Arial,sans-serif"
        labeldistance=3
        labelfontcolor="#00000080"
      ]
    
      /* changes node settings. */
      changes [
        color="#88000022"
      ]
    
    }

# See also
- [Graphviz: Gallery](https://graphviz.org/gallery/)
