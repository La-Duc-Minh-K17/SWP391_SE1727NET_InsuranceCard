/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Role;
import model.UserAccount;
import utils.ImageProcessing;

/**
 *
 * @author Admin
 */
public class RoleDAO {
      DBConnection dbc = new DBConnection();
       public ArrayList<Role> getListRole() {
        PreparedStatement stm = null;
        Connection connection = null;
        ResultSet rs = null;
        ArrayList<Role> list = new ArrayList<>();
        String sql = "SELECT r.* FROM user_role r ";
        try {
            connection = dbc.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("role_id"),rs.getString("role_name"));
                list.add(r);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
}
