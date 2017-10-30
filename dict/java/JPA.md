JPA

# 概要
JPAの雑多な事柄についてまとめる。
使用している実装がHibernateのため、
意図せず実装依存が含まれていることがあり得る。

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

# トランザクション管理
EJBのメソッドはデフォルトでメソッド単位でトランザクション管理を行う。
トランザクションの制御はアノテーションで行うことができる。
    @TransactionAttribute(TransactionAttributeType.NOT_SUPPORTED)
    public void function() {
        ...
    }
指定可能なアノテーションとその制御内容を以下に示す。
    属性          呼び出し元のトランザクションの有無
                  なし   あり
    ---------------------------------------------------------------------------------------
    REQUIRED      呼び出し元がトランザクションの場合は引き継ぐ
                  呼び出し元がトランザクションでない場合はトランザクションを開始する
    REQUIRES_NEW  常に新しくトランザクションを開始する
    SUPPORTES     呼び出し元がトランザクションの場合は引き継ぐ
                  呼び出し元がトランザクションでない場合はトランザクションとして扱わない
    MANDATORY     呼び出し元のトランザクションを引き継ぐ
                  呼び出し元がトランザクションでない場合はエラーとする
    NEVER         トランザクションとして扱わない
                  呼び出し元がトランザクションの場合はエラーとする
    NOT_SUPPORTED トランザクションとして扱わない
                  呼び出し元がトランザクションの場合は一時中断する

# アノテーションまとめ
JPAを利用する上でよく利用するアノテーションをまとめる。
## @Entity
このアノテーションはクラスがエンティティであることを表す。
name属性を指定しない場合、このエンティティ名はクラス名となる。
エンティティ名について、次に留意すること。
- エンティティ名は永続化コンテキスト内でユニークであること
- JPQLの予約語を使用しないこと
    属性 値
    ----------------------------------
    name エンティティ名を指定する
         初期値はこのクラス名
## @Table
このアノテーションはエンティティのプライマリテーブルを指定する。
省略した場合は各属性値のデフォルト値が指定されたように振舞う。
    属性   値
    --------------------------------------------------------------
    schema エンティティをマッピングする表が属するスキーマ名
           初期値は使用するデータベースのスキーマ名
    name   エンティティをマッピングする表の物理名
           初期値はエンティティ名
## @Column
このアノテーションはエンティティフィールドを、
データベース上の物理カラムと対応づけするために使用する。
    属性       値
    ------------------------------------------------------------------
    name       フィールドをマッピングする列の物理名
               初期値はエンティティ名
    insertable このフィールドをSQLのinsert文に含めるか否か
               初期値はtrue
    updatable  このフィールドをSQLのupdate文に含めるか否か
               初期値はtrue

# リレーションシップマッピング
JPAにはテーブル間のリレーションを定義するアノテーションが三つある。
- @ManyToOne
- @OneToMany
- @OneToOne
# 共通の属性
    属性     値
    ------------------------------------------------------------------
    cascade  対象をカスケードする永続操作CascadeTypeの配列
             - CascadeType.ALL: すべて対象
             - CascadeType.MERGE: merge時
             - CascadeType.PERSIST: persist時
             - CascadeType.REFRESH: refresh時
             - CascadeType.REMOVE: remove時
             初期値はCascadeTypeの空の配列
    fetch    FetchType.LAZYを指定した場合は初めてアクセスがあった場合にフェッチ
             FetchType.EAGERをしてした場合は即座にフェッチ
             初期値はFetchType.LAZY
    mappedBy 双方向関係の所有者側を決める
## 事例別マッピング
業務で使用しそうなマッピング例を示す。
ただし、ここで扱う事例は主にデータベースが既にある場合を想定している。
零からORマッパーを前提とした場合は、
ここに述べることはあてはまらないかもしれない。
### マスタテーブルと業務テーブル
マスタデータに合わせてエンティティを作る場合は、
列を更新できないようにしておく方がよい。
マスタを参照する各々のエンティティは@ManyToOneのアノテーションを使用する。
    @Entity
    public class Master {
        /** コード */
        @Id
        @Column(name="CD", insertable=false, updatable=false)
        private String cd;

        /** 名称 */
        @Column(name="NAME", insertable=false, updatable=false)
        private String name;

        ...

    }

    @Entity
    public class Transaction {

      ...

      /** マスタエンティティ */
      @ManyToOne(fetch=FetchType.EAGER)
      @JoinColumn(name="MASTER_CD")
      private Master master = new Master();

      ...

    }
### 一対多の双方向リレーション
一対多の双方向リレーションを定義するには、
many側のエンティティには@OneToManyのみ付け、
@JoinColumnや@Columnはつけない。
one側では、many側のエンティティのリストに@OneToManyを付加する。
@OneToManyのmappedBy属性値はmany側の表の物理名ではなく、
many側のエンティティのフィールド名を指定する。
fetch属性には性能的な問題がなさそうな場合はFetchType.EAGERを指定するとよい。
cascade属性にはCascadeType.ALLを指定しておくとよい。
ただし、RDBMSの実表にON DELET CASCADE句が指定されていない場合、
永続操作のremove実行時にRDBMS側で外部キー制約のエラーとなる。
one側では、の子のフィールドはnullにならないように初期化しておくとよい。
many側のエンティティのone側のフィールドには@JoinColumnを指定する。
双方のエンティティの物理列名が異なる場合、
それぞれname属性とreferencedColumnName属性を指定する必要がある。
たいていのリレーションモデルでは、外部キーが変わることは稀であるから、
updatable属性にfalseを指定しておくとよい。
    @Entity
    public class Parent {

        ...

        /** 子エンティティのリスト */
        @OneToMany(mappedBy="parent", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
        private List<child> children = new ArrayList<>();

        ...

    }

    /** Transaction entyty */
    @Entity
    public class Transaction {

      ...

      /** 親エンティティ */
      @ManyToOne
      @JoinColumn(name="PARENT_CD", referencedColumnName="CHILD_CD", updatable=false)
      private Master master = new Master();

      ...

    }
