<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Insert Employee</title>
</head>
<body>
<h2>Insert New Employee</h2>

<%
    String message = "";
    if(request.getParameter("submit") != null) {
        int empNo = Integer.parseInt(request.getParameter("empno"));
        String empName = request.getParameter("empname");
        int basicSalary = Integer.parseInt(request.getParameter("salary"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            String insertQuery = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setInt(1, empNo);
            pstmt.setString(2, empName);
            pstmt.setInt(3, basicSalary);

            int rows = pstmt.executeUpdate();
            if(rows > 0) {
                message = "Employee inserted successfully.";
            } else {
                message = "Insert failed.";
            }

        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
%>

<form method="post" action="insert.jsp">
    <label>Emp No:</label> <input type="text" name="empno" required><br><br>
    <label>Emp Name:</label> <input type="text" name="empname" required><br><br>
    <label>Basic Salary:</label> <input type="text" name="salary" required><br><br>
    <input type="submit" name="submit" value="Insert">
</form>

<p style="color:green;"><%= message %></p>
<br>
<a href="salaryReport.jsp">View Salary Report</a>
</body>
</html>
