<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<%@ page import="com.ourbank.config.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        try {
            Connection con = DBUtil.getCon();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM new_account WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Login successful
                session.setAttribute("username", username);
                response.sendRedirect("index.html");  // Redirect to your home page
            } else {
                // ❌ Login failed
                out.println("<p style='color:red; text-align:center;'>Invalid Username or Password!</p>");
                out.println("<p style='text-align:center;'><a href='login.jsp'>Try Again</a></p>");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red; text-align:center;'>Something went wrong. Please try again later.</p>");
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Please enter both username and password!</p>");
        out.println("<p style='text-align:center;'><a href='login.jsp'>Go Back</a></p>");
    }
%>
