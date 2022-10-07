import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.MatcherAssert.*;
import static org.junit.jupiter.api.Assertions.*;

class FooTest {

  private static int foo = 0;
  public static Connection conn;

  @BeforeEach
  public void before() {
    conn = new Connection();
  }

  @AfterEach
  public void after() throws Exception {
    conn.close();
  }

  @Test
  @DisplayName("Test foo method")
  void testFoo() {
    assertThat(new Foo().foo(), is(foo));
  }

  @Test
  @DisplayName("Example of wrapping standard output")
  void testPrintStackTrace() {
    ByteArrayOutputStream ba1 = new ByteArrayOutputStream();
    ByteArrayOutputStream ba2 = new ByteArrayOutputStream();
    System.setErr(new PrintStream(ba1));
    e1.printStackTrace();
    System.setErr(new PrintStream(ba2));
    e2.printStackTrace();
    assertThat(ba1.toByteArray(), is(ba2.toByteArray()));
  }

}
