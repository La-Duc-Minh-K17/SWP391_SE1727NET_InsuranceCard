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
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.Appointment;

/**
 *
 * @author Admin
 */
public class AppointmentDAO {

    DBConnection dbc = new DBConnection();

    public List<Appointment> getWatingAppointment() {
        List<Appointment> list = new ArrayList<>();
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("appointment_id");
                String note = rs.getString("appointment_note");
                Date date = rs.getDate("appointment_date");
                Time time = rs.getTime("appointment_time");
                String diagnosis = rs.getString("diagnosis");
                String status = rs.getString("appointment_status");
                int staffId = rs.getInt("staff_id");
                int doctoId = rs.getInt ("doctor_id");
                int patientId = rs.getInt("patientId");
                
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
    }

    public void insertNewAppointment(Appointment appt) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO `mabs`.`appointments`\n"
                + "(\n"
                + "`appointment_note`,\n"
                + "`appointment_date`,\n"
                + "`appointment_time`,\n"
                + "`appointment_status`,\n"
                + "`staff_id`,\n"
                + "`doctor_id`,\n"
                + "`patient_id`)\n"
                + "VALUES\n"
                + "(? ,?,?,?,?,?,?);";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, appt.getApptNote());
            ps.setDate(2, appt.getApptDate());
            ps.setString(3, appt.getApptTime());
            ps.setString(4, appt.getStatus());
            ps.setInt(5, appt.getStaffId());
            ps.setInt(6, appt.getDoctorId());
            ps.setInt(7, appt.getPatientId());
            ps.executeUpdate();

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

    }
}
