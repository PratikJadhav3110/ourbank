<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Banking - Account Info</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div id="header">
    <h1>OUR - BANK</h1>
    <h2>ExtraOrdinary Service</h2>
    <a href="<%= request.getContextPath() %>/index.html">
        <img src="<%= request.getContextPath() %>/images/hmm.gif" height="60" width="60" alt="Home">
    </a>
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
    <td width="300" valign="top" style="border-right:1px dotted #666;">
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
        <table style="width:100%; border:1px solid #ccc;">
            <tr>
                <td align="center" bgcolor="red"><h4>Account Info</h4></td>
            </tr>
            <tr>
                <td style="padding:10px; text-align:center;">
                    <%
                        Object balanceMsg = request.getAttribute("balance");
                        Object totalAmount = request.getAttribute("totaldataamount");
                        if(balanceMsg != null) {
                            out.println("<p>" + balanceMsg + "</p>");
                        }
                        if(totalAmount != null) {
                            out.println("<p>Total Balance: " + totalAmount + "</p>");
                        }
                    %>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>

</body>
</html>
