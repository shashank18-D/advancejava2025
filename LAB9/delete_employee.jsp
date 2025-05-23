<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Delete Employee by ID</h2>
    <form method="post">
        Enter Employee ID to Delete: <input type="text" name="empid" required />
        <input type="submit" value="Delete" />
    </form>
    <hr>

<%
    String empid = request.getParameter("empid");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

        if (empid != null && !empid.trim().equals("")) {
            int id = Integer.parseInt(empid);
            ps = conn.prepareStatement("DELETE FROM Emp WHERE Emp_NO = ?");
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            ps.close();

            if (rows > 0) {
                out.println("<p style='color:green;'>Employee with ID " + id + " deleted successfully.</p>");
            } else {
                out.println("<p style='color:red;'>No employee found with ID " + id + ".</p>");
            }
        }

        // Generate employee report
        out.println("<h3>Current Employee List</h3>");
        ps = conn.prepareStatement("SELECT * FROM Emp");
        rs = ps.executeQuery();

        out.println("<table>");
        out.println("<tr><th>Emp_NO</th><th>Emp_Name</th><th>Basicsalary</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("Emp_NO") + "</td>");
            out.println("<td>" + rs.getString("Emp_Name") + "</td>");
            out.println("<td>" + rs.getInt("Basicsalary") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

</body>
</html>
