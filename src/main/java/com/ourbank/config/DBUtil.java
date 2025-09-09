package com.ourbank.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/ourbank"; // change DB name if needed
    private static final String USER = "root"; // your MySQL username
    private static final String PASSWORD = ""; // your MySQL password

    // Load MySQL driver only once (static block)
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8+
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Method to get a DB connection
    public static Connection getCon() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
