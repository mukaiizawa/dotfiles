// Knapsack problem.

public class KnapsackProblem {

  /*
   * 0-1 Knapsack problem solver.
   * int[][] memo = make2diarray(weights.length + 1, MAX_WEIGHT, -1);
   * kps(memo, weights, values, 0, MAX_WEIGHT);
   */
  static int kps(int[][] memo, int[] weights, int[] values, int i, int rest) {
    if (i == weights.length) return 0;    // nothing item.
    if (memo[i][rest] != -1) return memo[i][rest];
    return memo[i][rest] = (rest < weights[i])?
      kps(memo, weights, values, i + 1, rest):   // insufficient capacity.
      Math.max(kps(memo, weights, values, i + 1, rest), kps(memo, weights, values, i + 1, rest - weights[i]) + values[i]);
  }

  /*
   * 0-1 Knapsack problem solver with no value.
   */
  static int kps(int maxWeight, int[] weights) {
    boolean[] possible = new boolean[maxWeight + 1];
    possible[0] = true;
    int sum = 0;
    for (int i = 0; i < weights.length; i++) {
      int weight = weights[i];
      for (int j = maxWeight; j >= weight; j--) {
        if (possible[j - weight]) {
          possible[j] = true;
          sum = Math.max(j, sum);
        }
      }
    }
    return sum;
  }

  /*
   * Knapsack problem solver with no value, each item has more than one.
   */
  static int kps(int maxWeight, int[] weights, int[] itemCounts) {
    boolean[] possible = new boolean[maxWeight + 1];
    possible[0] = true;
    for (int i = 0; i < N; i++) {
      int weight = A[i];
      for (int count = 0; count < itemCounts[i]; count++) {
        for (int j = X; j >= weight; j--) {
          if (possible[j - weight]) {
            possible[j] = true;
            sum = Math.max(j, sum);
          }
        }
      }
    }
    return sum;
  }

}
