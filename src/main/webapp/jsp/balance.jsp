<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.ourbank.servlet.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Global Banking ..</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");
        }
    </script>
</head>

<body>
<div id="top_links">
    <div id="header">
        <h1>OUR - BANK<span class="style1"></span></h1>
        <h2>ExtraOrdinary Service</h2>
        <a href="<%= request.getContextPath() %>/index.html">
            <img src="<%= request.getContextPath() %>/images/hmm.gif" height="60px" width="60px" alt="Home">
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
            <!-- Sidebar -->
            <td width="300" valign="top" style="border-right:#666666 1px dotted;">
                <div id="services">
                    <h1>Services</h1><br>
                    <li><a href="create.html">Instant Account Opening</a></li><br>
                    <li>24/7 Customer Support</li><br>
                    <li>Financing Products & Advisory Services</li><br>
                    <li>Treasury</li><br>
                    <li>Asset Management</li><br>
                    <li>E-Banking Services: ATM, Mobile, Internet Banking, Cards, Savings, Loans</li><br>
                    <li>Cybersecurity and Fraud Prevention</li><br>
                    <li>Cross-Border Banking</li><br>
                    <li>Multi-Currency Accounts</li>
                </div>
            </td>

            <!-- Main Content -->
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
                            PreparedStatement ps = con.prepareStatement(
                                    "SELECT * FROM NEW_ACCOUNT WHERE accountno=?");
                            ps.setInt(1, accountno);
                            ResultSet rs = ps.executeQuery();

                            out.print("<table align='left' cellspacing='5' cellpadding='5'>");
                            out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");

                            while (rs.next()) {
                                int accountno1 = rs.getInt(1);
                                session.setAttribute("accountno", accountno1);

                                out.print("<tr>");
                                out.print("<td>" + rs.getInt(1) + "</td>");
                                out.print("<td>" + rs.getString(2) + "</td>");
                                out.print("<td>" + rs.getInt(5) + "</td>");
                                out.print("<td>" + rs.getString(6) + "</td>");
                                out.print("<td>" + rs.getInt(7) + "</td>");
                                out.print("</tr>");
                            }
                            out.print("</table>");
                        } else {
                            out.print("Please check your username and Password");
                            request.setAttribute("balance", "Please check your username and Password");
                %>
                            <jsp:forward page="balance1.jsp" />
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
