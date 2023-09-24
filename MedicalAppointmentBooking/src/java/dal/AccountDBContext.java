/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */

public class AccountDBContext  {
    DBContext db = new DBContext();
    public void insertAccount(Account account) {
        Connection connection = db.getConnection();
        try {
            String query = "INSERT INTO Account (name, email, password,gender,username,mobile) VALUES (?, ?, ?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, account.getName());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getPassword());
            statement.setBoolean(4, account.isGender());
            
            statement.setString(5,account.getUsername());
            statement.setString(6, account.getMobile());
            statement.executeUpdate();
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    public Account getAccountBy(String username, String password) {
        Connection connection = db.getConnection();
        try {
            String sql = "SELECT name,email,gender,mobile FROM Account\n"
                    + "WHERE username = ?\n"
                    + "AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setName(rs.getString("name"));
                account.setEmail(rs.getString("email"));
                account.setGender(rs.getBoolean("gender"));
                account.setMobile(rs.getString("mobile"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
