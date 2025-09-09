<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Global Banking - Withdraw</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div id="top_links">
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
            <!-- Services Column -->
            <td width="300" valign="top" style="border-right:#666666 1px dotted;">
                <div id="services">
                    <h1>Services</h1><br>
                    <li><a href="create.html">Instant Account Opening</a></li>
                    <li>24/7 Customer Support</li>
                    <li>Financing Products & Advisory Services</li>
                    <li>Treasury</li>
                    <li>Asset Management</li>
                    <li>E-Banking Services: ATM, Mobile & Internet Banking, Card Services, Savings Accounts, Loan Services</li>
                    <li>Cybersecurity and Fraud Prevention</li>
                    <li>Cross-Border Banking</li>
                    <li>Multi-Currency Accounts</li>
                </div>
            </td>

            <!-- Withdraw Form Column -->
            <td width="600" valign="top">
                <div id="welcome" style="border-right:#666666 1px dotted;">
                    <h1>WITHDRAW FORM</h1><br>
                    <table align="center" bgcolor="white">
                        <tr>
                            <td>
                                <div>
                                    <% if (request.getAttribute("balance") != null) {
                                        out.print(request.getAttribute("balance"));
                                    } %>
                                </div>

                                <form name="F1" method="get" action="withdraw1.jsp">
                                    <table cellspacing="5" cellpadding="3">
                                        <tr><td>ACCOUNT NO:</td><td><input type="text" name="accountno"/></td></tr>
                                        <tr><td>USER NAME:</td><td><input type="text" name="username"/></td></tr>
                                        <tr><td>PASSWORD:</td><td><input type="password" name="password"/></td></tr>
                                        <tr><td>AMOUNT:</td><td><input type="text" name="amount"/></td></tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <input type="submit" value="Submit"/>
                                                <input type="reset" value="CLEAR"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>

                                <%
                                    // Withdraw Logic
                                    String num = request.getParameter("accountno");
                                    String username = request.getParameter("username");
                                    String password = request.getParameter("password");
                                    String amoun = request.getParameter("amount");

                                    if (num != null && username != null && password != null && amoun != null) {
                                        int accountno = Integer.parseInt(num);
                                        int withdrawAmount = Integer.parseInt(amoun);

                                        boolean status = verifyLogin1.checkLogin(accountno, username, password);

                                        if (status) {
                                            Connection con = GetCon.getCon();
                                            PreparedStatement ps = con.prepareStatement("SELECT amount FROM NEW_ACCOUNT WHERE accountno=?");
                                            ps.setInt(1, accountno);
                                            ResultSet rs = ps.executeQuery();

                                            if (rs.next()) {
                                                int currentBalance = rs.getInt("amount");
                                                if (withdrawAmount > currentBalance) {
                                                    request.setAttribute("balance", "Insufficient balance!");
                                                } else {
                                                    int newBalance = currentBalance - withdrawAmount;

                                                    PreparedStatement psUpdate = con.prepareStatement(
                                                            "UPDATE NEW_ACCOUNT SET amount=? WHERE accountno=?");
                                                    psUpdate.setInt(1, newBalance);
                                                    psUpdate.setInt(2, accountno);
                                                    psUpdate.executeUpdate();

                                                    request.setAttribute("totaldataamount", newBalance);
                                                    request.setAttribute("balance", "Withdrawal successful! New balance: " + newBalance);
                                                }
                                            }
                                            rs.close();
                                            ps.close();
                                            con.close();
                                            %>
                                            <jsp:forward page="Totalbalance.jsp"/>
                                            <%
                                        } else {
                                            request.setAttribute("balance", "Please check your username and password");
                                            %>
                                            <jsp:forward page="withdraw1.jsp"/>
                                            <%
                                        }
                                    }
                                %>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>

            <!-- Welcome Column -->
            <td width="299" valign="top">
                <div id="welcome" style="border-right:#666666 1px dotted;">
                    <h1>Welcome</h1><br>
                    <center><img src="../images/globe_10.gif" alt="business" width="196" height="106"></center><br>
                    <p>Welcome to Our Bank! Your financial journey starts here. We're dedicated to providing personalized banking solutions and exceptional service to help you achieve your goals. Thank you for choosing us. Let's embark on this journey together!</p>
                </div>
            </td>
        </tr>
    </table>

    <div id="footer_top">
        <div id="footer_copyright">
            <center><img src="../images/Business.gif" alt="business" width="250" height="130"></center><br>
            <p>"Unlock your business potential with our tailored loans! At OUR bank, we understand the importance of financial support for your business aspirations. Our flexible business loan options are designed to fuel your growth and help you achieve your goals. Let's build a prosperous future together".</p>
            Copyright <strong>&copy; OUR BANK</strong>
        </div>
    </div>
</div>

</body>
</html>
