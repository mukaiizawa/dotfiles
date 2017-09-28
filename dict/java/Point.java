import java.lang.Math;

/**
 * 座標クラス
 * 2次元平面上の任意の一点を表すクラス。
 */
public class Point {

  /* このx座標 */
  private double x;

  /* このy座標 */
  private double y;

  /**
   * 原点の座標を作成する。
   */
  public Point() {
    this.x = this.y = 0;
  }

  /**
   * 指定した座標を作成する。
   * @param x このx座標
   * @param y このx座標
   */
  public Point(double x, double y) {
    this.x = x;
    this.y = y;
  }

  /**
   * x座標取得
   * @return x座標
   */
  public double getX() {
    return this.x;
  }

  /**
   * y座標取得
   * @return y座標
   */
  public double getY() {
    return this.y;
  }

  /**
   * この座標と座標pを足した座標を返す。
   * @param p この座標から和を取る座標
   * @return この座標に座標pを足した座標
   */
  public Point add(Point p) {
    return new Point(this.getX() + p.getX(), this.getY() + p.getY());
  }

  /**
   * この座標と座標pの差を表す座標を返す。
   * @param p この座標から差を取る座標
   * @return この座標と座標pの差を表す座標
   */
  public Point subtract(Point p) {
    return this.add(p.negate());
  }

  /**
   * この座標の原点からの距離を取得
   * @return この座標の原点からの距離
   */
  public double norm() {
    return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
  }

  /**
   * 内積の計算
   * この座標と座標pを位置ベクトルと見做した時の内積の計算して返す。
   * @return この座標と座標pを位置ベクトルと見做した時の内積の計算
   */
  public double dot(Point p) {
    return this.x * p.getX() + this.y * p.getY();
  }

  /**
   * 座標の比較
   * このPointと同じ位置を表しているか判定
   * @return このPointと同じ位置を表しているか
   */
  public boolean equals(Point p) {
    return this.getX() == p.getX() && this.getY() == p.getY();
  }

  /**
   * この座標の原点対象の座標を返す。
   * @return この座標の原点対象の座標
   */
  public Point negate() {
    return new Point(- this.getX(), - this.getY());
  }

  /**
   * 座標の文字列表現
   * (x, y)の形で表示する。
   * @return 座標の文字列表現
   */
  public String toString() {
    return "(" + this.getX() + "," + this.getY() + ")";
  }

  /**
   * APIの使用例
   */
  public static void main(String[] args) {
    Point p, q, r;
    p = new Point();
    q = new Point(1, 2);
    r = new Point(3, 4);
    System.out.println(p);
    System.out.println(q);
    System.out.println(r);
    System.out.println(r.norm());
    System.out.println(q.dot(r));
    System.out.println(q.add(r));
    System.out.println(q.negate());
  }

}
