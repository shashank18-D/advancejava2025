<%-- 9c. Develop a JDBC project using MySQL to append the fields empno, empname and
basicsalary into the table Emp of the database Employee by getting the fields through keyboard
and Generate the report as follows--%>>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Filtered Salary Report</title>
</head>
<body>

<h2>Generate Salary Report</h2>
<form method="get" action="salaryReport.jsp">
    <label for="startLetter">Enter starting letter of employee name:</label>
    <input type="text" name="startLetter" maxlength="1" required />
    <input type="submit" value="Generate Report" />
</form>

<%
    String startLetter = request.getParameter("startLetter");

    if (startLetter != null && !startLetter.isEmpty()) {
        String url = "jdbc:mysql://localhost:3306/employee";
        String user = "root";
        String password = "";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM Emp WHERE Emp_Name LIKE ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, startLetter + "%");
            rs = stmt.executeQuery();
%>

    <h3>Salary Report for names starting with '<%= startLetter %>'</h3>
    <hr/>
<%
            boolean found = false;
            while (rs.next()) {
                found = true;
%>
        <div style="margin-bottom:10px;">
            <strong>Emp_No:</strong> <%= rs.getInt("Emp_NO") %><br/>
            <strong>Emp_Name:</strong> <%= rs.getString("Emp_Name") %><br/>
            <strong>Basic Salary:</strong> ₹<%= rs.getInt("Basicsalary") %><br/>
            <hr/>
        </div>
<%
            }
            if (!found) {
%>
        <p>⚠️ No employees found starting with '<%= startLetter %>'</p>
<%
            }
        } catch (Exception e) {
%>
        <p style="color:red;">❌ Error: <%= e.getMessage() %></p>
<%
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>

</body>
</html>
