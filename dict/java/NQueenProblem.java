/*
 * n queen problem
 */

public class NQueenProblem {

  private static final int BOARD_SIZE = 8;
  private static boolean[][] board = new boolean[BOARD_SIZE][BOARD_SIZE];

  private static void printBoard() {
    for (int i = 0; i < BOARD_SIZE; i++) {
      for (int j = 0; j < BOARD_SIZE; j++)
        System.out.print(board[i][j]? " Q": " -");
      System.out.println();
    }
    System.out.println();
  }

  private static boolean isInBoard(int row, int col) {
    return 0 <= row && row < BOARD_SIZE && 0 <= col && col < BOARD_SIZE;
  }

  private static boolean canPut(int row, int col) {
    for (int i = row; i >= 0; i--)
      if (board[i][col]) return false;
    for (int i = row, j = col; isInBoard(i, j); i--, j--)
      if (board[i][j]) return false;
    for (int i = row, j = col; isInBoard(i, j); i--, j++)
      if (board[i][j]) return false;
    return true;
  }

  private static void tryPut(int row) {
    if (row == BOARD_SIZE) printBoard();
    else {
      for (int col = 0; col < BOARD_SIZE; col++) {
        if (canPut(row, col)) {
          board[row][col] = true;
          tryPut(row + 1);
          board[row][col] = false;
        }
      }
    }
  }

  public static void main(String[] args) {
    tryPut(0);
  }

}
