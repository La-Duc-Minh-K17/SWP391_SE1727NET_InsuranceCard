/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import jakarta.servlet.http.Part;
import java.io.InputStream;
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

import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class PatientDAO {

    DBConnection dbc = new DBConnection();
    private final UserDAO uDAO = new UserDAO();

    public List<Patient> getAllPatient() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Patient> PatientList = new ArrayList<>();
        String sql = "select * from patients p inner join user_account u where p.user_id=u.user_id order by patient_id;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int patientId = rs.getInt("patient_id");
                int userId = rs.getInt("user_id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                String address = rs.getString("address");
                Date dob = rs.getDate("dob");
                int gender = rs.getInt("gender");
                int status = rs.getInt("status");
                Patient p = new Patient(patientId, userId, username, email, fullName, gender, phone, image, dob, address, status);

                PatientList.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PatientList;
    }

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

    public void updatePatient(int patientId, int userId, String username, String email, String fullName, int gender, String phone, Part image, String dob, String address, int status) {
        PreparedStatement ps = null;
        InputStream fileImage = ImageProcessing.imageStream(image);
        String sql = "UPDATE mabs.patients p INNER JOIN user_account u ON p.user_id = u.user_id SET "
                + "u.full_name = ?, "
                + "u.gender = ?, "
                + "u.phone = ?, "
                + "u.dob = ?, "
                + "u.address = ?, "
                + "u.status = ?";
        if (fileImage != null) {
            sql += ", u.image = ?";
        }
        sql += " WHERE p.patient_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setInt(2, gender);
            ps.setString(3, phone);
            ps.setDate(4, TimeUtil.dateConverter1(dob));
            ps.setString(5, address);
            ps.setInt(6, status);

            int parameterIndex = 7;

            if (fileImage != null) {
                ps.setBlob(parameterIndex++, fileImage);
            }
            ps.setInt(parameterIndex, patientId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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

    public void updatePatientStatus(int patientId, int newStatus) {
        PreparedStatement ps = null;
        String sql = "UPDATE mabs.patients p inner join mabs.user_account u SET u.status = ? WHERE p.patient_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(2, patientId);
            ps.setInt(1, newStatus);
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

    public List<Patient> getPatientByDoctorId(int docId) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Patient> listPatient = new ArrayList<>();
        String sql = "SELECT DISTINCT P.patient_id, UA.*\n"
                + "FROM mabs.user_account UA\n"
                + "JOIN mabs.patients P ON UA.user_id = P.user_id\n"
                + "JOIN mabs.appointments A ON P.patient_id = A.patient_id\n"
                + "WHERE A.doctor_id = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, docId);
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

                    ex.printStackTrace();
                }
            }
        }

        return null;

    }

    public List<Patient> searchPatientsByName(String keyword) {
        List<Patient> resultList = new ArrayList<>();
        try ( Connection conn = dbc.getConnection()) {
            String sql = "SELECT * FROM patients p inner join user_account u WHERE p.user_id=u.user_id and u.full_name LIKE ?";
            try ( PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, "%" + keyword + "%");
                try ( ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        int patientId = rs.getInt("patient_id");
                        int userId = rs.getInt("user_id");
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        String fullName = rs.getString("full_name");
                        String phone = rs.getString("phone");
                        String image = ImageProcessing.imageString(rs.getBlob("image"));
                        String address = rs.getString("address");
                        Date dob = rs.getDate("dob");
                        int gender = rs.getInt("gender");
                        int status = rs.getInt("status");
                        Patient patient = new Patient(patientId, userId, username, email, fullName, gender, phone, image, dob, address, status);
                        resultList.add(patient);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    public List<Patient> getPatientByDoctorIdSortAZ(int docId) {
PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Patient> listPatient = new ArrayList<>();
        String sql = "SELECT DISTINCT P.patient_id, UA.*\n"
                + "FROM mabs.user_account UA\n"
                + "JOIN mabs.patients P ON UA.user_id = P.user_id\n"
                + "JOIN mabs.appointments A ON P.patient_id = A.patient_id\n"
                + "WHERE A.doctor_id = ?"
                + "ORDER BY UA.full_name;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, docId);
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

                    ex.printStackTrace();
                }
            }
        }

        return null;
    }

}
