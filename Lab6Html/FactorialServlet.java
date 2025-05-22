package com.factorial;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/factorial")
public class FactorialServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int number = Integer.parseInt(request.getParameter("number"));

            if (number < 0) {
                throw new IllegalArgumentException("Number cannot be negative");
            }
            if (number > 20) {
                throw new IllegalArgumentException("Number too large, maximum allowed is 20");
            }

            long factorial = 1;
            String calculation = "Calculation steps:<br>";

            if (number == 0 || number == 1) {
                calculation += number + "! = 1";
            } else {
                calculation += number + "! = ";
                for (int i = number; i >= 1; i--) {
                    factorial *= i;
                    calculation += (i == 1) ? i : i + " × ";
                }
                calculation += " = " + factorial;
            }

            out.println("<html><head><title>Factorial Result</title>");
            out.println("<style>.container { margin: 20px; padding: 20px; width: 500px; border: 1px solid #ccc; border-radius: 5px; } .result { margin: 10px 0; }</style>");
            out.println("</head><body>");
            out.println("<div class='container'><h2>Factorial Result</h2>");
            out.println("<div class='result'><p>Number: " + number + "</p>");
            out.println("<p>Factorial: " + factorial + "</p>");
            out.println("<p>" + calculation + "</p></div>");
            out.println("<a href='index.html'>Calculate Another Factorial</a></div></body></html>");

        } catch (NumberFormatException e) {
            displayError(out, "Please enter a valid number");
        } catch (IllegalArgumentException e) {
            displayError(out, e.getMessage());
        }
    }

    private void displayError(PrintWriter out, String message) {
        out.println("<html><head><title>Error</title></head><body>");
        out.println("<div style='margin: 20px; color: red;'>");
        out.println("<h2>Error</h2><p>" + message + "</p>");
        out.println("<a href='index.html'>Try Again</a></div></body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }
}
