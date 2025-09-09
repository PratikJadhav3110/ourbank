package com.ourbank.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class verifyLogin1 {

    public static boolean checkLogin(int accountno, String username, String password) {
        boolean status = false;
        Connection con = GetCon.getCon();
        try {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM NEW_ACCOUNT WHERE ACCOUNTNO = ? AND USERNAME = ? AND PASSWORD = ?"
            );
            ps.setInt(1, accountno);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            status = rs.next(); // true if record found
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
