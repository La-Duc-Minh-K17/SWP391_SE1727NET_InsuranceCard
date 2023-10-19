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
        String sql = "select * from patients p inner join user_account u where p.user_id=u.user_id;";
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
        String sql = "UPDATE mabs.patients p\n"
                + "SET\n"
                + "  s.fullName = ?,\n"
                + "  s.email = ?,\n"
                + "  s.gender = ?,\n"
                + "  s.phone = ?,\n"
                + "  s.dob = ?\n"
                + "  s.address = ?\n"
                + "  s.status = ?\n";
        if (fileImage != null) {
            sql = sql + " , p.image = ? \n";
        }
        sql = sql + "WHERE p.patient_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();

            ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setInt(3, gender);
            ps.setString(4, phone);
            ps.setDate(5, TimeUtil.dateConverter(dob));
            ps.setString(6, address);
            ps.setInt(7, status);

            if (fileImage != null) {
                ps.setBlob(8, fileImage);
                ps.setInt(9, patientId);
            } else {
                ps.setInt(8, patientId);
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

    public void updatePatientStatus(int patientId, int newStatus) {
        PreparedStatement ps = null;
        String sql = "UPDATE mabs.patients SET status = ? WHERE patient_id = ?;";
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

    public List<Patient> searchPatientsByName(String keyword) {
        List<Patient> resultList = new ArrayList<>();
        try ( Connection conn = dbc.getConnection()) {
            String sql = "SELECT * FROM patients p WHERE p.full_name LIKE ?";
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
//   public static void main(String[] args) throws SQLException {
//        PatientDAO dao = new PatientDAO();
//        System.out.println(dao.getAllPatient());
//    }
}
