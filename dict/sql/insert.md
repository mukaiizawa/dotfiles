# レコードの挿入
INSERT INTO
<TABLE>(
  <COLUMN>
  [,<COLUMN>]*
)
VALUES(
  <VALUE>
  [,<VALUE>]*
);

INSERT INTO
<TABLE1>(
  <COLUMN>
  [,<COLUMN>]*
)
SELECT
  <COLUMN>
  [,<COLUMN>]*
FROM <TABLE>
[WHERE <CONDITION>];

# 複数行INSERT
## Oracle
Oracleでは複数レコード同時に登録するには以下の文法を用いることができる。
それにより、INSERTを省くことができる。
ただし、最後にSELECT * FROM DUAL;を追加する必要がある。

INSERT ALL
INTO <TABLE> VALUES (<VALUE> [,<VALUE>]*)
INTO <TABLE> VALUES (<VALUE> [,<VALUE>]*)
...
INTO <TABLE> VALUES (<VALUE> [,<VALUE>]*)
SELECT * FROM DUAL;

この構文は他のテーブルの値を別のテーブルに挿入するときに便利。
INSERT ALL
   INTO TABLE1(T1_R1, T1_R2, T1_R3) VALUES (T3_VAL4, T3_VAL1)
   INTO TABLE2(T2_R1, T2_R1) VALUES (T3_VAL3, T3_VAL2)
SELECT * FROM TABLE3;