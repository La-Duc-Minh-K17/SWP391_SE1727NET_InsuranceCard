/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.UserAccount;

/**
 *
 * @author Admin
 */
public class UserDAO {

    PreparedStatement ps = null;
    ResultSet result = null;
    DBConnection dbc = new DBConnection();
    Connection connection = null;

    public UserAccount getAccountByEmail(String email) {
        String sql = "select * from useraccount where email = ? ";
        UserAccount useraccount = new UserAccount();
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeQuery();
            while(result.next()) {
                
            }
            return null;
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public void updateRecoveryToken(String token) {
    }
    
    public Timestamp getRecoveryToken() {
        
    }
}
