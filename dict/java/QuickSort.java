/*
 * quick sort
 */
public class QuickSort {

  private static int SIZE = 10;
  private static int data[] = new int[SIZE];

  private static void setData() {
    for (int i = 0; i < SIZE; i++)
      data[i] = (int)(Math.random() * 100);
  }

  private static void showData() {
    System.out.print('[');
    for (int i = 0; i < SIZE; i++) {
      if (i != 0) System.out.print(',');
      System.out.print(data[i]);
    }
    System.out.println(']');
  }

  private static void sortData(int left, int right) {
    if (left >= right) return;
    showData();
    int i = left, j = right;
    int pivotValue = data[(i + j) / 2];
    while (i < j) {
      while (data[i] < pivotValue) i++;
      while (data[j] > pivotValue) j--;
      if (i <= j) {
        int tmp = data[i];
        data[i] = data[j];
        data[j] = tmp;
        i++;
        j--;
      }
    }
    sortData(left, j);
    sortData(i, right);
  }

  public static void main(String[] args) {
    setData();
    sortData(0, SIZE - 1);
    showData();
  }

}
