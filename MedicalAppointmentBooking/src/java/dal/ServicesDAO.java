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
import model.Service;
import utils.ImageProcessing;

/**
 *
 * @author PC
 */
public class ServicesDAO {
    DBConnection dbc = new DBConnection();
 
    public List<Service> getAllService() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Service> serviceList = new ArrayList<>();
        String sql = "select * from services";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int service_id = rs.getInt("service_id");
                String service_name = rs.getString("service_name");
                String service_image = ImageProcessing.imageString(rs.getBlob("service_image"));
                String service_description = rs.getString("service_description");
                String service_details = rs.getString("service_details");
                int fee = rs.getInt("fee");
                int service_status = rs.getInt("service_status");
                int category_id = rs.getInt("category_id");
                Service s = new Service(service_id, service_name,service_description, service_details , fee, service_image , service_status, category_id);
                
                serviceList.add(s);
                
            }
            return serviceList;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return serviceList;
    }
    public Service getServiceById(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Service service = null;
        String sql = "select * from services s \n"
                + "            where s.service_id = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int service_id = rs.getInt("service_id");
                String service_name = rs.getString("service_name");
                String service_description = rs.getString("service_description");
                String service_details = rs.getString("service_details");
                int fee = rs.getInt("fee");
                String service_image = ImageProcessing.imageString(rs.getBlob("service_image"));
                int service_status = rs.getInt("service_status");
                int category_id = rs.getInt("category_id");
                service = new Service(service_id, service_name, service_description, service_details, fee, service_image, service_status, category_id);
            }
            return service;
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
        return service;
    }
}
