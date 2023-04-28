package com;

import java.sql.*;

public class DBConn {
    public static ResultSet makeQuery(String sql) {
        String url = "jdbc:postgresql://localhost:5432/DS";
        String username = "postgres";
        String password = "admin";
        
        Statement stmt;
        Connection conn = null;
        ResultSet rs = null;
        
        try {
          Class.forName("org.postgresql.Driver");
          conn = DriverManager.getConnection(url, username, password);
          stmt = conn.createStatement();
          rs = stmt.executeQuery(sql);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        } finally {
          if (conn != null) {
              try {
                conn.close();
              } catch (SQLException e) {
                  System.out.println(e.getMessage());
              }
          }
        }

        return rs;
    };
}
