<%@ page import="java.sql.*" %>
<%!
    public ResultSet makeQuery(String sql) {
        String url = "jdbc:postgresql://localhost:5432/DS";
        String username = "postgres";
        String password = "admin";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
          Class.forName("org.postgresql.Driver");
          conn = DriverManager.getConnection(url, username, password);
          stmt = conn.createStatement();
          rs = stmt.executeQuery(sql);
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
          if (conn != null) {
              try {
                conn.close();
              } catch (SQLException e) {
                    e.printStackTrace();
              }
          }
        }

        return rs;
    };
%>

