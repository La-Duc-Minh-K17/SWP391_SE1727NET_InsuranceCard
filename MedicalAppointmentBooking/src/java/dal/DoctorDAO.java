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
import java.util.List;
import model.Doctor;
import utils.ImageProcessing;

/**
 *
 * @author PC
 */
public class DoctorDAO {

    DBConnection dbc = new DBConnection();

    public List<Doctor> getAllDoctor() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();
        String sql = "select * from doctors d inner join user_account u on d.user_id = u.user_id";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("position");
                String speciality = rs.getString("speciality");
                String description = rs.getString("description");
                Doctor d = new Doctor(doctorId , position ,  speciality , description ,username ,email , name , gender ,phone , image , status);
                doctorList.add(d);
            }
            return doctorList;
        } catch (SQLException e) {
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return doctorList;
    }   
}
