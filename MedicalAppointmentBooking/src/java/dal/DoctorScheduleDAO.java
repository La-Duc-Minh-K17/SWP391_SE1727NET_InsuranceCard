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
import model.DoctorSchedule;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class DoctorScheduleDAO {

    DBConnection dbc = new DBConnection();

    public List<DoctorSchedule> getAvailableSlot(int doctorId, String chosenDate) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        List<DoctorSchedule> returnList = new ArrayList<>();
        String sql = "SELECT dc.*\n"
                + "FROM doctor_schedule dc\n"
                + "LEFT JOIN appointments apt\n"
                + "ON dc.date = apt.appointment_date\n"
                + "AND dc.slot_time = apt.appointment_time\n"
                + "AND dc.doctor_id = apt.doctor_id\n"
                + "WHERE dc.doctor_id = ?\n"
                + "AND dc.is_day_off = 0\n"
                + "AND dc.date = ?\n"
                + "AND appointment_id IS NULL\n"
                + "AND (\n"
                + "    dc.date > CURDATE()  \n"
                + "    OR (\n"
                + "        dc.date = CURDATE() \n"
                + "        AND TIME(dc.slot_time) > CURRENT_TIME()\n"
                + "    )\n"
                + ");";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ps.setDate(2, TimeUtil.dateConverter1(chosenDate));
            rs = ps.executeQuery();
            while (rs.next()) {
                int scheId = rs.getInt("schedule_id");
                Date date = rs.getDate("date");
                String dayOfWeek = rs.getString("day_of_week");
                String time = rs.getString("slot_time");
                int isOff = rs.getInt("is_day_off");
                DoctorSchedule s = new DoctorSchedule(scheId, date, dayOfWeek, time, isOff);
                returnList.add(s);
            }
            return returnList;
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
