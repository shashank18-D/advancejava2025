<%@ page import="java.sql.*, java.util.Properties" %>
<html>
<head>
    <title>Add and View Coffee Records</title>
</head>
<body>
    <h2>Add a New Coffee Product</h2>
    <form method="post" action="addCoffee.jsp">
        <label for="id">Coffee ID:</label>
        <input type="number" name="id" required><br><br>

        <label for="coffee_name">Coffee Name:</label>
        <input type="text" name="coffee_name" required><br><br>

        <label for="price">Price:</label>
        <input type="number" name="price" required><br><br>

        <input type="submit" value="Add Coffee">
    </form>

    <hr>

<%
    Connection dbConnection = null;
    PreparedStatement insertStmt = null;
    Statement readStmt = null;
    ResultSet rs = null;

    String idParam = request.getParameter("id");
    String nameParam = request.getParameter("coffee_name");
    String priceParam = request.getParameter("price");

    try {
        String url = "jdbc:mysql://localhost/test";
        Properties info = new Properties();
        info.put("user", "root"); // Replace with your DB username
        info.put("password", ""); // Replace with your DB password

        Class.forName("com.mysql.cj.jdbc.Driver");
        dbConnection = DriverManager.getConnection(url, info);

        if (dbConnection != null) {
            out.println("<h3 style='color:green;'>Connected to MySQL database 'test'</h3>");
        }

        // Insert the record if parameters are available (i.e., form submitted)
        if (idParam != null && nameParam != null && priceParam != null) {
            String insertQuery = "INSERT INTO coffee (id, coffee_name, priced) VALUES (?, ?, ?)";
            insertStmt = dbConnection.prepareStatement(insertQuery);
            insertStmt.setInt(1, Integer.parseInt(idParam));
            insertStmt.setString(2, nameParam);
            insertStmt.setInt(3, Integer.parseInt(priceParam));

            int result = insertStmt.executeUpdate();

            if (result > 0) {
                out.println("<p style='color:blue;'>New coffee product added successfully!</p>");
            } else {
                out.println("<p style='color:red;'>Failed to add coffee product.</p>");
            }

            insertStmt.close();
        }

        // Display all coffee records
        String selectQuery = "SELECT * FROM coffee";
        readStmt = dbConnection.createStatement();
        rs = readStmt.executeQuery(selectQuery);

        out.println("<h3>All Coffee Products:</h3>");
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
