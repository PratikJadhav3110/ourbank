<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit Money</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div id="header">
    <h1>OUR - BANK</h1>
    <h2>ExtraOrdinary Service</h2>
</div>

<div id="navigation">
    <ul>
        <li><a href="create.html">NEW ACCOUNT</a></li>
        <li><a href="balance1.jsp">BALANCE</a></li>
        <li><a href="deposit1.jsp">DEPOSIT</a></li>
        <li><a href="withdraw1.jsp">WITHDRAW</a></li>
        <li><a href="transfer1.jsp">TRANSFER</a></li>
        <li><a href="closeac1.jsp">CLOSE A/C</a></li>
        <li><a href="about.jsp">Contact Us</a></li>
    </ul>
</div>

<div id="content">
<%
    String num = request.getParameter("accountno");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String amoun = request.getParameter("amount");

    int accountno = Integer.parseInt(num);
    int depositAmount = Integer.parseInt(amoun);

    boolean status = verifyLogin1.checkLogin(accountno, username, password);

    if(status) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = GetCon.getCon();

            // Get current balance
            ps = con.prepareStatement("SELECT amount FROM NEW_ACCOUNT WHERE accountno=?");
            ps.setInt(1, accountno);
            rs = ps.executeQuery();

            if(rs.next()) {
                int currentAmount = rs.getInt("amount");
                int newAmount = currentAmount + depositAmount;

                // Update balance
                ps.close();
                ps = con.prepareStatement("UPDATE NEW_ACCOUNT SET amount=? WHERE accountno=?");
                ps.setInt(1, newAmount);
                ps.setInt(2, accountno);
                int updated = ps.executeUpdate();

                if(updated > 0) {
                    request.setAttribute("totaldataamount", newAmount);
                    request.setAttribute("balance", "Your balance has increased.");
                    %>
                    <jsp:forward page="Totalbalance.jsp"/>
                    <%
                } else {
                    out.print("Failed to update balance. Please try again.");
                }
            } else {
                out.print("Account not found.");
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        }

    } else {
        out.print("Please check your username and password.");
        request.setAttribute("balance", "Invalid username or password.");
        %>
        <jsp:forward page="deposit1.jsp"/>
        <%
    }
%>
</div>

</body>
</html>
