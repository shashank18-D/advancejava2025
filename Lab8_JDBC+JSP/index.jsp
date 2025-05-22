<%--Exercises Part 1 8c
8c. Develop a JDBC project using JSP to append the fields empno, empname and basicsalary
into the table Emp of the database Employee by getting the fields through keyboard and
/Generate the report as follows--%>
<html>
<head><title>Add Employee</title></head>
<body>
<h2>Enter Employee Details</h2>
<form action="insert.jsp" method="post">
    Emp No: <input type="text" name="empno"><br>
    Emp Name: <input type="text" name="empname"><br>
    Basic Salary: <input type="text" name="salary"><br>
    <input type="submit" value="Add Employee">
</form>
<br>
<a href="report.jsp">Generate Salary Report</a>
</body>
</html>
