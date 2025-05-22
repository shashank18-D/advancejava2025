<%@ page import="java.sql.*" %>
<%
    int empno = Integer.parseInt(request.getParameter("empno"));
    String empname = request.getParameter("empname");
    int salary = Integer.parseInt(request.getParameter("salary"));

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "");

        String sql = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, empno);
        pst.setString(2, empname);
        pst.setInt(3, salary);

        int rowsInserted = pst.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<p>✅ Employee inserted successfully!</p>");
        } else {
            out.println("<p>❌ Failed to insert employee.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error inserting employee: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (pst != null) pst.close();
        if (conn != null) conn.close();
    }
%>
<a href="index.jsp">Go Back</a>
