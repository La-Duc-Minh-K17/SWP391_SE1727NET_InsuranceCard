/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;
import model.Service_Category;
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
                Service s = new Service(service_id, service_name, service_description, service_details, fee, service_image, service_status, category_id);

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
        try ( Connection conn = dbc.getConnection()) {
            String sql = "SELECT * FROM services s WHERE s.service_name LIKE ?";
            try ( PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, "%" + keyword + "%");
                try ( ResultSet rs = ps.executeQuery()) {
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
                        resultList.add(service); 
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    public List<Service_Category> getAllServiceCategory() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Service_Category> List = new ArrayList<>();
        String sql = "select * from service_category ;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int sc_id = rs.getInt("service_category_id");
                String name = rs.getString("sc_name");
                String description = rs.getString("sc_description");
                int status = rs.getInt("sc_status");
                int setting_id = rs.getInt("setting_id");
                Service_Category sc = new Service_Category(sc_id, name, description, status,setting_id);
                List.add(sc);

            }
            return List;
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
        return List;
    }
    
    public ArrayList<Service> getServiceByCategoryID(int cateId) {
        ArrayList<Service> resultList = new ArrayList<>();
        try ( Connection conn = dbc.getConnection()) {
            String sql = "SELECT * FROM services s WHERE s.category_id = ?";
            try ( PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, cateId);
                try ( ResultSet rs = ps.executeQuery()) {
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
                        resultList.add(service); 
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        };
        System.out.println(resultList);
        
        return resultList;
        
    }
    
    public List<Service> sortService(String by, String sort) {
        List<Service> slist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql;
        if ("all".equals(sort)) {
            sql = "SELECT * FROM services";
        } else if ("price".equals(sort)) {
            sql = "SELECT * FROM services ORDER BY fee ASC";
        }
        else if("pricedsc".equals(sort)) {
            sql = "SELECT * FROM services ORDER BY fee DESC";
        }
        else {
            sql = "SELECT * FROM services ORDER BY service_name";
        }
            try {
                Connection conn = new DBConnection().getConnection();
                ps = conn.prepareStatement(sql);
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
                        slist.add(service); 

                }
                return slist;
            } catch (SQLException e) {
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
            return slist;
        }

    public List<Service_Category> getSCategory(int scId, String sort) {
    List<Service_Category> scList = new ArrayList<>();
    String sql;
    if ("all".equals(sort)) {
        sql = "SELECT * FROM mabs.service_category WHERE service_category_id = ?";
    } else if ("scId".equals(sort)) {
        sql = "SELECT * FROM mabs.service_category WHERE service_category_id = ? ORDER BY service_category_id DESC";
    } else {
        sql = "SELECT * FROM mabs.service_category WHERE service_category_id = ? ORDER BY service_category_id ASC";
    }
    try (
        Connection connection = dbc.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql)
    ) {
        ps.setInt(1, scId);

        try (ResultSet result = ps.executeQuery()) {
            while (result.next()) {
                int sc_id = result.getInt("service_category_id");
                String name = result.getString("sc_name");
                String description = result.getString("sc_description");
                int status = result.getInt("sc_status");
                int setting_id = result.getInt("setting_id");
                Service_Category sc = new Service_Category(sc_id, name, description, status,setting_id);
                scList.add(sc);
            }
        }
        return scList;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return null;
}


    

    public List<Service> getListByPage(List<Service> list,
            int start, int end) {
        ArrayList<Service> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<Service> getListByPage(ArrayList<Service> list,
            int start, int end) {
        ArrayList<Service> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
//    public static void main(String[] args) throws SQLException {
//        ServicesDAO dao = new ServicesDAO();
//        dao.sortServiceByCategoryID(1);
//    }
}
