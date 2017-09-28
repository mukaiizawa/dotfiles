Tips 対話プロンプト

# ユーザからyes/no取得
次のようにgoto文を使用して指定した値が入力されるまでプロンプトを出せる。
    :HOME
    ECHO "execute ? y/n"
    SET /p c=
    if "%c%"=="y" GOTO CONTINUE
    if "%c%"=="n" GOTO END
    ECHO "illegal value"
    GOTO HOME
    :END
