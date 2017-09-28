/**
 * N queen problem.
 */
public class NQueenProblem {

  // status of board
  public static int BOARD_SIZE = 8;
  public static int BOARD_FREE = 0;
  public static int BOARD_QUEEN = 1;

  // for print
  public static String BOARD_CHAR = " ";
  public static String QUEEN_CHAR = "Q";

  public static int PARTICULAR_SOLUTION_NUM = 0;

  public static void main(String[] args) {
    tryPut(createBoard(BOARD_SIZE), 0);
    System.out.println(PARTICULAR_SOLUTION_NUM);
    return;
  }

  // tryPut is the function that try put Queen line `n' on a `board'.
  public static void tryPut(int[][] board, int n) {
    if (n == BOARD_SIZE) {
      PARTICULAR_SOLUTION_NUM++;
      showBoard(board);
      return;
    }
    for (int i = 0; i < BOARD_SIZE; i++)
      if (canPutQueen(board, n, i))
        tryPut(putQueen(board, n, i), n + 1);
    return;
  }

  public static boolean canPutQueen(int[][] board, int row, int col) {
    if (!isInBoard(row, col)) return false;
    // row, col
    for (int i = 0; i < BOARD_SIZE; i++)
      if (board[row][i] == BOARD_QUEEN || board[i][col] == BOARD_QUEEN)
        return false;
    // down-right
    for (int i = row + 1, j = col + 1; isInBoard(i, j); i++, j++)
      if (board[i][j]==BOARD_QUEEN) return false;
    // down-left
    for (int i = row + 1, j = col - 1; isInBoard(i, j); i++, j--)
      if (board[i][j]==BOARD_QUEEN) return false;
    // top-right
    for (int i = row - 1, j = col + 1; isInBoard(i, j); i--, j++)
      if (board[i][j] == BOARD_QUEEN) return false;
    // top-left
    for (int i = row - 1, j = col - 1; isInBoard(i, j); i--, j--)
      if (board[i][j] == BOARD_QUEEN) return false;
    return true;
  }

  public static int[][] putQueen(int[][] board, int row, int col) {
    int [][] result = new int[BOARD_SIZE][BOARD_SIZE];
    for (int i = 0; i < BOARD_SIZE; i++) {
      for (int j = 0; j < BOARD_SIZE; j++) {
        result[i][j] = (i == row && j == col)?
          BOARD_QUEEN:
          board[i][j];
      }
    }
    return result;
  }

  public static boolean isInBoard(int row, int col) {
    return (0 <= row&&row < BOARD_SIZE) && (0 <= col&&col < BOARD_SIZE);
  }

  public static int[][] createBoard(int n) {
    return new int[8][8];
  }

  public static void showBoard(int[][] board) {
    for (int[] line: board) {
      for (int cell: line) {
        System.out.print((BOARD_QUEEN==cell)?
            QUEEN_CHAR:
            BOARD_CHAR);
      }
      System.out.println();
    }
    System.out.println();
    return;
  }

}
