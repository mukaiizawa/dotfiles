import java.sql.*;
import java.util.*;

public class JDBCPostgres {
  public static void main(String[] args) throws Exception {
    Class.forName("org.postgresql.Driver");
    try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/DB", "USER", "PASS");
        PreparedStatement stmt = conn.prepareStatement("select 'hello postgres jdbc'");
        ResultSet rs = stmt.executeQuery())
    {
      rs.next();
      System.out.println(rs.getString(1));
    }
  }
}
