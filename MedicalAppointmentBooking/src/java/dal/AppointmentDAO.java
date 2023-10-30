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

/**
 *
 * @author Admin
 */
public class AppointmentDAO {

    DBConnection dbc = new DBConnection();
    private final DoctorDAO dDAO = new DoctorDAO();
    private final PatientDAO pDAO = new PatientDAO();

    public List<Appointment> getAllAppointment() {
        List<Appointment> list = new ArrayList<>();
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "select * from appointments ORDER BY appointment_date ASC , appointment_time ASC";
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
    public List<Appointment> getFilteredPatientAppointment(int userId, String status) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppoint = new ArrayList<>();
        String sql = "select * from appointments appt\n"
                + "inner join patients p on p.patient_id = appt.patient_id \n"
                + "inner join user_account ua on ua.user_id = p.user_id\n"
                + "where ua.user_id = ? "
                + "and appt.appointment_status = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("appointment_id");
                Appointment appt = getAppointmentById(id);
                listAppoint.add(appt);
            }
            return listAppoint;
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

    public List<Appointment> getWaitingAppointment() {
        List<Appointment> list = new ArrayList<>();
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "select * from appointments where appointment_status = 'PENDING' or appointment_status ='RESCHEDULED' ORDER BY appointment_date ASC , appointment_time ASC";
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
            if (appt.getApptDate() == null) {
                ps.setNull(2, java.sql.Types.NULL);
            } else {
                ps.setDate(2, appt.getApptDate());
            }
            if (appt.getApptTime() == null || appt.getApptTime().isEmpty()) {
                ps.setNull(3, java.sql.Types.NULL);
            } else {
                ps.setString(3, appt.getApptTime());
            }
            ps.setString(4, appt.getStatus());
            if (appt.getDoctor() == null) {
                ps.setNull(5, java.sql.Types.NULL);
            } else {
                ps.setInt(5, appt.getDoctor().getDoctorId());
            }
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
            ps.setInt(1, apptId);
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

    public void updateStatus(Appointment appointment) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`appointment_status` = ?\n"
                + "WHERE `appointment_id` = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, appointment.getStatus());
            ps.setInt(2, appointment.getApptId());
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

    public List<Appointment> searchAppointmentByPatientName(String text) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppt = new ArrayList<>();
        String sql = "select appt.* from appointments appt \n"
                + "INNER JOIN patients p on p.patient_id = appt.patient_id\n"
                + "INNER JOIN user_account u on u.user_id = p.user_id\n"
                + "where u.full_name like ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
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
                listAppt.add(appt);
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
        return listAppt;
    }

    public List<Appointment> getListByPage(List<Appointment> list, int start, int end) {
        ArrayList<Appointment> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Appointment> getFilteredAppointmentList(String text) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppt = new ArrayList<>();
        String sql = "select appt.* from appointments appt \n"
                + "INNER JOIN patients p on p.patient_id = appt.patient_id\n"
                + "INNER JOIN user_account u on u.user_id = p.user_id\n"
                + "where appt.appointment_status = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, text);
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
                listAppt.add(appt);
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
        return listAppt;
    }

    public List<Appointment> getAppointmentByDoctorId(int docId) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppoint = new ArrayList<>();
        String sql = "select * from appointments where doctor_id = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, docId);
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
                listAppoint.add(appt);
            }
            return listAppoint;
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

    public void rescheduleAppointment(Appointment appointment) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`appointment_date` = ?,\n"
                + "`appointment_time` = ?,\n"
                + "`doctor_id` =?\n"
                + "WHERE `appointment_id` = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setDate(1, appointment.getApptDate());
            ps.setString(2, appointment.getApptTime());
            ps.setInt(3, appointment.getDoctor().getDoctorId());
            ps.setInt(4, appointment.getApptId());
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

    public void rescheduleAppointmentForPatient(Appointment appointment) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`reschedule_reason` = ?,\n"
                + "`appointment_date` = ?,\n"
                + "`appointment_time` = ?,\n"
                + "`appointment_status` = ?,\n"
                + "`doctor_id` = ? \n"
                + "WHERE `appointment_id` = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, appointment.getRescheduleReason());
            ps.setDate(2, appointment.getApptDate());
            ps.setString(3, appointment.getApptTime());
            ps.setString(4, appointment.getStatus());
            ps.setInt(5, appointment.getDoctor().getDoctorId());
            ps.setInt(6, appointment.getApptId());
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

    public void deleteRecord(int apptId) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "delete from appointments where appointment_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, apptId);
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

    public List<Appointment> getPatientAppointmentByUserId(int userId) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppoint = new ArrayList<>();
        String sql = "select * from appointments appt\n"
                + "inner join patients p on p.patient_id = appt.patient_id \n"
                + "inner join user_account ua on ua.user_id = p.user_id\n"
                + "where ua.user_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("appointment_id");
                Appointment appt = getAppointmentById(id);
                listAppoint.add(appt);
            }
            return listAppoint;
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

    public List<Appointment> searchAppointmentByPatientNameAndIdDoc(int docId, String namePatient) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<Appointment> listAppt = new ArrayList<>();
        String sql = "select appt.* from mabs.appointments appt \n"
                + "                INNER JOIN mabs.patients p on p.patient_id = appt.patient_id\n"
                + "                INNER JOIN mabs.user_account u on u.user_id = p.user_id\n"
                + "                where u.full_name like ? and appt.doctor_id = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);       
            ps.setString(1, "%" + namePatient + "%");
            ps.setInt(2, docId);
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
                listAppt.add(appt);
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
        return listAppt;
}
}