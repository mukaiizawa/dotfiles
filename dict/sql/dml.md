DML

# 概要
データ操作言語(DML)についてまとめる。

ただし、ここで述べる言語の書式は使用頻度の高いものに限る。

# SELECT
## 書式
    <query> ::=
        SELECT [ { DISTINCT | ALL } ] { * | <c_selection> [, <c_selection>] ...}
        FROM { ( <subquery> ) | [<schema> .] { <table> | <view> } } [<t_alias>]
        [WHERE <condition>]
        [GROUP BY <column> [, <column>] ... [HAVING <condition>]]
        [ORDER  BY <order_by_clause> [, <order_by_clause>] ...]
        [{ INTERSECT | UNION [ALL] | MINUS } query] ;
    <c_selection> ::=
        [<schema> .] { <table> | <view> | <t_alias> } . <column> [AS <c_alias>]
    <order_by_clause> ::= { <column> | <position> } [ ASC | DESC ]

以下に、使用している字句の意味を示す。
    引数      定義
    ----------------------------------------------------------------------
    SELECT    指定した列を抽出する。
    DISTINCT  重複行を取り除いた結果を返す。
    ALL       重複行をそのまま返す。(default)
    FROM      抽出する対象を指定する。
    *         すべての列を対象とする。
    c_alias   列の別名を指定する。
              指定した別名はorder_by_clauseの中でのみ使用可能。
    t_alias   表の別名を指定する。
              別名を指定した場合は、その表は別名を使用する必要がある。
    subquery  副問い合わせ
    WHERE     抽出する条件を指定する。
    GROUP BY  指定した対象ごとに、単一の行にする。
    HAVING    集約した行に対しての抽出条件を指定する。
    ORDER BY  行の選択順を指定する。
    ASC       昇順(default)
    DESC      降順
    INTERSECT 抽出した行の共通部分を返す。
    UNION     抽出した行の和を返す。ただし、重複行は取り除く。
    UNION ALL 抽出した行の和を返す。
    MINUS     抽出した行の差を返す。

# UPDATE
## 書式
    <query> ::=
        UPDATE [<schema> .] { <table> | <view> } [ <t_alias> ]
        SET <update_clauses>
        [WHERE condition] ;
    <c_selection> ::= <column> = { <expr> | <subquery> }
    <update_clauses> ::= <update_clause> [, <update_clause>] ... 
    <update_clause> ::= {
        <column> = { <expr> | ( <subquery> ) }
        | ( <column> [, <column>] ...) = ( <subquery> )
    }

以下に、使用している字句の意味を示す。
    引数      定義
    ----------------------------------------
    SET       更新する項目と値を指定する。
    WHERE     更新する対象の条件を指定する。
    subquery  副問い合わせ

# DELETE
## 書式
    <query> ::=
        DELETE FROM [<schema> .] { <table> | <view> }
        [WHERE condition] ;

以下に、使用している字句の意味を示す。
    引数        定義
    --------------------------------------
    DELETE FROM 削除対象を指定。
    WHERE       対象の抽出条件の指定。
    subquery    副問い合わせ。

# INSERT
## 書式
    <query> ::= INSERT INTO <t_expr_clause> { <values_clause> | <subquery> } ;
    <t_expr_clause> ::= {
        [<schema> .] { <table> | <view> }
        | ( <subquery> )
    }
    <values_clause> ::= VALUES ( <expr> [, <expr>] ... )

以下に、使用している字句の意味を示す。
    引数        定義
    --------------------------------------
    INSERT INTO 挿入対象の指定。
    VALUES      挿入値の指定。
    subquery    副問い合わせ。
