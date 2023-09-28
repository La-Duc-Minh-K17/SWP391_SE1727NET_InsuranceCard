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
import model.Service_Category;
import static org.apache.catalina.tribes.util.Arrays.add;

/**
 *
 * @author PC
 */
public class ServicesDAO {
    DBConnection dbc = new DBConnection();

    public List<Service_Category> getAllServices_category() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Service_Category> servicesList = new ArrayList<>();
        String sql = "select * from service_category ;  ";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                Boolean status = rs.getBoolean("status");
                int setting_id = rs.getInt("setting_id");
                servicesList.add(new Service_Category(name, description,status,setting_id));
            }
            return servicesList;
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
        return servicesList;
    }
}
