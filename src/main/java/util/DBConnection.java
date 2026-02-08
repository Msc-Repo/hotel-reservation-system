package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() throws Exception {

        if(con == null || con.isClosed()) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_db",
                    "root",
                    ""
            );
        }

        return con;
    }
}
