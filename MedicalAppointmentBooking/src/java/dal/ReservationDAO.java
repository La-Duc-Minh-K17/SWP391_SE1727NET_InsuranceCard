/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Reservation;

/**
 *
 * @author Admin
 */
public class ReservationDAO {
    DBConnection dbc = new DBConnection();

    public void insertNewReservation(Reservation resv) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO `mabs`.`reservations`\n"
                + "(\n"
                + "`reservation_note`,\n"
                + "`reservation_date`,\n"
                + "`reservation_time`,\n"
                + "`reservation_status`,\n"
                + "`staff_id`,\n"
                + "`service_id`,\n"
                + "`patient_id`)\n"
                + "VALUES\n"
                + "(? ,?,?,?,?,?,?);";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, resv.getResvNote());
            ps.setDate(2, resv.getResvDate());
            ps.setString(3, resv.getResvTime());
            ps.setString(4, resv.getStatus());
            ps.setInt(5, resv.getStaffId());
            ps.setInt(6, resv.getServiceId());
            ps.setInt(7, resv.getPatientId());
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
