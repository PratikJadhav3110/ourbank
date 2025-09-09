package com.ourbank.servlet;

public interface DBIntializer {
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String CON_STRING = "jdbc:mysql://localhost:3306/ourbank?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String USERNAME = "root";
    String PASSWORD = "MySQL@11";
}
// String CON_STRING = "jdbc:mysql://localhost:3306/ourbank";