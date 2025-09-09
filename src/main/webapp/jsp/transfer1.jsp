<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Global Banking - Transfer</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<script>
function validateTransferForm(form) {
    const accountno = form.accountno.value.trim();
    const username = form.username.value.trim();
    const password = form.password.value.trim();
    const taccountno = form.taccountno.value.trim();
    const amount = form.amount.value.trim();

    if(!accountno || !username || !password || !taccountno || !amount) {
        alert("Fill out all fields");
        form.accountno.focus();
        return false;
    }

    if(isNaN(accountno)) {
        alert("Account No must be a number");
        form.accountno.focus();
        return false;
    }

    if(isNaN(taccountno)) {
        alert("Target Account No must be a number");
        form.taccountno.focus();
        return false;
    }

    if(accountno === taccountno) {
        alert("Target account cannot be same as source account");
        form.taccountno.focus();
        return false;
    }

    if(isNaN(amount) || parseFloat(amount) <= 0) {
        alert("Amount must be a positive number");
        form.amount.focus();
        return false;
    }

    return true;
}
</script>
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

<table style="width:800px; background:#FFFFFF; margin:0 auto;">
<tr>
    <!-- Sidebar -->
    <td width="100" valign="top" style="border-right:1px dotted #666;">
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

    <!-- Transfer Form -->
    <td width="450" valign="top">
        <h1>TRANSFER FORM</h1>
        <% if(request.getAttribute("balance") != null) { %>
            <div style="color:green;">
                <%= request.getAttribute("balance") %>
            </div>
        <% } %>

        <form name="F1" onsubmit="return validateTransferForm(this)" action="transfer.jsp" method="post">
            <table cellspacing="5" cellpadding="3">
                <tr><td>ACCOUNT NO:</td><td><input type="text" name="accountno"/></td></tr>
                <tr><td>USER NAME:</td><td><input type="text" name="username"/></td></tr>
                <tr><td>PASSWORD:</td><td><input type="password" name="password"/></td></tr>
                <tr><td>TARGET ACCOUNT NO:</td><td><input type="text" name="taccountno"/></td></tr>
                <tr><td>AMOUNT:</td><td><input type="text" name="amount"/></td></tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </td>

    <!-- Welcome / Info -->
    <td width="250" valign="top">
        <h1>Welcome</h1>
        <center><img src="../images/globe_10.gif" alt="business" width="196" height="106"></center>
        <p>Welcome to Our Bank! Your financial journey starts here. We're dedicated to providing personalized banking solutions and exceptional service to help you achieve your goals. Thank you for choosing us!</p>
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
