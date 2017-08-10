impdb

# 概要
impdbはデータベースにテーブルやスキーマなどをインポートするためのツールである。

# 書式
    IMPDP <USER>/<PASS>@<SID> DUMPFILE=<DMPFILE> LOGFILE=<LOGFILE> SCHEMAS=<SCHEMA> [REMAP_TABLESPACE=<FROM>:<TO>]*

# 注意事項
従来のimpとは互換性がない。
別のDBから表領域を指定し直してインポート可能。
