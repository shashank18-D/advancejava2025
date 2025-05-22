package com.mysql;
import java.sql.*;
import java.util.Scanner;

public class EmployeeJDBC {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/employee";
        String user = "root"; // use your MySQL username
        String password = ""; // use your MySQL password if any
        try (
            Connection conn = DriverManager.getConnection(url, user, password);
            Scanner sc = new Scanner(System.in);
        ) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Insert 5 employee records from keyboard
            String insertQuery = "INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);

            for (int i = 1; i <= 5; i++) {
                System.out.println("Enter details for employee " + i);
                System.out.print("Emp No: ");
                int empNo = sc.nextInt();
                sc.nextLine(); // Consume newline
                System.out.print("Emp Name: ");
                String empName = sc.nextLine();
                System.out.print("Basic Salary: ");
                int salary = sc.nextInt();

                pst.setInt(1, empNo);
                pst.setString(2, empName);
                pst.setInt(3, salary);
                pst.executeUpdate();
            }

            // Generate salary report for employees with name starting with 'R'
            String reportQuery = "SELECT * FROM Emp WHERE Emp_Name LIKE 'R%'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(reportQuery);

            int grandTotal = 0;
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println("Salary Report");
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

            while (rs.next()) {
                int empNo = rs.getInt("Emp_NO");
                String empName = rs.getString("Emp_Name");
                int salary = rs.getInt("Basicsalary");

                System.out.println("Emp_No   : " + empNo);
                System.out.println("Emp_Name : " + empName);
                System.out.println("Basic    : " + salary);
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

                grandTotal += salary;
            }

            System.out.println("Grand Salary : " + grandTotal);

            rs.close();
            stmt.close();
            pst.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}