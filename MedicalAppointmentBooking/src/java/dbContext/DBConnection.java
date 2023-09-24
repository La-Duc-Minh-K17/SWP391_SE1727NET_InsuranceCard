/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

<<<<<<< Updated upstream
public class DBConnection {

    public Connection getDBConnection() {
        Connection connection = null;

        try {
            String url = "jdbc:mysql://localhost:3306/mabs";
            String username = "root";
            String password = "123456";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            return connection;
=======
/**
 *
 * @author sonnt
 */
public class DBConnection {
    public Connection connection;
    public DBConnection()
    {
        try {
            //Change the username password and url to connect your own database
            String username = "sa";
            String password = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Blog";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
>>>>>>> Stashed changes
        } catch (ClassNotFoundException | SQLException ex) {
            return null;
        }
    }
<<<<<<< Updated upstream
    
}
=======
    public static void main(String[] args) {
        DBConnection a = new DBConnection();
        System.out.println(a.connection);
    }
    
}
>>>>>>> Stashed changes
