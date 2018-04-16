履歴情報操作

# 概要
DOM windowオブジェクトはhistoryオブジェクトを介したブラウザ履歴へのアクセスを提供している。

# 進む
    window.history.forward();

# 戻る
    window.history.back();

# 指定した位置に移動
現在の位置を0とした履歴の移動を行える。
    window.history.go(-1);    // <=> back()
    window.history.go(1);    // <=> forward()

# 履歴長の取得
現在の履歴スタックのサイズはlengthプロパティで取得する。
    window.history.length

# 戻るボタンの無効化
    history.pushState(null, null, null);
    window.addEventListener("popstate", function() {
      history.pushState(null, null, null);
    });
