<%@ page import="java.sql.*, java.util.Properties" %>
<html>
<head>
    <title>Update Coffee Record</title>
</head>
<body>
<%
    Connection dbConnection = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost/test";
        Properties info = new Properties();
        info.put("user", "root");
        info.put("password", "");

        Class.forName("com.mysql.cj.jdbc.Driver");
        dbConnection = DriverManager.getConnection(url, info);

        if (dbConnection != null) {
            out.println("<h2>Connected to MySQL database 'test'</h2>");
        }

        // Display all existing coffee records
        String query = "SELECT * FROM coffee";
        st = dbConnection.createStatement();
        rs = st.executeQuery(query);

        out.println("<h3>Current Coffee Records:</h3>");
        out.println("<table border='1'><tr><th>ID</th><th>Coffee Name</th><th>Price</th></tr>");
        while (rs.next()) {
            int id = rs.getInt("id");
            String coffee_name = rs.getString("coffee_name");
            int price = rs.getInt("priced");
            out.println("<tr><td>" + id + "</td><td>" + coffee_name + "</td><td>" + price + "</td></tr>");
        }
        out.println("</table>");
        rs.close();
        st.close();

        // Update specific coffee record by ID (e.g., ID = 102)
        String updateQuery = "UPDATE coffee SET priced = 1000 WHERE id = 102";
        PreparedStatement preparedStmt = dbConnection.prepareStatement(updateQuery);
        int updatedRows = preparedStmt.executeUpdate();

        if (updatedRows > 0) {
            out.println("<p style='color:green;'>Coffee record with ID = 102 was updated successfully!</p>");
        } else {
            out.println("<p style='color:red;'>No coffee record with ID = 102 found to update.</p>");
        }

        preparedStmt.close();
        dbConnection.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out)); // Fixed here
    }
%>
</body>
</html>
