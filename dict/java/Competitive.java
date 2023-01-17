import java.util.*;

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

    /* Scanner */
    Scanner sc = new Scanner(System.in);
    // integer
    int N = Integer.parseInt(sc.nextLine());
    // integers
    List<Integer> vals = Arrays.stream(sc.nextLine().split(" ")).map(x -> Integer.parseInt(x)).collect(Collectors.toList());
    // string
    String s = sc.nextLine();
    // strings
    String[] vals = sc.nextLine().split(" ");

    /* array */
    String[] vals = { "foo", "bar", "buzz" }; // literal

    /* String */
    char	charAt(int index);    // Returns the char value at the specified index.
    int	codePointAt(int index);    // Returns the character (Unicode code point) at the specified index.
    int	compareTo(String anotherString);    // Compares two strings lexicographically.
    int	compareToIgnoreCase(String str);    // Compares two strings lexicographically, ignoring case differences.
    boolean	contains(CharSequence s);    // Returns true if and only if this string contains the specified sequence of char values.
    boolean	endsWith(String suffix);    // Tests if this string ends with the specified suffix.
    boolean	equalsIgnoreCase(String anotherString);    // Compares this String to another String, ignoring case considerations.
    static String	format(String format, Object... args);    // Returns a formatted string using the specified format string and arguments.
    int	indexOf(int ch);    // Returns the index within this string of the first occurrence of the specified character.
    int	indexOf(int ch, int fromIndex);    // Returns the index within this string of the first occurrence of the specified character, starting the search at the specified index.
    int	indexOf(String str);    // Returns the index within this string of the first occurrence of the specified substring.
    int	indexOf(String str, int fromIndex);    // Returns the index within this string of the first occurrence of the specified substring, starting at the specified index.
    boolean	isEmpty();    // Returns true if, and only if, length() is 0.
    static String	join(CharSequence delimiter, CharSequence... elements);    // Returns a new String composed of copies of the CharSequence elements joined together with a copy of the specified delimiter.
    static String	join(CharSequence delimiter, Iterable<? extends CharSequence> elements);    // Returns a new String composed of copies of the CharSequence elements joined together with a copy of the specified delimiter.
    int	lastIndexOf(int ch);    // Returns the index within this string of the last occurrence of the specified character.
    int	lastIndexOf(int ch, int fromIndex);    // Returns the index within this string of the last occurrence of the specified character, searching backward starting at the specified index.
    int	lastIndexOf(String str);    // Returns the index within this string of the last occurrence of the specified substring.
    int	lastIndexOf(String str, int fromIndex);    // Returns the index within this string of the last occurrence of the specified substring, searching backward starting at the specified index.
    int	length();    // Returns the length of this string.
    boolean	matches(String regex);    // Tells whether or not this string matches the given regular expression.
    String	replace(char oldChar, char newChar);    // Returns a string resulting from replacing all occurrences of oldChar in this string with newChar.
    String	replace(CharSequence target, CharSequence replacement);    // Replaces each substring of this string that matches the literal target sequence with the specified literal replacement sequence.
    String	replaceAll(String regex, String replacement);    // Replaces each substring of this string that matches the given regular expression with the given replacement.
    String	replaceFirst(String regex, String replacement);    // Replaces the first substring of this string that matches the given regular expression with the given replacement.
    String[]	split(String regex);    // Splits this string around matches of the given regular expression.
    String[]	split(String regex, int limit);    // Splits this string around matches of the given regular expression.
    boolean	startsWith(String prefix);    // Tests if this string starts with the specified prefix.
    boolean	startsWith(String prefix, int toffset);    // Tests if the substring of this string beginning at the specified index starts with the specified prefix.
    CharSequence	subSequence(int beginIndex, int endIndex);    // Returns a character sequence that is a subsequence of this sequence.
    String	substring(int beginIndex);    // Returns a string that is a substring of this string.
    String	substring(int beginIndex, int endIndex);    // Returns a string that is a substring of this string.
    char[]	toCharArray();    // Converts this string to a new character array.
    String	toLowerCase();    // Converts all of the characters in this String to lower case using the rules of the default locale.
    String	toString();    // This object (which is already a string!) is itself returned.
    String	toUpperCase();    // Converts all of the characters in this String to upper case using the rules of the default locale.
    String	trim();    // Returns a string whose value is this string, with any leading and trailing whitespace removed.
    static String	valueOf(boolean b);    // Returns the string representation of the boolean argument.
    static String	valueOf(char c);    // Returns the string representation of the char argument.
    static String	valueOf(char[] data);    // Returns the string representation of the char array argument.
    static String	valueOf(char[] data, int offset, int count);    // Returns the string representation of a specific subarray of the char array argument.
    static String	valueOf(double d);    // Returns the string representation of the double argument.
    static String	valueOf(float f);    // Returns the string representation of the float argument.
    static String	valueOf(int i);    // Returns the string representation of the int argument.
    static String	valueOf(long l);    // Returns the string representation of the long argument.
    static String	valueOf(Object obj);    // Returns the string representation of the Object argument.


    /* StringBuilder */
    StringBuilder sb = new StringBuilder();
    sb.append("foo");
    sb.append(3);
    sb.toString();

    /* Collection */
    boolean	add(E e);    // Ensures that this collection contains the specified element (optional operation).
    boolean	addAll(Collection<? extends E> c);    // Adds all of the elements in the specified collection to this collection (optional operation).
    void	clear();    // Removes all of the elements from this collection (optional operation).
    boolean	contains(Object o);    // Returns true if this collection contains the specified element.
    boolean	containsAll(Collection<?> c);    // Returns true if this collection contains all of the elements in the specified collection.
    boolean	equals(Object o);    // Compares the specified object with this collection for equality.
    int	hashCode();    // Returns the hash code value for this collection.
    boolean	isEmpty();    // Returns true if this collection contains no elements.
    Iterator<E>	iterator();    // Returns an iterator over the elements in this collection.
    default Stream<E>	parallelStream();    // Returns a possibly parallel Stream with this collection as its source.
    boolean	remove(Object o);    // Removes a single instance of the specified element from this collection, if it is present (optional operation).
    boolean	removeAll(Collection<?> c);    // Removes all of this collection's elements that are also contained in the specified collection (optional operation).
    default boolean	removeIf(Predicate<? super E> filter);    // Removes all of the elements of this collection that satisfy the given predicate.
    boolean	retainAll(Collection<?> c);    // Retains only the elements in this collection that are contained in the specified collection (optional operation).
    int	size();    // Returns the number of elements in this collection.
    default Spliterator<E>	spliterator();    // Creates a Spliterator over the elements in this collection.
    default Stream<E>	stream();    // Returns a sequential Stream with this collection as its source.
    Object[]	toArray();    // Returns an array containing all of the elements in this collection.
    <T> T[]	toArray(T[] a);    // Returns an array containing all of the elements in this collection; the runtime type of the returned array is that of the specified array.

    /* Set */
    Set<String> set = new HashSet<>();
    /* List */
    List<Integer> vals = Arrays.asList(0, 0, 0);
    List<String> lis = new ArrayList<>();
    /* Map */
    Map<String, String> map = new HashMap<>();

    /* sorting */

    // Arrays#sort
    Arrays.sort(vals, Comparator.comparingInt(String::length));
    Arrays.sort(vals, (a, b) -> a.length() - b.length());
    // Stream#sorted
    // ascending order
    List<Integer> vals = stream.sorted().collect(Collectors.toList());
    // descending order
    List<Integer> vals = stream.sorted(reverseOrder()).collect(Collectors.toList());

    /* Math */
    // absolute of x - y
    int n = Math.abs(x - y);

  }

}
