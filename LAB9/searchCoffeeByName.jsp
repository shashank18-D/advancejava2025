<%@ page import="java.sql.*, java.util.Properties" %>
<html>
<head>
    <title>Search Coffee Products Starting with a Letter</title>
</head>
<body>
    <h2>Search Coffee Products by Name Starting With a Specific Letter</h2>
    <form method="post" action="searchCoffeeByName.jsp">
        <label for="letter">Enter starting letter (e.g., D):</label>
        <input type="text" name="letter" maxlength="1" required><br><br>
        <input type="submit" value="Search">
    </form>

    <hr>

<%
    Connection dbConnection = null;
    PreparedStatement searchStmt = null;
    Statement readStmt = null;
    ResultSet rs = null;
    ResultSet searchRs = null;

    String letterParam = request.getParameter("letter");

    try {
        String url = "jdbc:mysql://localhost/test";
        Properties info = new Properties();
        info.put("user", "root");  // Replace with your DB username
        info.put("password", "");  // Replace with your DB password

        Class.forName("com.mysql.cj.jdbc.Driver");
        dbConnection = DriverManager.getConnection(url, info);

        if (dbConnection != null) {
            out.println("<h3 style='color:green;'>Connected to MySQL database 'test'</h3>");
        }

        // Show all coffee records
        String readQuery = "SELECT * FROM coffee";
        readStmt = dbConnection.createStatement();
        rs = readStmt.executeQuery(readQuery);

        out.println("<h3>All Coffee Products:</h3>");
        out.println("<table border='1'><tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("coffee_name") + "</td>");
            out.println("<td>" + rs.getInt("priced") + "</td>");
            out.println("</tr>");
        }
        out.println("</table><br>");

        rs.close();
        readStmt.close();

        // Search by name starting with given letter
        if (letterParam != null && !letterParam.isEmpty()) {
            String searchQuery = "SELECT * FROM coffee WHERE coffee_name LIKE ?";
            searchStmt = dbConnection.prepareStatement(searchQuery);
            searchStmt.setString(1, letterParam + "%");

            searchRs = searchStmt.executeQuery();

            out.println("<h3>Coffee Products Starting with '" + letterParam + "':</h3>");
            out.println("<table border='1'><tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");
            boolean found = false;
            while (searchRs.next()) {
                found = true;
                out.println("<tr>");
                out.println("<td>" + searchRs.getInt("id") + "</td>");
                out.println("<td>" + searchRs.getString("coffee_name") + "</td>");
                out.println("<td>" + searchRs.getInt("priced") + "</td>");
                out.println("</tr>");
            }
            if (!found) {
                out.println("<tr><td colspan='3'>No coffee products found starting with '" + letterParam + "'</td></tr>");
            }
            out.println("</table>");
        }

        if (searchRs != null) searchRs.close();
        if (searchStmt != null) searchStmt.close();
        if (dbConnection != null) dbConnection.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
</body>
</html>
