/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Doctor;

/**
 *
 * @author PC
 */
public class DoctorDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBConnection dbc = new DBConnection();
    Connection connection = null;
    
public List<Doctor> getAllDoctor() throws SQLException, IOException {
        List<Doctor> list = new ArrayList<>();
        String sql = "select * from doctor ";
                
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new Doctor(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getBoolean(5),rs.getString(6)));
            }
        } catch (SQLException e) {
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }
}
