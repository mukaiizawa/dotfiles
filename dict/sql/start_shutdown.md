データベースの起動と停止

# 概要
Oracleデータベースの起動と停止についてまとめる。

# 起動
次の手順で起動を行う。
1. データベースのホストマシンでオペレーティングシステム認証を用いてsqlplusを起動
    SQLPLUS / AS SYSDBA
2. STARTUPを実行
    SQL> STARTUP

# 停止
次の手順でデータベースを停止する。
1. データベースのホストマシンでオペレーティングシステム認証を用いてsqlplusを起動
    SQLPLUS / AS SYSDBA
2. シャットダウンを実行
    SQL> SHUTDOWN IMMEDIATEk
