<%--Exercises Part 1 8d
8d. Develop a JDBC project using JSP to update the fields empno, empname and basicsalary into
the table Emp of the database Employee by getting the fields through keyboard.--%>
<%@ include file="dbconfig.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee Information</title>
</head>
<body>
    <h2>Update Employee Details</h2>
    <form action="updateEmployee.jsp" method="POST">
        <label for="empno">Employee Number:</label><br>
        <input type="number" id="empno" name="empno" required><br><br>

        <label for="empname">Employee Name:</label><br>
        <input type="text" id="empname" name="empname" required><br><br>

        <label for="basicsalary">Basic Salary:</label><br>
        <input type="number" id="basicsalary" name="basicsalary" required><br><br>

        <input type="submit" value="Update">
    </form>
</body>
</html>
