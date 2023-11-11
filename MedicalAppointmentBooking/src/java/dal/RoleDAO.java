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
import java.util.ArrayList;
import model.Role;

/**
 *
 * @author Admin
 */
public class RoleDAO {

    private DBConnection dbc = new DBConnection();

    public Role getRoleById(int id) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "select * from user_role where role_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int roleId = rs.getInt(1);
                String roleName = rs.getString(2);
                String roleDes = rs.getString(3);
                int status = rs.getInt(4);
                int settingId = rs.getInt(5);
                Role role = new Role(roleId, roleName, roleDes, settingId, status);
                return role;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return null;
    }
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
          public ArrayList<Role> getListRoleButAdmin() {
        PreparedStatement stm = null;
        Connection connection = null;
        ResultSet rs = null;
        ArrayList<Role> list = new ArrayList<>();
        String sql = "SELECT r.* FROM user_role r where role_name <> 'ADMIN' ";
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
