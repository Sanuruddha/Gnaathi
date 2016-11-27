package bean;

import java.sql.*;

///database connection handler class which returns the connection when called the getCon() method

public class ConnectionProvider {

    private static Connection con = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gnaathi", "root", "");
        } catch (Exception e) {
        }
    }

    public static Connection getCon() {
        return con;
    }

}
