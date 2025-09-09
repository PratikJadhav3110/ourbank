<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
public class GetCon {
    private static Connection con = null;

    public static Connection getCon() throws Exception {
        if (con == null || con.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL 8.x Driver
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/ourbank",  // DB name = ourbank
                        "root",                               // DB username
                        "MySQL@11"                                // DB password
                );
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("Database connection failed: " + e.getMessage());
            }
        }
        return con;
    }
}
%>
