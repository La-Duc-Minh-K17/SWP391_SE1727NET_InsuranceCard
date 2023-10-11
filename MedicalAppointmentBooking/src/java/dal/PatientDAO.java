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

/**
 *
 * @author Admin
 */
public class PatientDAO {

    DBConnection dbc = new DBConnection();

    public int insertPatient(Patient patient) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO mabs.patients "
                + "(`dob` ,address , user_id , relative_id) VALUES ( ? , ? , ? , ? )";
        try {
            connection = dbc.getConnection();

            ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setDate(1, patient.getDob());
            ps.setString(2, patient.getAddress());
            if (patient.getUserAccountId() == -1) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, patient.getUserAccountId());
            }
            if (patient.getUserRelativeId() == -1) {
                ps.setNull(4, java.sql.Types.INTEGER);
            } else {
                ps.setInt(4, patient.getUserRelativeId());
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

    public int getPatientId(Patient patient) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "";
        if (patient.getUserAccountId() != -1) {
            sql = "select * from mabs.patients where user_id = ?";
        } else {
            sql = "select * from mabs.patients where relative_id = ?";
        }

        try {

            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            if (patient.getUserAccountId() != -1) {
                ps.setInt(1, patient.getUserAccountId());
            } else {
                ps.setInt(1, patient.getUserRelativeId());
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
