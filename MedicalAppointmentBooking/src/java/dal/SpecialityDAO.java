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
import java.util.ArrayList;
import java.util.List;
import model.Speciality;

/**
 *
 * @author Admin
 */
public class SpecialityDAO {

    DBConnection dbc = new DBConnection();

    public List<Speciality> getAllSpeciality() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        List<Speciality> list = null;
        String sql = "SELECT * FROM mabs.speciality";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            list = new ArrayList<>();   
            while (rs.next()) {
                int id =  rs.getInt("speciality_id");
                String name = rs.getString("speName");
                String description = rs.getString("speDescription");
                int status = rs.getInt("speStatus");
                Speciality spe = new Speciality(id , name , description , status);
                list.add(spe);
            }
            return list;
        } catch (SQLException e) {
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
}
