package model;
import java.sql.*;

public class ConnectMysql {
	String test;
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String jdbcDriver = "jdbc:mysql://49.50.174.5:3306/TestDB?serverTimezone=UTC";
    String dbUser = "gon"; //mysql id
    String dbPass = "20193172"; //mysql password
    private static Connection conn;

    public ConnectMysql() {
        System.out.println("MysqlDB 입니다");
        if (conn == null) {
            try {
                Class.forName(JDBC_DRIVER);
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public Connection getConn() {
        return conn;
    }
}
