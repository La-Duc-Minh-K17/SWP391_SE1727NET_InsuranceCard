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
import model.UserRelative;

/**
 *
 * @author Admin
 */
public class UserRelativeDAO {

    DBConnection dbc = new DBConnection();

    public int insertUserRelative(UserRelative userR) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "insert into user_relatives (full_name , gender , phone , email, user_id) values( ? , ? , ? , ?, ? )";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, userR.getFullName());
            ps.setInt(2, userR.getGender());
            ps.setString(3, userR.getPhone());
            ps.setString(4, userR.getEmail());
            ps.setInt(5, userR.getUserId());
            int affectedRow = ps.executeUpdate();
            if (affectedRow == 1) {
                try ( // Retrieve the generated keys
                         ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedId = generatedKeys.getInt(1);
                        return generatedId;
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return 0;
    }

    public int getUserRId(UserRelative userR) {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select * from user_relatives where full_name = ? and gender = ? and  phone = ? and email = ?  ";

        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, userR.getFullName());
            ps.setInt(2, userR.getGender());
            ps.setString(3, userR.getPhone());
            ps.setString(4, userR.getEmail());
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("relative_id");
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
        return -1;
    }
}
