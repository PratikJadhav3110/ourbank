<%@ page import="java.sql.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String accountNoStr = request.getParameter("accountno");
String username = request.getParameter("username");
String password = request.getParameter("password");
String targetAccountStr = request.getParameter("taccountno");
String amountStr = request.getParameter("amount");

if(accountNoStr != null && username != null && password != null
        && targetAccountStr != null && amountStr != null) {

    int accountNo = Integer.parseInt(accountNoStr);
    int targetAccount = Integer.parseInt(targetAccountStr);
    int amount = Integer.parseInt(amountStr);

    boolean status = verifyLogin1.checkLogin(accountNo, username, password);

    if(!status) {
        request.setAttribute("balance", "Invalid username/password");
        %><jsp:forward page="transfer1.jsp" /><%
    } else if(accountNo == targetAccount) {
        request.setAttribute("balance", "Cannot transfer to the same account");
        %><jsp:forward page="transfer1.jsp" /><%
    } else {
        Connection con = null;
        PreparedStatement psTarget = null, psSource = null, psUpdateTarget = null, psUpdateSource = null;
        ResultSet rsTarget = null, rsSource = null;
        try {
            con = GetCon.getCon();

            // Check if target account exists
            psTarget = con.prepareStatement("SELECT amount FROM NEW_ACCOUNT WHERE accountno=?");
            psTarget.setInt(1, targetAccount);
            rsTarget = psTarget.executeQuery();

            if(!rsTarget.next()) {
                request.setAttribute("balance", "Target account does not exist: " + targetAccount);
                %><jsp:forward page="transfer1.jsp" /><%
            } else {
                int targetBalance = rsTarget.getInt("amount");

                // Check source account balance
                psSource = con.prepareStatement("SELECT amount FROM NEW_ACCOUNT WHERE accountno=?");
                psSource.setInt(1, accountNo);
                rsSource = psSource.executeQuery();

                if(rsSource.next()) {
                    int sourceBalance = rsSource.getInt("amount");

                    if(sourceBalance < amount) {
                        request.setAttribute("balance", "Insufficient funds");
                        %><jsp:forward page="transfer1.jsp" /><%
                    } else {
                        // Perform transfer
                        psUpdateTarget = con.prepareStatement("UPDATE NEW_ACCOUNT SET amount=? WHERE accountno=?");
                        psUpdateTarget.setInt(1, targetBalance + amount);
                        psUpdateTarget.setInt(2, targetAccount);
                        psUpdateTarget.executeUpdate();

                        psUpdateSource = con.prepareStatement("UPDATE NEW_ACCOUNT SET amount=? WHERE accountno=?");
                        psUpdateSource.setInt(1, sourceBalance - amount);
                        psUpdateSource.setInt(2, accountNo);
                        psUpdateSource.executeUpdate();

                        request.setAttribute("targetAccount", targetBalance + amount);
                        request.setAttribute("sourceAccount", sourceBalance - amount);

                        %><jsp:forward page="tbalance.jsp" /><%
                    }
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            try { if(rsTarget != null) rsTarget.close(); } catch(Exception e) {}
            try { if(rsSource != null) rsSource.close(); } catch(Exception e) {}
            try { if(psTarget != null) psTarget.close(); } catch(Exception e) {}
            try { if(psSource != null) psSource.close(); } catch(Exception e) {}
            try { if(psUpdateTarget != null) psUpdateTarget.close(); } catch(Exception e) {}
            try { if(psUpdateSource != null) psUpdateSource.close(); } catch(Exception e) {}
            try { if(con != null) con.close(); } catch(Exception e) {}
        }
    }
} else {
    // If the form is not submitted
    request.setAttribute("balance", "Please fill all fields");
    %><jsp:forward page="transfer1.jsp" /><%
}
%>
