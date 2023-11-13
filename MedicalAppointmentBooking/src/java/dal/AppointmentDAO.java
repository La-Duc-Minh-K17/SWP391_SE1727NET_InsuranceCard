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
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Appointment;
import model.Doctor;
import model.Patient;
import utils.TimeUtil;

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
        String sql = "select * from appointments WHERE 1=1 ORDER BY appointment_date desc , appointment_time desc   ";
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
                + "`created_time`,\n"
                + "`doctor_id`,\n"
                + "`patient_id`)\n"
                + "VALUES\n"
                + "(? ,?,?,?,?,?, ?);";
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
            ps.setTimestamp(5, appt.getCreatedTime());
            if (appt.getDoctor() == null) {
                ps.setNull(6, java.sql.Types.NULL);
            } else {
                ps.setInt(6, appt.getDoctor().getDoctorId());
            }
            ps.setInt(7, appt.getPatient().getPatientId());
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
                String rescheduleReason = rs.getString("reschedule_reason");
                String rejectReason = rs.getString("reject_reason");
                Timestamp createdTime = rs.getTimestamp("created_time");
                Timestamp updatedTime = rs.getTimestamp("updated_time");
                Patient patient = pDAO.getPatientById(patientId);
                appt = new Appointment(id, note, date, time, diagnosis, status, doctor, patient);
                appt.setRejectReason(rejectReason);
                appt.setRescheduleReason(rescheduleReason);
                appt.setCreatedTime(createdTime);
                appt.setUpdatedTime(updatedTime);
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
                + "`updated_time` = ?,\n"
                + "`other_charge` = ?,\n"
                + "`doctor_id` = ? \n"
                + "WHERE `appointment_id` = ?;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, appointment.getRescheduleReason());
            ps.setDate(2, appointment.getApptDate());
            ps.setString(3, appointment.getApptTime());
            ps.setString(4, appointment.getStatus());
            ps.setTimestamp(5, appointment.getUpdatedTime());
            ps.setDouble(6, appointment.getOtherCharge());
            ps.setInt(7, appointment.getDoctor().getDoctorId());
            ps.setInt(8, appointment.getApptId());
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

    public List<String> getAvailableTimeSlot(int patientId, int doctorId, String date) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<String> timeSlot = new ArrayList<>();
        List<String> remainingTimeSlots = new ArrayList<>();
        timeSlot.add("07:00:00");
        timeSlot.add("08:00:00");
        timeSlot.add("09:00:00");
        timeSlot.add("10:00:00");
        timeSlot.add("11:00:00");
        timeSlot.add("13:00:00");
        timeSlot.add("14:00:00");
        timeSlot.add("15:00:00");
        timeSlot.add("16:00:00");
        timeSlot.add("17:00:00");
        String sql = "SELECT appointment_time\n"
                + "FROM appointments\n"
                + "WHERE doctor_id = ? AND appointment_date = ?  and appointment_status in ('PENDING' , 'RESCHEDULING' , 'RESCHEDULED', 'CONFIRMED') ";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setDate(2, TimeUtil.dateConverter1(date));
            ps.setInt(1, doctorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (timeSlot.contains(rs.getString(1))) {
                    timeSlot.remove(rs.getString(1));
                }
            }
            List<String> bookedServiceInDay = getBookedServiceSlotTime(patientId, date);
            for (String s : bookedServiceInDay) {
                timeSlot.remove(s);
            }
            LocalDate parsedDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            LocalDate currentDate = LocalDate.now();
            if (parsedDate.isEqual(currentDate)) {
                LocalTime currentTime = LocalTime.now();
                for (String time : timeSlot) {
                    LocalTime slotTime = LocalTime.parse(time);
                    System.out.println(currentTime.isBefore(slotTime));
                    if (currentTime.isBefore(slotTime)) {
                        remainingTimeSlots.add(time);
                    }
                }
                return remainingTimeSlots;
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
        return timeSlot;
    }

    public List<String> getBookedServiceSlotTime(int patientId, String date) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<String> resultList = new ArrayList<>();
        String sql = "Select reservation_time from reservations where patient_id = ? and reservation_date = ? and reservation_status not in  ('CANCELLED')";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patientId);
            ps.setDate(2, TimeUtil.dateConverter1(date));
            rs = ps.executeQuery();
            while (rs.next()) {
                resultList.add(rs.getString("reservation_time"));
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
        return resultList;
    }

    private final int MAX_LIMIT_TIME_PER_MONTH = 2;

    public boolean checkLimitedTime(Appointment appt, String status1, String status2) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS appointment_count\n"
                + "FROM appointments\n"
                + "WHERE patient_id = ? AND (appointment_status = ? OR appointment_status = ? ) AND MONTH(updated_time) = MONTH(CURDATE()) ;";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, appt.getPatient().getPatientId());
            ps.setString(2, status1);
            ps.setString(3, status2);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) >= MAX_LIMIT_TIME_PER_MONTH) {
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

    public void updateTime(Appointment appt) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE `mabs`.`appointments`\n"
                + "SET\n"
                + "`updated_time` = ?\n"
                + "WHERE `appointment_id` = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setTimestamp(1, appt.getUpdatedTime());
            ps.setInt(2, appt.getApptId());
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
