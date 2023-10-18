/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.org.apache.xerces.internal.impl.xs.SchemaGrammar;
import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;
import model.UserAccount;
import model.UserRelative;
import java.util.ArrayList;
import utils.ImageProcessing;

/**
 *
 * @author Admin
 */
public class PatientDAO {

    DBConnection dbc = new DBConnection();
    private UserDAO uDAO = new UserDAO();
    private UserRelativeDAO uRDAO = new UserRelativeDAO();

    public int insertPatient(Patient patient) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO mabs.patients "
                + "( user_id , relative_id) VALUES ( ? , ? )";
        try {
            connection = dbc.getConnection();

            ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            if (patient.getUserAccount() == null) {
                ps.setNull(1, java.sql.Types.INTEGER);
            } else {
                ps.setInt(1, patient.getUserAccount().getUserId());
            }
            if (patient.getUserRelative() == null) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, patient.getUserRelative().getRelativeId());
            }
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
                int relativeId = rs.getInt("relative_id");

                UserAccount user = null;
                UserRelative userR = null;
                if (userId != 0) {
                    user = uDAO.getAccountById(userId);
                }
                if (relativeId != 0) {
                    userR = uRDAO.getUserRelativeById(relativeId);
                }
                Patient p = new Patient(patientId, user, userR);
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
        String sql = "";
        if (patient.getUserAccount() != null) {
            sql = "select * from mabs.patients where user_id = ? ";
        } else {
            sql = "select * from mabs.patients where relative_id = ?";
        }
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            if (patient.getUserAccount() != null) {
                ps.setInt(1, patient.getUserAccount().getUserId());
            } else {
                ps.setInt(1, patient.getUserRelative().getRelativeId());
            }
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

    public List<Patient> getPatientByDoctorId(int doctorId) {
        List<Patient> patientList = new ArrayList<>();
        String sql = "SELECT UA.full_name, UA.gender, UA.phone, UA.image, UA.dob, UA.address, A.appointment_date\n"
                + "FROM mabs.user_account UA\n"
                + "JOIN mabs.patients P ON UA.user_id = P.user_id\n"
                + "JOIN mabs.appointments A ON P.patient_id = A.patient_id\n"
                + "WHERE A.doctor_id = ?;";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            result = ps.executeQuery();
            while (result.next()) {
                String fullName = result.getString("full_name");
                int gender = result.getInt("gender");
                String phone = result.getString("phone");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
                String dob = result.getString("dob");
                String addess = result.getString("address");
                String dateAppoint = result.getString("appointment_date");
                int id = result.getInt("patient_id");
                Patient patient = new Patient(fullName, gender, phone, image, dob, addess, dateAppoint, id);
                patientList.add(patient);
            }
            return patientList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
