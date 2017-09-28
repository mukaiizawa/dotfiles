Tips エラーハンドリング

# 直前のコマンドの終了状態を取得する
    if not %ERRORLEVEL% == 0 (
        exit 1
    )

# エラー処理のサブルーチン化
    rem do something. 
    call :CheckError
    exit 0

    :CheckError
    if not %errorlevel% == 0 (
        echo error messages.
        exit 1
    )
    exit /b 0
`exit`にフラグ`/b`を付加することにより、サブルーチンから戻ることに注意。
