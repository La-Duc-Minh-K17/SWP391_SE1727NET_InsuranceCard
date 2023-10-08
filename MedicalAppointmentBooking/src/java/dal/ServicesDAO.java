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
import java.util.logging.Level;
import java.util.logging.Logger;
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
                String name = rs.getString("name");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                int setting_id = rs.getInt("setting_id");
                servicesList.add(new Service_Category(name, description,status,setting_id));
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
   public ArrayList<Service> paging(int page, int page_size) {
    ArrayList<Service> services = new ArrayList<>();
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM services ORDER BY service_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

    try {
        Connection connection = dbc.getConnection();
        ps = connection.prepareStatement(sql);
        ps.setInt(1, (page - 1) * page_size);
        ps.setInt(2, page_size);
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
            
            Service service = new Service(service_id, service_name, service_description, service_details, fee, service_image, service_status, category_id);
            services.add(service);
        }
    } catch (SQLException ex) {
        Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // Handle the exception
            }
        }

        }

    return services;
}
public List<Service> searchServicesByName(String keyword) {
    List<Service> resultList = new ArrayList<>();
    try {
        Connection conn = new DBConnection().getConnection(); // Adjust this line to get your database connection.
        String sql = "SELECT * FROM services s WHERE s.service_name LIKE ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int service_id = rs.getInt("service_id");
            String service_name = rs.getString("service_name");
            String service_description = rs.getString("service_description");
            String service_details = rs.getString("service_details");
            int fee = rs.getInt("fee");
            String service_image = ImageProcessing.imageString(rs.getBlob("service_image"));
            int service_status = rs.getInt("service_status");
            int category_id = rs.getInt("category_id");
            Service service = new Service(service_id, service_name, service_description, service_details, fee, service_image, service_status, category_id);
            resultList.add(service); // Add the service to the result list
        }
        // Close resources
        rs.close();
        ps.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultList;
}




}
