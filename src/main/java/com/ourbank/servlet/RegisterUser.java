package com.ourbank.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterUser {
    static int status = 0;

    public static int register(String username, String password, String repassword, double amount, String address, double phone) {
        try (Connection con = GetCon.getCon();
             PreparedStatement ps = con.prepareStatement("INSERT INTO NEW_ACCOUNT (ACCOUNTNO, USERNAME, PASSWORD, REPASSWORD, AMOUNT, ADDRESS, PHONE) " +
                     "VALUES (?,?,?,?,?,?,?)"))
        {
            int nextValue = GetCon.getPrimaryKey();
            ps.setInt(1, nextValue);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, repassword);
            ps.setDouble(5, amount);
            ps.setString(6, address);
            ps.setDouble(7, phone);

            status = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
