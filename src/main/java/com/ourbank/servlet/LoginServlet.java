package com.ourbank.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;
import com.ourbank.config.DBUtil;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNoStr = request.getParameter("accountno");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int accountNo = 0;
        try {
            accountNo = Integer.parseInt(accountNoStr);
        } catch (NumberFormatException e) {
            request.setAttribute("balance", "Invalid Account Number");
            request.getRequestDispatcher("index.html").forward(request, response);
            return;
        }

        try (Connection con = DBUtil.getCon()) {
            String sql = "SELECT * FROM NEW_ACCOUNT WHERE accountno=? AND username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accountNo);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("accountno", accountNo);
                session.setAttribute("username", username);
                response.sendRedirect("balance1.jsp"); // redirect to balance page after login
            } else {
                request.setAttribute("balance", "Invalid username/password");
                request.getRequestDispatcher("index.html").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
