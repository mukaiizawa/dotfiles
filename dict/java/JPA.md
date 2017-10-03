JPA

# 概要
JPAの雑多な事柄についてまとめる。
実装がHibernateのため、意図せず実装依存が含まれていることがあり得る。

# エンティティの定義
あるクラスをエンティティとして扱うには、
そのクラスに@Entityを付与する。
作成するクラスは大概次のようになる。
    @Entity
    @Table(schema="COMPANY", name="TBL_EMPLOYEE")
    public class Employee implements Serializable {
      private static final long serialVersionUID = 1L;
      @Id
      @Column(name="EMP_ID")
      String pk;
      ...
    }
@Tableの属性値を以下に示す。
    属性   値
    --------------------------------------------------------------
    schema エンティティをマッピングする表が属するスキーマ名
    name   エンティティをマッピングする表の物理名
