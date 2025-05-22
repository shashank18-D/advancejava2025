<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Salary Entry & Report</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/employee";
    String user = "root";
    String password = "";

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stmt = null;
    ResultSet rs = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String insertQuery = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
            pst = conn.prepareStatement(insertQuery);

            for (int i = 1; i <= 5; i++) {
                int empNo = Integer.parseInt(request.getParameter("empNo" + i));
                String empName = request.getParameter("empName" + i);
                int salary = Integer.parseInt(request.getParameter("salary" + i));

                pst.setInt(1, empNo);
                pst.setString(2, empName);
                pst.setInt(3, salary);
                pst.executeUpdate();
            }

            // Salary Report
            String reportQuery = "SELECT * FROM Emp WHERE Emp_Name LIKE 'R%'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(reportQuery);

            int grandTotal = 0;
%>
            <h2>Salary Report (Employees whose names start with 'R')</h2>
            <hr/>
<%
            while (rs.next()) {
                int empNo = rs.getInt("Emp_NO");
                String empName = rs.getString("Emp_Name");
                int salary = rs.getInt("Basicsalary");
                grandTotal += salary;
%>
                <p>
                    <strong>Emp No:</strong> <%= empNo %><br/>
                    <strong>Name:</strong> <%= empName %><br/>
                    <strong>Salary:</strong> ₹<%= salary %>
                </p>
                <hr/>
<%
            }
%>
            <h3>Total Salary of 'R%' Employees: ₹<%= grandTotal %></h3>
<%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    } else {
%>
    <h2>Enter Employee Details (5 Records)</h2>
    <form method="post">
        <%
            for (int i = 1; i <= 5; i++) {
        %>
        <fieldset>
            <legend>Employee <%= i %></legend>
            Emp No: <input type="number" name="empNo<%=i%>" required/><br/>
            Name: <input type="text" name="empName<%=i%>" required/><br/>
            Basic Salary: <input type="number" name="salary<%=i%>" required/><br/>
        </fieldset>
        <br/>
        <%
            }
        %>
        <input type="submit" value="Submit & Generate Report"/>
    </form>
<%
    }
%>
</body>
</html>
