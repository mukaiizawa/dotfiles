package pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class DatabaseManager {

  private static DatabaseManager sid1;
  private static DatabaseManager sid2;
  // more oracle instance...

  private Env env;

  /*
   * propertie file like this.
   *
   *   db.sid1.host = 192.168.xxx.xxx
   *   db.sid1.port = 1521
   *   db.sid1.sid = sid1
   *   db.sid1.user = xxx
   *   db.sid1.password = xxx
   *   
   *   db.sid2.host = 192.168.xxx.xxx
   *   db.sid2.port = 1521
   *   db.sid2.sid = xxx
   *   db.sid2.user = xxx
   *   db.sid2.password = xxx
   */
  private class Env {
    private Connection conn;
    private String url;
    private String user;
    private String password;
    public Env(String sid) {
      ResourceManager ru = ResourceManager.getInstance();
      url = "jdbc:oracle:thin:@" + ru.getStr("db." + sid + ".host")
        + ":" + ru.getStr("db." + sid + ".port") + ":"
        + ru.getStr("db." + sid + ".sid");
      user = ru.getStr("db." + sid + ".user");
      password = ru.getStr("db." + sid + ".password");
    }
    public Connection getConn() {
      return this.conn;
    }
    public void setConn(Connection conn) {
      this.conn = conn;
    }
    public String getUrl() {
      return this.url;
    }
    public String getUser() {
      return this.user;
    }
    public String getPassword() {
      return this.password;
    }
  }

  private DatabaseManager(String sid) {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      env = new Env(sid);
      env.setConn(DriverManager.getConnection(
            env.getUrl(), env.getUser(), env.getPassword()));
      env.getConn().setAutoCommit(false);
    } catch (ClassNotFoundException e) {
      throw new IllegalStateException("could not load driver");
    } catch (SQLException e) {
      throw new IllegalStateException("could not connect database");
    }
  }

  public static DatabaseManager getInstance1() {
    if (sid1 == null) return sid1 = new DatabaseManager("sid1");
    return sid1;
  }

  public static DatabaseManager getInstance2() {
    if (sid2 == null) return sid2 = new DatabaseManager("sid2");
    return sid2;
  }

  public void commit() {
    try {
      env.getConn().commit();
    } catch (SQLException e) {
    }
  }

  public void rollback() {
    try {
      env.getConn().rollback();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public void close() {
    try {
      env.getConn().close();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public void execute(String query) throws SQLException {
    Statement stmt = env.getConn().createStatement();
    stmt.executeUpdate(query);
    stmt.close();
  }

  private Map<String, String> getRecord(String query) {
    List<Map<String, String>> records = getRecords(query);
    if (records.isEmpty()) return null;
    return records.get(0);
  }

  private List<Map<String, String>> getRecords(String query) {
    try {
      List<Map<String, String>> records = new ArrayList<>();
      ResultSet rs = env.getConn().createStatement().executeQuery(query);
      while (rs.next()) {
        ResultSetMetaData rsmd = rs.getMetaData();
        Map<String, String> record = new HashMap<>();
        for (int n = 0; n < rsmd.getColumnCount(); n++) {
          String key = rsmd.getColumnName(n + 1);
          String val = rs.getString(key);
          record.put(key,val);
        }
        records.add(record);
      }
      rs.close();
      return records;
    } catch (SQLException e) {
      e.printStackTrace(System.out);
      throw new IllegalStateException("getRecords failed");
    }
  }

  /*
   * query example
   */
  public List<XXEntity> getXXEntityList() {
    String query = "SELECT X, Y, Z FROM XX_ENTITY";
    List<XXEntity> result = new ArrayList<>();
    for (Map<String, String> record: getRecords(query)) {
      XXEntity e = new XXEntity();
      e.setX(record.get("X"));
      e.setY(record.get("Y"));
      e.setZ(record.get("Z"));
      result.add(e);
    }
    return result;
  }

}
