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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;
import model.UserAccount;
import utils.ImageProcessing;

/**
 *
 * @author Admin
 */
public class PatientDAO {

    DBConnection dbc = new DBConnection();
    private UserDAO uDAO = new UserDAO();

    public int insertPatient(Patient patient) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO mabs.patients( user_id ) VALUES ( ? )";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, patient.getUserId());
            int affectedRow = ps.executeUpdate();
            if (affectedRow == 1) {
                try (
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

    public Patient getPatientById(int id) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "select * from patients where patient_id = ? ";
        ResultSet rs = null;

        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                int patientId = rs.getInt("patient_id");
                int userId = rs.getInt("user_id");
                UserAccount user = uDAO.getAccountById(userId);
                Patient p = new Patient(patientId,
                        user.getUserId(),
                        user.getUserName(),
                        user.getEmail(),
                        user.getFullName(),
                        user.getGender(),
                        user.getPhone(),
                        user.getImage(),
                        user.getDob(),
                        user.getAddress(),
                        user.getStatus());
                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getPatientId(Patient patient) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "select * from mabs.patients where user_id = ? ";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patient.getUserId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("patient_id");
                return id;
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

    public List<Patient> getAllByByDoctorId(int doctorId) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Patient> listPatient = new ArrayList<>();
        String sql = "SELECT P.patient_id , UA.*\n"
                + "FROM mabs.user_account UA\n"
                + "JOIN mabs.patients P ON UA.user_id = P.user_id\n"
                + "JOIN mabs.appointments A ON P.patient_id = A.patient_id\n"
                + "WHERE A.doctor_id = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int patientId = rs.getInt("patient_id");
                String username = rs.getString("username");
                int userId = rs.getInt("user_id");
                String email = rs.getString("email");
                String fullName = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                Date dob = rs.getDate("dob");
                int status = rs.getInt("status");
                String address = rs.getString("address");
                Patient p = new Patient(patientId, userId, username, email, fullName, gender, phone, image, dob, address, status);
                listPatient.add(p);
            }
            return listPatient;

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
}
