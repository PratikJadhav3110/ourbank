<%@ page import="java.sql.*" %>
<%@ page import="com.ourbank.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Initializer</title>
</head>
<body>
<%
Connection con = null;
Statement stmt = null;
try {
    con = GetCon.getCon();  // Your custom connection class
    stmt = con.createStatement();

    // Create table if not exists
    String sql = "CREATE TABLE IF NOT EXISTS NEW_ACCOUNT ("
               + "accountno INT PRIMARY KEY AUTO_INCREMENT, "
               + "username VARCHAR(50) NOT NULL, "
               + "password VARCHAR(50) NOT NULL, "
               + "repassword VARCHAR(50) NOT NULL, "
               + "amount DOUBLE NOT NULL, "
               + "address VARCHAR(200), "
               + "phone BIGINT)";
    stmt.executeUpdate(sql);

    out.println("<h3>✅ Database initialized successfully! Table 'NEW_ACCOUNT' is ready.</h3>");

} catch (Exception e) {
    out.println("<h3>❌ Error initializing database: " + e.getMessage() + "</h3>");
    e.printStackTrace();
} finally {
    try { if(stmt != null) stmt.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
}
%>
</body>
</html>
