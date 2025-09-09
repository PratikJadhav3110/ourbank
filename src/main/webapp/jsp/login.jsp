<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - OUR BANK</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<script>
function validateLoginForm(form) {
    const accountno = form.accountno.value.trim();
    const username = form.username.value.trim();
    const password = form.password.value.trim();

    if(!accountno || !username || !password) {
        alert("Fill out all fields");
        form.accountno.focus();
        return false;
    }

    if(isNaN(accountno)) {
        alert("Account No must be a number");
        form.accountno.focus();
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

<table style="width:600px; margin:0 auto; background:#fff; border:1px solid #ccc; padding:15px;">
    <tr>
        <th colspan="2" style="text-align:center;">USER LOGIN</th>
    </tr>

    <% if(request.getAttribute("loginMessage") != null) { %>
        <tr>
            <td colspan="2" style="color:red; text-align:center;">
                <%= request.getAttribute("loginMessage") %>
            </td>
        </tr>
    <% } %>

    <form name="F1" onsubmit="return validateLoginForm(this)" action="LoginServlet" method="post">
        <tr>
            <td>ACCOUNT NO:</td>
            <td><input type="text" name="accountno"/></td>
        </tr>
        <tr>
            <td>USER NAME:</td>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <td>PASSWORD:</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" value="Login"/>
                <input type="reset" value="Clear"/>
            </td>
        </tr>
    </form>
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
