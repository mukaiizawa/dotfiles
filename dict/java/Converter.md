Converter

# 概要
Converterはある値を画面に表示する際に、
実際の値から特定の規則に従って変換する際に用いる。
また、ユーザが入力した値を特定の規則に従って取得する目的にも使える。
つまり、同じような変換処理を、
JSFのコンテナが自動で行うようにするためのプログラム群である。

# 作成方法
## アノテーション
Converterを作成するにはクラスに次のようなアノテーションを付与する。
@FacesConverter(value="converter1" ,forClass=String.class)
valueはこのConverterの名称を付ける。
forClassには値を格納する変数の型を記述する。
## 必要なメソッド
Converterを用いるには次のメソッドを作成する必要がある。
1. public Object getAsObject(FacesContext context, UIComponent component, String date)
2. public String getAsString(FacesContext context, UIComponent component, Object date)
### getAsObject
画面に入力された文字列を変数に格納する際に呼ばれるメソッド。
返り値が変数に格納される。
### getAsString
変数の値を画面に出力する際に呼ばれるメソッド。
返り値が画面に表示される文字列となる。
### 作成例(日付コンバータ)
    // 和暦西暦変換を提供する
    @FacesConverter(value="ggggymdhm" ,forClass=String.class)
    public class ConvertGGGGYMDDetail implements Converter {

      public Object getAsObject(FacesContext context, UIComponent component, String date) {
        if(null==date || "".equals(date)) {
          return "";
        } else {
          try {
            // GGGGy年M月d日からyyyymmddへ変換する
            return
              new SimpleDateFormat("yyyyMMddhhmm").format(
                  new SimpleDateFormat("GGGGy年M月d日 hh:mm", new Locale("ja", "JP", "JP")).parse(date));
          } catch(Exception e) {
            System.out.println(e);
            return "";
          }
        }
      }

      public String getAsString(FacesContext context, UIComponent component, Object date) {
        if(null==date || ((String)date).length()<8) {
          return "";
        } else {
          try {
            // yyyymmddからGGGGy年M月d日へ変換する
            return
              new SimpleDateFormat("GGGGy年M月d日 hh:mm", new Locale("ja", "JP", "JP")).format(
                  new SimpleDateFormat("yyyyMMddhhmm").parse((String)date));
          } catch(Exception e) {
            System.out.println(e);
            return "";
          }
        }
      }

    }

# 使用方法
作成したConverterはjsfコンポーネント内で呼び出すことが可能。
## 主な使用例
    <!-- 日付を和暦変換して出力 -->
    <h:outputText value="#{bean.date}">
      <f:converter converterId="ggggymd"/>
    </h:outputText>
