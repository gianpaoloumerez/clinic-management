package servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {

    public static void main(String[] args) {
        ConnectDb();
    }

    public static Connection ConnectDb() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinic_mngmt", "root", "P@ssw0rd");
             return con;  
        } catch (Exception ex) {
            
        }
        return con;
    }
}
