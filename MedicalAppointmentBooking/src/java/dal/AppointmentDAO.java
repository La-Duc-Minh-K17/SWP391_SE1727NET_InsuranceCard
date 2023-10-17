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
import model.Appointment;
import model.Doctor;
import model.Patient;
import model.UserAccount;

/**
 *
 * @author Admin
 */
public class AppointmentDAO {

    DBConnection dbc = new DBConnection();
    private final DoctorDAO dDAO = new DoctorDAO();
    private final PatientDAO pDAO = new PatientDAO();

    public List<Appointment> getWatingAppointment() {
        List<Appointment> list = new ArrayList<>();
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "select * from appointments appt where appt.appointment_status = 'PENDING' ORDER BY appointment_date ASC , appointment_time ASC";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("appointment_id");
                String note = rs.getString("appointment_note");
                Date date = rs.getDate("appointment_date");
                String time = rs.getString("appointment_time");
                String diagnosis = rs.getString("diagnosis");
                String status = rs.getString("appointment_status");
                int doctorId = rs.getInt("doctor_id");
                Doctor doctor = dDAO.getDoctorById(doctorId);
                int patientId = rs.getInt("patient_id");
                Patient patient = pDAO.getPatientById(patientId);
                Appointment appt = new Appointment(id, note, date, time, diagnosis, status, doctor, patient);
                list.add(appt);
            }
            return list;
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
        return list;
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
                + "`doctor_id`,\n"
                + "`patient_id`)\n"
                + "VALUES\n"
                + "(? ,?,?,?,?,?);";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, appt.getApptNote());
            ps.setDate(2, appt.getApptDate());
            ps.setString(3, appt.getApptTime());
            ps.setString(4, appt.getStatus());
            ps.setInt(5, appt.getDoctor().getDoctorId());
            ps.setInt(6, appt.getPatient().getPatientId());
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

    public Appointment getAppointmentById(int apptId) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        Appointment appt = null;
        String sql = "select * from appointments where appointment_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("appointment_id");
                String note = rs.getString("appointment_note");
                Date date = rs.getDate("appointment_date");
                String time = rs.getString("appointment_time");
                String diagnosis = rs.getString("diagnosis");
                String status = rs.getString("appointment_status");
                int doctorId = rs.getInt("doctor_id");
                Doctor doctor = dDAO.getDoctorById(doctorId);
                int patientId = rs.getInt("patient_id");
                Patient patient = pDAO.getPatientById(patientId);
                appt = new Appointment(id, note, date, time, diagnosis, status, doctor, patient);
            }
            return appt;
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

    public void assignAppointment(int apptId, UserAccount account) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`appointment_status` = 'CONFIRMED',\n"
                + "`staff_id` = ? WHERE `appointment_id` =?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, account.getUserId());
            ps.setInt(2, apptId);
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
    private final int MAX_APPOINTMENT = 3;

    public boolean checkAvailability(Appointment appt) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS appointment_count\n"
                + "FROM appointments\n"
                + "WHERE doctor_id = ? AND appointment_date = ? AND appointment_time = ? ";
        try {
            connection = dbc.getConnection();
            ps.setInt(1, appt.getDoctor().getDoctorId());
            ps.setDate(2, appt.getApptDate());
            ps.setString(3, appt.getApptTime());
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) >= MAX_APPOINTMENT) {
                    return false;
                }
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
        return true;
    }

    public void cancelAppointment(int apptId, UserAccount account) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`appointment_status` = ?,\n"
                + "`staff_id` = ?\n"
                + "WHERE appointment_id` = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "REJECTED");
            ps.setInt(2, account.getUserId());
            ps.setInt(3, apptId);
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
