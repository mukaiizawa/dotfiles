--
-- Copyright (c) 1988, 2005, Oracle.  All Rights Reserved.
--
-- NAME
--   glogin.sql
--
-- DESCRIPTION
--   SQL*Plus global login "site profile" file
--
--   Add any SQL*Plus commands here that are to be executed when a
--   user starts SQL*Plus, or uses the SQL*Plus CONNECT command.
--
-- USAGE
--   This script is automatically run
--

-- コマンド	説明 -- {{{
-- SET APPINFO	スクリプトの進行状況などを設定
-- SET ARRAYSIZE	DBMS_OUTPUT のバッファ、データベースから一度にフェッチ
する配列の大きさ
-- SET AUTOCOMMIT	オートコミットの有効／無効
-- SET AUTOPRINT	バインド変数 の自動表示
-- SET AUTORECOVERY	RECOVERY コマンドのアーカイブログファイル名を自動補
完する／しない
-- SET AUTOTRACE	オートトレースの有効／無効、または、トレースモードの設定
-- SET BLOCKTERMINATOR	PL/SQL ブロックの終了文字の設定
-- SET CMDSEP	SQL*Plus コマンドの区切り文字
-- SET COLSEP	カラムとカラムの間の区切り文字
-- SET COMPATIBILITY	Oracle 8 以前向けの下位互換動作用
-- SET CONCAT	後続に文字連結するときの置換変数の終了文字の設定
-- SET COPYCOMMIT	COPY コマンドのコミットポイント設定
-- SET COPYTYPECHECK	COPY コマンドの型チェックの有効／無効
-- SET DEFINE	置換変数を有効／無効または接頭辞を設定
-- SET DESCRIBE	DESCRIBE コマンド の表示方法の調整
-- SET ECHO	スクリプトのSQL*Plusコマンドを表示をする／しない
-- SET EDITFILE	EDIT コマンド で使用する一時ファイル名の設定 -- エディタ
プログラムの指定は _EDITOR 事前定義変数
-- SET EMBEDDED	異なるレポート(SQL)でも同一ページ含める／含めない
-- SET ERRORLOGGING Oracle 11g	実行中に発生した例外を指定したテーブルに
出力する
-- SET ESCAPE	エスケープ機能を有効／無効、または、別のエスケープ文字を設定
-- SET ESCCHAR Oracle 11g	ファイル名を指定するときにエスケープして意味を
持たせない文字を指定
-- SET EXITCOMMIT Oracle 11g Release2	EXIT(QUIT) 時のデフォルトの振る舞
いで COMMIT するか ROLLBACK するかの設定
-- SET FEEDBACK	問い合わせの結果の件数を表示をする／しない、または、表示
する最小件数の設定
-- SET FLAGGER	SQL が SQL92 に準拠しているか調べる／調べないを設定
-- SET FLUSH	画面出力にバッファを使用する／しないの設定
-- SET HEADING	列ヘッダを表示する／しない
-- SET HEADSEP	列ヘッダの区切り文字の設定
-- SET INSTANCE	デフォルトのインスタンスの設定
-- SET LINESIZE	１行に表示する（文字数）バイト数の設定
-- SET LOBOFFSET	CLOB、NCLOBの取り出し開始位置の設定
-- SET LOGSOURCE	RECOVERY コマンドで使用するアーカイブログファイル位置の設定
-- SET LONG	LONG、CLOB、NCLOB の表示幅
-- SET LONGCHUNKSIZE	LONG、CLOB、NCLOBのチャンクサイズ
-- SET MARKUP	出力をHTML 形式にエンコードをする／しないの設定(SQL*Plusの
場合）
-- SET NEWPAGE	ページの開始位置から列ヘッダーまでの余白行数の設定
-- SET NULL	NULL データの代替文字列設定
-- SET NUMFORMAT	数値のデフォルト書式の設定（書式モデル）
-- SET NUMWIDTH	数値のデフォルト表示幅
-- SET PAGESIZE	1ページの行数
-- SET PAUSE	１ページ毎に一時停止をする／しない
-- SET RECSEP	レコードセパレータを常に出力する／しない、または、折り返し
が発生時のみ出力する
-- SET RECSEPCHAR	RECSEP が発生したときに表示される文字の設定
-- SET SERVEROUTPUT	標準出力に表示する／しない、または、バッファの上限サイズ
-- SET SHIFTINOUT	シフト文字を表示する／しない（特殊なコンソールのみ）
-- SET SHOWMODE	システム変数の変更前値の通知を表示する／しない
-- SET SQLBLANKLINES	SQL コマンド、PL/SQL ブロックに空白行を許可する／しない
-- SET SQLCASE	すべての入力文字を大文字、または、小文字に変換する／しない
-- SET SQLCONTINUE	複数行の SQL*Plusコマンド入力時のプロンプトの設定
-- SET SQLNUMBER	複数行の SQL コマンド、PL/SQL ブロック入力時に表示され
る行番号を表示する／しない
-- SET SQLPLUSCOMPATIBILITY	動作保証できる SQL*Plus のバージョンの設定
-- SET SQLPREFIX	SQL*Plus コマンドの接頭辞の設定
-- SET SQLPROMPT	SQL*Plus のコマンドプロンプトに表示される文字列の設定
-- SET SQLTERMINATOR	SQL コマンド、PL/SQL ブロックの終了文字の設定
-- SET SUFFIX	スクリプトファイルのデフォルト拡張子の設定
-- SET TAB	タブ文字の使用をする／しない
-- SET TERMOUT	@、@@、START のスクリプトによるアウトプットを表示する／しない
-- SET TIME	SQL プロンプトに時刻表示する／しない
-- SET TIMING	タイミング統計（タイマー）を表示する／しない
-- SET TRIMOUT	各行の出力の終わりから行末までの空白を出力する／しない
（スプールには無関係）
-- SET TRIMSPOOL	スプールにおける TRIMOUT システム変数（画面出力には無関係）
-- SET UNDERLINE	列ヘッダの下の表示される -----… 文字のあり／なし／文字
の設定
-- SET VERIFY	置換変数に設定する前後の状態を表示する／しない
-- SET WRAP	表示幅に収まらない部分を折り返す／切り捨てる
-- }}}

/* %ORACLE_HOME%/product/11.2.0/client_1/sqlplus/admin/glogin.sql */

define_editor= 'C:/Program Files (x86)/Vim/vim74/gvim.exe'
set linesize 32767
set trimspool on
set feedback off
set wrap off
set pagesize 0
set colsep ','



