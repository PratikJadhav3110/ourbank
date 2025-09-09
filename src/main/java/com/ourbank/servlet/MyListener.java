package com.ourbank.servlet;

import javax.servlet.*;
import java.sql.*;

public class MyListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        try {
            con = GetCon.getCon();

            // Create NEW_ACCOUNT table if not exists
            String createTableQuery = "CREATE TABLE IF NOT EXISTS NEW_ACCOUNT (" +
                    "ACCOUNTNO INT PRIMARY KEY, " +
                    "USERNAME VARCHAR(255) NOT NULL, " +
                    "PASSWORD VARCHAR(255) NOT NULL, " +
                    "REPASSWORD VARCHAR(255), " +
                    "AMOUNT DECIMAL(15,2), " +
                    "ADDRESS VARCHAR(255), " +
                    "PHONE BIGINT" +
                    ")";
            PreparedStatement ps = con.prepareStatement(createTableQuery);
            ps.executeUpdate();
            ps.close();

            System.out.println("✅ Table NEW_ACCOUNT checked/created successfully.");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Error while initializing database tables.");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Project undeployed. Resources cleaned up.");
    }
}


