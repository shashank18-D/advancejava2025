
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<h2>Update Employee Record</h2>

<form method="post">
    <label>Employee No:</label>
    <input type="text" name="empno" required><br><br>
    
    <label>New Name:</label>
    <input type="text" name="empname" required><br><br>
    
    <label>New Basic Salary:</label>
    <input type="text" name="basicsalary" required><br><br>
    
    <input type="submit" value="Update">
</form>

<%
    String empno = request.getParameter("empno");
    String empname = request.getParameter("empname");
    String basicsalary = request.getParameter("basicsalary");

    if (empno != null && empname != null && basicsalary != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            String sql = "UPDATE Emp SET Emp_Name=?, Basicsalary=? WHERE Emp_NO=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, empname);
            pstmt.setInt(2, Integer.parseInt(basicsalary));
            pstmt.setInt(3, Integer.parseInt(empno));

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<p>Employee record updated successfully!</p>");
            } else {
                out.println("<p>No record found with Emp_NO: " + empno + "</p>");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<br><a href="index.jsp">Go Back</a>
</body>
</html>
