<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Employees by Letter & Show Salary Report</title>
</head>
<body>
    <h2>Delete Employees by First Letter of Name</h2>

    <!-- Input Form -->
    <form method="post">
        Enter starting letter: 
        <input type="text" name="letter" maxlength="1" required />
        <input type="submit" value="Delete & Generate Report" />
    </form>

<%
    String letter = request.getParameter("letter");
    int grandTotal = 0;

    if (letter != null && !letter.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement selectStmt = null, deleteStmt = null;
        Statement remainingStmt = null;
        ResultSet rs = null, remainingRs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

            // Step 1: Fetch and show records to be deleted
            String selectQuery = "SELECT * FROM Emp WHERE Emp_Name LIKE ?";
            selectStmt = conn.prepareStatement(selectQuery);
            selectStmt.setString(1, letter + "%");
            rs = selectStmt.executeQuery();

            out.println("<h3>Deleted Employees</h3>");
            out.println("<pre>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");

            int deletedCount = 0;
            while (rs.next()) {
                int id = rs.getInt("Emp_NO");
                String name = rs.getString("Emp_Name");
                int salary = rs.getInt("Basicsalary");

                out.println("<pre>Emp_No     : " + id + "\nEmp_Name   : " + name + "\nBasic      : " + salary + 
                            "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");
                deletedCount++;
            }
            rs.close();
            selectStmt.close();

            if (deletedCount == 0) {
                out.println("<p>No employees found starting with '" + letter + "'</p>");
            }

            // Step 2: Delete the records
            String deleteQuery = "DELETE FROM Emp WHERE Emp_Name LIKE ?";
            deleteStmt = conn.prepareStatement(deleteQuery);
            deleteStmt.setString(1, letter + "%");
            deleteStmt.executeUpdate();

            // Step 3: Generate Salary Report for remaining employees
            out.println("<h3>Remaining Employees (Salary Report)</h3>");
            out.println("<pre>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");

            remainingStmt = conn.createStatement();
            remainingRs = remainingStmt.executeQuery("SELECT * FROM Emp");

            while (remainingRs.next()) {
                int id = remainingRs.getInt("Emp_NO");
                String name = remainingRs.getString("Emp_Name");
                int salary = remainingRs.getInt("Basicsalary");
                grandTotal += salary;

                out.println("<pre>Emp_No     : " + id + "\nEmp_Name   : " + name + "\nBasic      : " + salary + 
                            "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");
            }

            out.println("<pre>Grand Salary   : " + grandTotal + 
                        "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>");

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (remainingRs != null) remainingRs.close(); } catch (Exception e) {}
            try { if (selectStmt != null) selectStmt.close(); } catch (Exception e) {}
            try { if (deleteStmt != null) deleteStmt.close(); } catch (Exception e) {}
            try { if (remainingStmt != null) remainingStmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>
</body>
</html>
