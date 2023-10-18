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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;
import model.UserAccount;
import model.UserRelative;

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
            if(rs.next()) {
                int patientId = rs.getInt("patient_id");
                int userId = rs.getInt("user_id");
                int relativeId = rs.getInt("relative_id");
               
                UserAccount user = null;
                UserRelative userR = null;
                if(userId != 0) {
                    user = uDAO.getAccountById(userId);
                }
                if(relativeId != 0) {
                    userR = uRDAO.getUserRelativeById(relativeId);
                }
                Patient p = new Patient(patientId , user , userR);
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

}
