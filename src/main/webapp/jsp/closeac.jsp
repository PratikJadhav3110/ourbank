<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.ourbank.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Banking</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div id="top_links"></div>

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

<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr>
    <td width="300" valign="top" style="border-right:#666666 1px dotted;">
        <div id="services">
            <h1>Services</h1>
            <ul>
                <li><a href="create.html">Instant Account Opening</a></li>
                <li>24/7 Customer Support</li>
                <li>Financing Products & Advisory Services</li>
                <li>Treasury</li>
                <li>Asset Management</li>
                <li>E-Banking Services: ATM, Mobile & Internet Banking, Card Services</li>
                <li>Cybersecurity and Fraud Prevention</li>
                <li>Cross-Border Banking</li>
                <li>Multi-Currency Accounts</li>
            </ul>
        </div>
    </td>

    <td width="1200" valign="top">
        <%
            String num = request.getParameter("accountno");
            int accountno = Integer.parseInt(num);
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            boolean status = verifyLogin1.checkLogin(accountno, username, password);
            try {
                if (status) {
                    out.print("Welcome " + username);

                    Connection con = GetCon.getCon();
                    PreparedStatement ps = con.prepareStatement("DELETE FROM NEWACCOUNT WHERE accountno=?");
                    ps.setInt(1, accountno);
                    ps.executeUpdate();

                    out.print("&nbsp;&nbsp;&nbsp;Your account no '" + accountno + "' has been closed.");
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='index.html'><img src='images/home1.gif'/></a>");

                    ps.close();
                    con.close();
                } else {
                    out.print("Please check your username and password");
                    request.setAttribute("balance", "Please check your username and password");
                    %><jsp:forward page="closeac1.jsp"/><%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </td>
</tr>
</table>

</body>
</html>
