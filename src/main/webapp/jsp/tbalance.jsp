<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Successful - OUR BANK</title>
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
        <li><a href="about.jsp">ABOUT US</a></li>
    </ul>
</div>

<table style="width:600px; margin:0 auto; background:#fff; border:1px solid #ccc; padding:15px;">
    <tr>
        <th colspan="2" style="text-align:center;">TRANSFER SUCCESSFUL</th>
    </tr>
    <tr>
        <td>Source Account Balance:</td>
        <td><%= request.getAttribute("sourceAccount") != null ? request.getAttribute("sourceAccount") : "N/A" %></td>
    </tr>
    <tr>
        <td>Target Account Balance:</td>
        <td><%= request.getAttribute("targetAccount") != null ? request.getAttribute("targetAccount") : "N/A" %></td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center; padding-top:10px;">
            <a href="transfer1.jsp">Make Another Transfer</a>
        </td>
    </tr>
</table>

<div id="footer_top">
    <div id="footer_copyright">
        <center><img src="../images/Business.gif" alt="business" width="250" height="130"></center>
        <p>"Unlock your business potential with our tailored loans! Our flexible business loan options are designed to fuel your growth and help you achieve your goals."</p>
        <p>Copyright &copy; OUR BANK</p>
    </div>
</div>

</body>
</html>
