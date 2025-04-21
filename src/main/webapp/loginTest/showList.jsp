<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.ConnectMaria"%>
<%
//String sql = "SELECT * FROM userList";
//Connection conn = new ConnectMaria().getConn();
String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
String DB_URL = "jdbc:mariadb://113.198.235.241:9090/campusmapdb?useUnicode=true&characterEncoding=utf8";
String USER = "gon";
String PW = "20193172";
Connection conn;
//Statement stmt = conn.createStatement();
String sql = "SELECT * FROM gromiUser";
Class.forName(JDBC_DRIVER);
conn = DriverManager.getConnection(DB_URL, USER, PW);
PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
while (rs.next()) {
	String str = "id : " + rs.getString("id") + "\npw : " + rs.getString("pw") + "\nname : " + rs.getString("name");
	out.println(str);
}
out.flush();
%>