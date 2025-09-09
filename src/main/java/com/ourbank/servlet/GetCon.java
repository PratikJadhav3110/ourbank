package com.ourbank.servlet;

import java.sql.*;

public class GetCon {

    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    DBIntializer.CON_STRING,  // jdbc:mysql://localhost:3306/yourDB
                    DBIntializer.USERNAME,   // root
                    DBIntializer.PASSWORD    // your password
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static int getPrimaryKey() {
        int nextId = 1;
        try (Connection con = getCon();
             PreparedStatement ps = con.prepareStatement("SELECT MAX(accountno) FROM NEW_ACCOUNT");
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                nextId = rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nextId;
    }
}
