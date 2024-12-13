import java.util.*;
import java.util.regex.*;


// String.

    String text = "abc123";
    text.replaceAll("[a-z]", "X");    // XXX123
    text.replaceFirst("[a-z]", "X");    // Xbc123
    text.split("[a-z]", "X");    // Xbc123
    System.out.println(text.split("[a-z]", "X"));

// Pattern & Matcher.

    /*
     * A matcher is created from a pattern by invoking the pattern's matcher method. Once created, a matcher can be used to perform three different kinds of match operations:
     * - The matches method attempts to match the entire input sequence against the pattern.
     * - The lookingAt method attempts to match the input sequence, starting at the beginning, against the pattern.
     * - The find method scans the input sequence looking for the next subsequence that matches the pattern.
     */
    Pattern pattern = Pattern.compile("[a-z]+");
    Matcher matcher = pattern.matcher(text);

    while (find.matches()) {
      System.out.println(matcher.group());
    }
