<%@ page import="java.sql.*" %>
<html>
<head><title>Salary Report</title></head>
<body>
<h2>Salary Report</h2>
<pre>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</pre>

<%
    int grandTotal = 0;

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        // Execute SQL query
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Emp");

        // Process result set
        while(rs.next()) {
            int id = rs.getInt("Emp_NO");
            String name = rs.getString("Emp_Name");
            int salary = rs.getInt("Basicsalary");
            grandTotal += salary;
%>
<pre>
Emp_No     : <%= id %>
Emp_Name   : <%= name %>
Basic      : <%= salary %>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</pre>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

<pre>
Grand Salary   : <%= grandTotal %>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</pre>

<a href="insert.jsp">Go Back</a>
</body>
</html>
