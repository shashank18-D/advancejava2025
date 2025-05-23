<%@ page import="java.sql.*, java.util.Properties" %>
<html>
<head>
    <title>Delete Coffee Product</title>
</head>
<body>
    <h2>Delete a Coffee Product</h2>
    <form method="post" action="deleteCoffee.jsp">
        <label for="id">Enter Coffee ID to Delete:</label>
        <input type="number" name="id" required><br><br>
        <input type="submit" value="Delete Coffee">
    </form>

    <hr>

<%
    Connection dbConnection = null;
    PreparedStatement deleteStmt = null;
    Statement readStmt = null;
    ResultSet rs = null;

    String idParam = request.getParameter("id");

    try {
        String url = "jdbc:mysql://localhost/test";
        Properties info = new Properties();
        info.put("user", "root"); // Your DB username
        info.put("password", ""); // Your DB password

        Class.forName("com.mysql.cj.jdbc.Driver");
        dbConnection = DriverManager.getConnection(url, info);

        if (dbConnection != null) {
            out.println("<h3 style='color:green;'>Connected to MySQL database 'test'</h3>");
        }

        // Delete record if ID was submitted
        if (idParam != null) {
            String deleteQuery = "DELETE FROM coffee WHERE id = ?";
            deleteStmt = dbConnection.prepareStatement(deleteQuery);
            deleteStmt.setInt(1, Integer.parseInt(idParam));

            int deleted = deleteStmt.executeUpdate();

            if (deleted > 0) {
                out.println("<p style='color:blue;'>Coffee record with ID " + idParam + " was deleted.</p>");
            } else {
                out.println("<p style='color:red;'>No record found with ID " + idParam + ".</p>");
            }

            deleteStmt.close();
        }

        // Display remaining coffee records
        String selectQuery = "SELECT * FROM coffee";
        readStmt = dbConnection.createStatement();
        rs = readStmt.executeQuery(selectQuery);

        out.println("<h3>Remaining Coffee Products:</h3>");
        out.println("<table border='1'><tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("coffee_name") + "</td>");
            out.println("<td>" + rs.getInt("priced") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        rs.close();
        readStmt.close();
        dbConnection.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
</body>
</html>
