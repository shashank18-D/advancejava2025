<%--This is main congig file that is used to crerate the JDBC connection between the java program and the mywql --%>
<%@ page import="java.sql.*" %>
<%
String url = "jdbc:mysql://localhost:3306/employee";
String user = "root";
String password = "";
Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL JDBC driver
    conn = DriverManager.getConnection(url, user, password);  // Create connection
} catch (ClassNotFoundException e) {
    out.println("JDBC Driver not found!");
    e.printStackTrace();
} catch (SQLException e) {
    out.println("Connection failed!");
    e.printStackTrace();
}
%>
