<%--Exercises Part 2 8c
8c. Develop a JDBC project using JSP to append the fields empno, empname and basicsalary
into the table Emp of the database Employee by getting the fields through keyboard and
/Generate the report as follows--%>
<%@ include file="dbconfig.jsp" %>
<%
    Statement stmt = null;
    ResultSet rs = null;
    int grandTotal = 0;
    
    try {
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Emp");
        
        while (rs.next()) {
            int empNo = rs.getInt("Emp_NO");
            String empName = rs.getString("Emp_Name");
            int basicSalary = rs.getInt("Basicsalary");
            grandTotal += basicSalary;
            
            out.println("<hr>");
            out.println("Emp_No : " + empNo + "<br>");
            out.println("Emp_Name : " + empName + "<br>");
            out.println("Basic : " + basicSalary + "<br>");
            out.println("<hr>");
        }
    } catch (SQLException e) {
        out.println("<p>Error fetching records: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<hr>
<p>Grand Salary: <%= grandTotal %></p>
