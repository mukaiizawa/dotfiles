Class Enum<E extends Enum<E>>

java.lang.Object
  java.lang.Enum<E>

# 概要
列挙を実現するためのクラス。
全てのenum型は暗黙のうちにEnum抽象クラスを継承している。

# 定義方法
    public enum Type {
      TYPE1
      ,TYPE2
      ,TYPE3
      ...
      ,TYPEN
    }
## 明示的なコンストラクタを定義する場合
フィールドを設けてコンストラクタやメソッドを定義することができる。
ただし、列挙子の最後にセミコロンを付加する必要がある
またコンストラクタはprivateで宣言する必要がある。
    public enum Type {
      TYPE1(100)
      ,TYPE2(101)
      ,TYPE3(102)
      ...
      ,TYPEN(103);

      private int val;

      private Type(int val) {
        this.val = val;
      }

      public getVal() {
        return this.val;
      }

    }
ただし、列挙子名をそのまま取得したいだけなら暗黙的に定義されるname()を使用すればよい。

# 使用例
## 同値判定
定義したenumは`==`演算子を用いて比較することができる。
    if(TYPE1 == type) {
        ...
    }
## switchによる条件分岐
switch文と組み合わせることにより、見通しの良い条件分岐を実現できる。
    switch (type) {
      case TYPE1:
        ...
        break;
      case TYPE2:
        ...
        break;
      ...
      case TYPEN:
        ...
        break;
      default:
        ...
        break;
    }
