DDL

# 概要
データ定義言語(DDL)についてまとめる。
ここで述べる言語の書式は不完全で、本質が分かりやすくするための誤りも含まれる。
また、DDLを使用するには、それなりの権限が必要。

# GRANT
GRANT文はあるユーザに対してシステム権限またはオブジェクト権限を付与する。

## 書式
    GRANT {sys_privilege | obj_privilege_list ON obj_name} TO user [, user]... ;
    obj_privilege_list ::= {ALL | obj_privilege [, obj_privilege]...}
    obj_privilege ::= {INSERT | DELETE | UPDATE | SELECT | REFERENCES}

引数の定義を下に示す。
    引数          定義
    -------------------------------------------------------------------
    sys_privilege ユーザに与えるシステム権限。
    obj_privilege ユーザに与えるオブジェクト権限。
    obj_name      このオブジェクトに対するオブジェクト権限をユーザに与える。
    user          指定した役割を与えるユーザ。

# REVOKE
REVOKE文はGRANTで付与した権限を取り消す。

## 書式
    REVOKE {sys_privilege | obj_privilege_list ON obj_name} TO user [, user]... ;

REVOKE文はGRANTとついになっている。
引数の定義はGRANTを参考のこと。

# USER
## 書式
    CREATE USER user IDENTIFIED BY password ;
    DROP USER user [CASCADE] ;

引数の定義を示す。
    引数    定義
    ------------------------------------------------------------------
    CASCADE ユーザに紐づけられたオブジェクトをすべて削除する。

## 注意事項
11g以降Oracleではデフォルトでパスワードの大文字小文字は区別する。
次の手順で大文字小文字を区別しているか確認できる。
    SHOW PARAMETER SEC_CASE_SENSITIVE_LOGON
次のSQLでパスワードの大文字小文字の判別有無を指定可能。
    ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = FALSE SCOPE = BOTH;

# VIEW
## 書式
    CREATE [OR REPLACE] VIEW [schema .] view [( alias [, alias]...)] AS
    subquery ;
    DROP [schema .] VIEW view [{CASCADE | RESTRICT}] ;

引数の定義を示す。
    引数       定義
    -------------------------------------------------------------------------
    OR REPLACE ビューがすでに存在する場合は再作成する。
    schema     ビューを作成するスキーマ。省略時は現在のスキーマに作成。
    view       ビューの名前。
    alias      ビューの問合せに選択された式の名前。
    subquery   ビューを作成する対象を選択するクエリ。
    CASCADE    削除するビューに依存するオブジェクトを削除する。
    RESTRICT   削除するビューに依存するオブジェクトがある場合エラーと見做す。
               (default)

# TABLE
## 書式
    CREATE TABLE [schema .] table_name (
        rerational_props [, rerational_props]...
    );
    rerational_props ::= column_definition | out_of_line_constraint
    column_definition ::=
        column datatype [DEFAULT default_value]
            [inline_constraint [, inline_constraint] ...]
    out_of_line_constraint ::=
        [CONSTRAINT constraint_name]
            UNIQUE (column_list)
            | PRIMARY KEY (column_list)
            | FOREIGN KEY (column_list) references_clause
            | CHECK ( condition )
    inline_constraint ::=
        [CONSTRAINT constraint_name]
            [NOT] NULL
            | UNIQUE
            | PRIMARY KEY
            | references_clause
    references_clause ::=
        REFERENCES [schema .] table ( column_list )
        [ON DELETE {CASCADE | SET NULL}]
    column_list ::= column [, column]

引数の定義を示す。
    引数           定義
    -------------------------------------------------------------------
    datatype       定義する列の型。副問い合わせ使用時は使用不可。
    DEFAULT        列の初期値指定。
    default_value  列の初期値。
    CONSTRAINT     制約の定義。
    UNIQUE         一意制約。
    PRIMARY KEY    主キー制約。
    FOREIGN KEY    外部キー制約。
    REFERENCES     外部キー制約を指定する際の参照先。
    foreign_table  外部キーを指定するテーブル。
    CHECK          検査制約。

# 表制約
表の制約は作成後に追加、更新、削除することが可能。

## 書式
### 制約の追加
制約の追加の書式を示す。
    ALTER TABLE [schema .] table ADD　CONSTRAINT constraint_name {
        UNIQUE (column [, column …])
        | PRIMARY KEY (column [, column ...])
        | FOREIGN KEY (column [, column ...])
        | [schema .] object [(column)] [ON DELETE { CASCADE | SET NULL }]
        | CHECK (condition)
    };

### NOT NULL 制約の追加
NOT NULL制約は追加ではなく、変更の扱いとなる。
    ALTER TABLE [schema .] table MODIFY (column NOT NULL);

### 表制約の削除
表制約を削除するには、制約名を指定して削除する。
    ALTER TABLE [schema .] table DROP CONSTRAINT constraint_name [CASCADE];
