/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import jakarta.servlet.http.Part;
import java.io.InputStream;
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
        String sql = "select * from doctors d \n"
                + "inner join user_account u on d.user_id = u.user_id \n"
                + "inner join speciality s on s.speciality_id = d.speciality_id";
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
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Double serviceFee = rs.getDouble("service_fee");
                Doctor d = new Doctor(doctorId, speciality, position, description, serviceFee, username, email, name, gender, phone, image, status);
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

    public List<Doctor> getDoctorByName(String text) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();
        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where u.full_name LIKE ?";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
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
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
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

    public Doctor getDoctorById(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Doctor doctor = null;
        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where d.doctor_id = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                int fee = rs.getInt("service_fee");
                doctor = new Doctor(doctorId, speciality, position, description, username, email, fullName, gender, phone, image, status);
                doctor.setServiceFee(fee);
            }
            return doctor;
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
        return doctor;
    }

    public List<Doctor> getDoctorBySpeciality(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();

        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where s.speciality_id = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
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
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
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

    public List<Doctor> getDoctorBySpeciality(String spe) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();

        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where s.speName = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, spe);
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
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
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

    public void updateDoctor(int doctorId, String name, int gender, String phone, int speciality_id, String position, String description, int status, Part image) {
        PreparedStatement ps = null;
        InputStream fileImage = ImageProcessing.imageStream(image);
        String sql = "UPDATE mabs.doctors d\n"
                + "INNER JOIN mabs.user_account u ON d.user_id = u.user_id\n"
                + "SET\n"
                + "  u.full_name = ?,\n"
                + "  u.gender = ?,\n"
                + "  u.phone = ?,\n"
                + "  d.speciality_id = ?,\n"
                + "  d.doctor_position = ?,\n"
                + "  d.doctor_description = ?,\n"
                + "  u.status = ? \n";
        if (fileImage != null) {
            sql = sql + " , u.image = ? \n";
        }
        sql = sql + "WHERE d.doctor_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();

            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, gender);
            ps.setString(3, phone);
            ps.setInt(4, speciality_id);
            ps.setString(5, position);
            ps.setString(6, description);
            ps.setInt(7, status);
            if (fileImage != null) {
                ps.setBlob(8, fileImage);
                ps.setInt(9, doctorId);

            } else {
                ps.setInt(8, doctorId);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
