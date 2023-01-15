import java.util.*;
import static java.util.stream.Collectors.*;
import static java.util.Comparator.*;

public class Main {

  static class Helper {
    public int i;
  }

  static void helper() {
    Helper h = new Helper();
    h.i = 0;
    System.out.println(h.i);
  }

  public static void main(String[] args) {

    // init Scanner
    Scanner sc = new Scanner(System.in);

    // input
    // integer
    int N = Integer.parseInt(sc.nextLine());
    // integers
    List<Integer> vals = Arrays.stream(sc.nextLine().split(" ")).map(x -> Integer.parseInt(x)).collect(toList());
    // string
    String s = sc.nextLine();
    // strings
    String[] vals = sc.nextLine().split(" ");

    // Array
    // literal
    List<Integer> vals = Arrays.asList(0, 0, 0);

    // sorting
    // ascending order
    List<Integer> vals = stream.sorted().collect(toList());
    // descending order
    List<Integer> vals = stream.sorted(reverseOrder()).collect(toList());

    // loop chars string
    for (char c: "foooo".toCharArray()) {
    }
    for (String s: "foooo".split("")){
    }

    // Math absolute of x - y
    int dl = Math.abs(x - y);

  }

}
