import java.util.*;

class ExReader
{ // {{{

  private static int MAX_SIZE = 1024;
  private InputStream in;
  private byte[] buf;
  private int p;
  private int size;

  public ExReader(InputStream in) throws Exception {
    this.in = in;
    this.buf = new byte[MAX_SIZE];
    this.fetch();
  }

  private int digitVal(int ch) {
    return ch - '0';
  }

  private boolean isDigit(int val) {
    return 0x30 <= val && val <= 0x39;
  }

  private boolean isPrint(int val) {
    return 0x20 < val && val < 0x7f;
  }

  public int fetch() throws Exception {
    this.p = 0;
    if (this.size == -1) throw new Exception("EOF reached");
    return this.size = this.in.read(this.buf);
  }

  public int readByte() throws Exception {
    if (this.p == this.size)
      if (this.fetch() == -1) return -1;
    return this.buf[this.p++];
  }

  public String readString() throws Exception {
    int ch;
    StringBuilder buf = new StringBuilder();
    while (this.isPrint(ch = this.readByte())) buf.append((char)ch);
    return buf.toString();
  }

  public long readLong() throws Exception {
    int ch;
    long val = 0;
    boolean isMinus = false;
    if (this.isDigit(ch = this.readByte())) val = this.digitVal(ch);
    else if (ch == '-') isMinus = true;
    else if (ch != '+') throw new IllegalStateException("unexpected token");
    while (this.isDigit(ch = this.readByte())) val = val * 10 + digitVal(ch);
    return isMinus? -val: val;
  }

  public int readInt() throws Exception {
    return (int)readLong();
  }

} // }}}

public class Main {

  static int N;
  static int[] A;
  static String[] S;

  static int[][] make2diarray(int x, int y, int v)
  { // {{{
    int [][] ret = new int[x][y];
    for (int i = 0; i < x; i++) Arrays.fill(ret[i], v);
    return ret;
  } // }}}

  /* Knapsack problem solver */
  static int[][] TABLE;    // item, rest capacity
  static int[] W;    // weights of items
  static int[] V;    // values of items
  static int kps(int i, int rest)
  { // {{{
    if (i == W.length) return 0;    // nothing item.
    if (TABLE[i][rest] != -1) return TABLE[i][rest];
    return TABLE[i][rest] = (rest < W[i])?
      kps(i + 1, rest):   // insufficient capacity.
      Math.max(kps(i + 1, rest), kps(i + 1, rest - W[i]) + V[i]);
  } // }}}

  public static void main(String[] args) {
    ExReader rd = new ExReader(System.in);
    N = rd.readInt();
    A = new int[N];
    for (int i = 0; i < N; i++) A[i] = rd.readInt();
    S = new String[N];
    for (int i = 0; i < N; i++) S[i] = rd.readString();

    /* array */
    String[] vals = { "foo", "bar", "buzz" }; // literal
    vals.length;    // length
    Arrays.toString(vals);    // to String.
    String[][][] vals = new String[5][5][5];    // three dimenional array.

    /* Arrays */
    // {{{
    static <T> List<T> asList(T... a); // Returns a fixed-size list backed by the specified array.
    static int binarySearch(int[] a, int key); // Searches the specified array of ints for the specified value using the binary search algorithm.
    static int binarySearch(int[] a, int fromIndex, int toIndex, int key); // Searches a range of the specified array of ints for the specified value using the binary search algorithm.
    static int binarySearch(Object[] a, int fromIndex, int toIndex, Object key); // Searches a range of the specified array for the specified object using the binary search algorithm.
    static int binarySearch(Object[] a, Object key); // Searches the specified array for the specified object using the binary search algorithm.
    static <T> int binarySearch(T[] a, int fromIndex, int toIndex, T key, Comparator<? super T> c); // Searches a range of the specified array for the specified object using the binary search algorithm.
    static <T> int binarySearch(T[] a, T key, Comparator<? super T> c); // Searches the specified array for the specified object using the binary search algorithm.
    static int[] copyOf(int[] original, int newLength); // Copies the specified array, truncating or padding with zeros (if necessary) so the copy has the specified length.
    static <T> T[] copyOf(T[] original, int newLength); // Copies the specified array, truncating or padding with nulls (if necessary) so the copy has the specified length.
    static int[] copyOfRange(int[] original, int from, int to); // Copies the specified range of the specified array into a new array.
    static <T> T[] copyOfRange(T[] original, int from, int to); // Copies the specified range of the specified array into a new array.
    static <T,U> T[] copyOfRange(U[] original, int from, int to, Class<? extends T[]> newType); // Copies the specified range of the specified array into a new array.
    static void fill(int[] a, int val); // Assigns the specified int value to each element of the specified array of ints.
    static void fill(int[] a, int fromIndex, int toIndex, int val); // Assigns the specified int value to each element of the specified range of the specified array of ints.
    static void fill(Object[] a, int fromIndex, int toIndex, Object val); // Assigns the specified Object reference to each element of the specified range of the specified array of Objects.
    static void fill(Object[] a, Object val); // Assigns the specified Object reference to each element of the specified array of Objects.
    static void setAll(int[] array, IntUnaryOperator generator); // Set all elements of the specified array, using the provided generator function to compute each element.
    static <T> void setAll(T[] array, IntFunction<? extends T> generator); // Set all elements of the specified array, using the provided generator function to compute each element.
    static void sort(int[] a); // Sorts the specified array into ascending numerical order.
    static void sort(int[] a, int fromIndex, int toIndex); // Sorts the specified range of the array into ascending order.
    static <T> void sort(T[] a, Comparator<? super T> c); // Sorts the specified array of objects according to the order induced by the specified comparator.
    static <T> void sort(T[] a, int fromIndex, int toIndex, Comparator<? super T> c); // Sorts the specified range of the specified array of objects according to the order induced by the specified comparator.
    static IntStream stream(int[] array); // Returns a sequential IntStream with the specified array as its source.
    static <T> Stream<T> stream(T[] array); // Returns a sequential Stream with the specified array as its source.
    static String toString(int[] a); // Returns a string representation of the contents of the specified array.
    // }}}

    /* Math */
    // {{{
    static double abs(double a); // Returns the absolute value of a double value.
    static float abs(float a); // Returns the absolute value of a float value.
    static int abs(int a); // Returns the absolute value of an int value.
    static long abs(long a); // Returns the absolute value of a long value.
    static double acos(double a); // Returns the arc cosine of a value; the returned angle is in the range 0.0 through pi.
    static double asin(double a); // Returns the arc sine of a value; the returned angle is in the range -pi/2 through pi/2.
    static double atan(double a); // Returns the arc tangent of a value; the returned angle is in the range -pi/2 through pi/2.
    static double atan2(double y, double x); // Returns the angle theta from the conversion of rectangular coordinates (x, y) to polar coordinates (r, theta).
    static double cbrt(double a); // Returns the cube root of a double value.
    static double ceil(double a); // Returns the smallest (closest to negative infinity) double value that is greater than or equal to the argument and is equal to a mathematical integer.
    static double cos(double a); // Returns the trigonometric cosine of an angle.
    static double cosh(double x); // Returns the hyperbolic cosine of a double value.
    static double exp(double a); // Returns Euler's number e raised to the power of a double value.
    static double expm1(double x); // Returns ex -1.
    static double floor(double a); // Returns the largest (closest to positive infinity) double value that is less than or equal to the argument and is equal to a mathematical integer.
    static int getExponent(double d); // Returns the unbiased exponent used in the representation of a double.
    static int getExponent(float f); // Returns the unbiased exponent used in the representation of a float.
    static double hypot(double x, double y); // Returns sqrt(x2 +y2) without intermediate overflow or underflow.
    static double IEEEremainder(double f1, double f2); // Computes the remainder operation on two arguments as prescribed by the IEEE 754 standard.
    static double log(double a); // Returns the natural logarithm (base e) of a double value.
    static double log10(double a); // Returns the base 10 logarithm of a double value.
    static double log1p(double x); // Returns the natural logarithm of the sum of the argument and 1.
    static double max(double a, double b); // Returns the greater of two double values.
    static float max(float a, float b); // Returns the greater of two float values.
    static int max(int a, int b); // Returns the greater of two int values.
    static long max(long a, long b); // Returns the greater of two long values.
    static double min(double a, double b); // Returns the smaller of two double values.
    static float min(float a, float b); // Returns the smaller of two float values.
    static int min(int a, int b); // Returns the smaller of two int values.
    static long min(long a, long b); // Returns the smaller of two long values.
    static double nextAfter(double start, double direction); // Returns the floating-point number adjacent to the first argument in the direction of the second argument.
    static float nextAfter(float start, double direction); // Returns the floating-point number adjacent to the first argument in the direction of the second argument.
    static double nextUp(double d); // Returns the floating-point value adjacent to d in the direction of positive infinity.
    static float nextUp(float f); // Returns the floating-point value adjacent to f in the direction of positive infinity.
    static double pow(double a, double b); // Returns the value of the first argument raised to the power of the second argument.
    static double random(); // Returns a double value with a positive sign, greater than or equal to 0.0 and less than 1.0.
    static double rint(double a); // Returns the double value that is closest in value to the argument and is equal to a mathematical integer.
    static long round(double a); // Returns the closest long to the argument, with ties rounding up.
    static int round(float a); // Returns the closest int to the argument, with ties rounding up.
    static double sin(double a); // Returns the trigonometric sine of an angle.
    static double sinh(double x); // Returns the hyperbolic sine of a double value.
    static double sqrt(double a); // Returns the correctly rounded positive square root of a double value.
    static double tan(double a); // Returns the trigonometric tangent of an angle.
    static double tanh(double x); // Returns the hyperbolic tangent of a double value.
    static double toDegrees(double angrad); // Converts an angle measured in radians to an approximately equivalent angle measured in degrees.
    static double toRadians(double angdeg); // Converts an angle measured in degrees to an approximately equivalent angle measured in radians.
    static double ulp(double d); // Returns the size of an ulp of the argument.
    static float ulp(float f); // Returns the size of an ulp of the argument.
    // }}}

    /* String */
    // {{{
    char charAt(int index); // Returns the char value at the specified index.
    int codePointAt(int index); // Returns the character (Unicode code point) at the specified index.
    int codePointBefore(int index); // Returns the character (Unicode code point) before the specified index.
    int codePointCount(int beginIndex, int endIndex); // Returns the number of Unicode code points in the specified text range of this String.
    int compareTo(String anotherString); // Compares two strings lexicographically.
    int compareToIgnoreCase(String str); // Compares two strings lexicographically, ignoring case differences.
    String concat(String str); // Concatenates the specified string to the end of this string.
    boolean contains(CharSequence s); // Returns true if and only if this string contains the specified sequence of char values.
    boolean contentEquals(CharSequence cs); // Compares this string to the specified CharSequence.
    boolean contentEquals(StringBuffer sb); // Compares this string to the specified StringBuffer.
    static String copyValueOf(char[] data); // Returns a String that represents the character sequence in the array specified.
    static String copyValueOf(char[] data, int offset, int count); // Returns a String that represents the character sequence in the array specified.
    boolean endsWith(String suffix); // Tests if this string ends with the specified suffix.
    boolean equals(Object anObject); // Compares this string to the specified object.
    boolean equalsIgnoreCase(String anotherString); // Compares this String to another String, ignoring case considerations.
    static String format(Locale l, String format, Object... args); // Returns a formatted string using the specified locale, format string, and arguments.
    static String format(String format, Object... args); // Returns a formatted string using the specified format string and arguments.
    byte[] getBytes(); // Encodes this String into a sequence of bytes using the platform's default charset, storing the result into a new byte array.
    byte[] getBytes(Charset charset); // Encodes this String into a sequence of bytes using the given charset, storing the result into a new byte array.
    byte[] getBytes(String charsetName); // Encodes this String into a sequence of bytes using the named charset, storing the result into a new byte array.
    void getChars(int srcBegin, int srcEnd, char[] dst, int dstBegin); // Copies characters from this string into the destination character array.
    int hashCode(); // Returns a hash code for this string.
    int indexOf(int ch); // Returns the index within this string of the first occurrence of the specified character.
    int indexOf(int ch, int fromIndex); // Returns the index within this string of the first occurrence of the specified character, starting the search at the specified index.
    int indexOf(String str); // Returns the index within this string of the first occurrence of the specified substring.
    int indexOf(String str, int fromIndex); // Returns the index within this string of the first occurrence of the specified substring, starting at the specified index.
    String intern(); // Returns a canonical representation for the string object.
    boolean isEmpty(); // Returns true if, and only if, length() is 0.
    int lastIndexOf(int ch); // Returns the index within this string of the last occurrence of the specified character.
    int lastIndexOf(int ch, int fromIndex); // Returns the index within this string of the last occurrence of the specified character, searching backward starting at the specified index.
    int lastIndexOf(String str); // Returns the index within this string of the last occurrence of the specified substring.
    int lastIndexOf(String str, int fromIndex); // Returns the index within this string of the last occurrence of the specified substring, searching backward starting at the specified index.
    int length(); // Returns the length of this string.
    boolean matches(String regex); // Tells whether or not this string matches the given regular expression.
    int offsetByCodePoints(int index, int codePointOffset); // Returns the index within this String that is offset from the given index by codePointOffset code points.
    boolean regionMatches(boolean ignoreCase, int toffset, String other, int ooffset, int len); // Tests if two string regions are equal.
    boolean regionMatches(int toffset, String other, int ooffset, int len); // Tests if two string regions are equal.
    String replace(char oldChar, char newChar); // Returns a new string resulting from replacing all occurrences of oldChar in this string with newChar.
    String replace(CharSequence target, CharSequence replacement); // Replaces each substring of this string that matches the literal target sequence with the specified literal replacement sequence.
    String replaceAll(String regex, String replacement); // Replaces each substring of this string that matches the given regular expression with the given replacement.
    String replaceFirst(String regex, String replacement); // Replaces the first substring of this string that matches the given regular expression with the given replacement.
    String[] split(String regex); // Splits this string around matches of the given regular expression.
    String[] split(String regex, int limit); // Splits this string around matches of the given regular expression.
    boolean startsWith(String prefix); // Tests if this string starts with the specified prefix.
    boolean startsWith(String prefix, int toffset); // Tests if the substring of this string beginning at the specified index starts with the specified prefix.
    CharSequence subSequence(int beginIndex, int endIndex); // Returns a new character sequence that is a subsequence of this sequence.
    String substring(int beginIndex); // Returns a new string that is a substring of this string.
    String substring(int beginIndex, int endIndex); // Returns a new string that is a substring of this string.
    char[] toCharArray(); // Converts this string to a new character array.
    String toLowerCase(); // Converts all of the characters in this String to lower case using the rules of the default locale.
    String toLowerCase(Locale locale); // Converts all of the characters in this String to lower case using the rules of the given Locale.
    String toString(); // This object (which is already a string!) is itself returned.
    String toUpperCase(); // Converts all of the characters in this String to upper case using the rules of the default locale.
    String toUpperCase(Locale locale); // Converts all of the characters in this String to upper case using the rules of the given Locale.
    String trim(); // Returns a copy of the string, with leading and trailing whitespace omitted.
    static String valueOf(boolean b); // Returns the string representation of the boolean argument.
    static String valueOf(char c); // Returns the string representation of the char argument.
    static String valueOf(char[] data); // Returns the string representation of the char array argument.
    static String valueOf(char[] data, int offset, int count); // Returns the string representation of a specific subarray of the char array argument.
    static String valueOf(double d); // Returns the string representation of the double argument.
    static String valueOf(float f); // Returns the string representation of the float argument.
    static String valueOf(int i); // Returns the string representation of the int argument.
    static String valueOf(long l); // Returns the string representation of the long argument.
    static String valueOf(Object obj); // Returns the string representation of the Object argument.
    // }}}

    /* Collection */
    // {{{

    boolean add(E e); // Ensures that this collection contains the specified element (optional operation);.
    boolean addAll(Collection<? extends E> c); // Adds all of the elements in the specified collection to this collection (optional operation);.
    void clear(); // Removes all of the elements from this collection (optional operation);.
    boolean contains(Object o); // Returns true if this collection contains the specified element.
    boolean containsAll(Collection<?> c); // Returns true if this collection contains all of the elements in the specified collection.
    boolean equals(Object o); // Compares the specified object with this collection for equality.
    int hashCode(); // Returns the hash code value for this collection.
    boolean isEmpty(); // Returns true if this collection contains no elements.
    Iterator<E> iterator(); // Returns an iterator over the elements in this collection.
    Stream<E> parallelStream(); // Returns a possibly parallel Stream with this collection as its source.
    boolean remove(Object o); // Removes a single instance of the specified element from this collection, if it is present (optional operation);.
    boolean removeAll(Collection<?> c); // Removes all of this collection's elements that are also contained in the specified collection (optional operation);.
    boolean removeIf(Predicate<? super E> filter); // Removes all of the elements of this collection that satisfy the given predicate.
    boolean retainAll(Collection<?> c); // Retains only the elements in this collection that are contained in the specified collection (optional operation);.
    int size(); // Returns the number of elements in this collection.
    Spliterator<E> spliterator(); // Creates a Spliterator over the elements in this collection.
    Stream<E> stream(); // Returns a sequential Stream with this collection as its source.
    Object[] toArray(); // Returns an array containing all of the elements in this collection.
    <T> T[] toArray(IntFunction<T[]> generator); // Returns an array containing all of the elements in this collection, using the provided generator function to allocate the returned array.
    <T> T[] toArray(T[] a); // Returns an array containing all of the elements in this collection; the runtime type of the returned array is that of the specified array.

    Arrays.sort(vals, Comparator.comparingInt(String::length));
    Arrays.sort(vals, (a, b) -> a.length() - b.length());

    // }}}

    /* Set */
    Set<String> set = new HashSet<>();
    /* List */
    List<Integer> vals = Arrays.asList(0, 0, 0);
    List<String> lis = new ArrayList<>();
    List<Integer> vals = stream.sorted().collect(Collectors.toList()); // sort in ascending order
    List<Integer> vals = stream.sorted(reverseOrder()).collect(Collectors.toList()); // sort in descending order
    /* Map */
    Map<String, String> map = new HashMap<>();

  }

}
