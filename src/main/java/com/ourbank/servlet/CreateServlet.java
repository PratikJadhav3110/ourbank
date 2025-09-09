package com.ourbank.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateServlet extends HttpServlet {

    // Handles POST request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        double amount = Double.parseDouble(request.getParameter("amount"));
        String address = request.getParameter("address");

        long phone = Long.parseLong(request.getParameter("phone"));

        // Call your DB registration logic
        int status = RegisterUser.register(username, password, repassword, amount,
                address, phone);

        if (status > 0) {
            out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
        } else {
            out.print("Sorry, Registration failed. Please try later");
            RequestDispatcher rd = request.getRequestDispatcher("create.html");
            rd.include(request, response);
        }

        out.close();
    }

    // Optional: redirect GET to POST if needed
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
