<%@ page import="java.sql.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<%@ page import="com.ourbank.config.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Register User</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String address  = request.getParameter("address");
    String phoneStr = request.getParameter("phone");
    String amountStr= request.getParameter("amount");

    long phone = 0;
    int amount = 0;

    if (phoneStr != null && !phoneStr.isEmpty()) {
        phone = Long.parseLong(phoneStr);
    }
    if (amountStr != null && !amountStr.isEmpty()) {
        amount = Integer.parseInt(amountStr);
    }

    try {
        Connection con = DBUtil.getCon();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO new_account(username, password, amount, address, phone) VALUES (?, ?, ?, ?, ?)"
        );
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setInt(3, amount);
        ps.setString(4, address);
        ps.setLong(5, phone);

        int i = ps.executeUpdate();
        if (i > 0) {
            out.println("<h3 style='color:green'>Account created successfully!</h3>");
            out.println("<a href='login.jsp'>Click here to Login</a>");
        } else {
            out.println("<h3 style='color:red'>Failed to create account. Try again.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace(out);
    }
%>
</body>
</html>
