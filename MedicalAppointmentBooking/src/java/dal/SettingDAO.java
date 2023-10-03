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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog_Category;
import model.Role;
import model.Service_Category;
import model.Setting;
import model.Speciality;

public class SettingDAO {

    DBConnection dbc = new DBConnection();

    public ArrayList<Setting> list() {
        Connection connection = dbc.getConnection();
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "select s.setting_id  , s.type , role_name as value , role_description as note , role_status \n"
                    + "from setting  s,(select * from user_role union  select * from speciality  union select * from service_category union select * from blog_category) as temp \n"
                    + "where temp.setting_id = s.setting_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingID(rs.getInt("s.setting_id"));
                s.setType(rs.getString("s.type"));
                s.setNote(rs.getString("value"));
                s.setDescription(rs.getString("note"));
                s.setStatus(rs.getBoolean("role_status"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public ArrayList<Setting> getSetting(String type, String term) {
        ArrayList<Setting> settings = new ArrayList<>();
        Connection connection = dbc.getConnection();
        try {
            String sql = "select s.setting_id  , s.type , role_name as value , role_description as note , role_status \n"
                    + "from setting  s,(select * from user_role union  select * from speciality  union select * from service_category union select * from blog_category) as temp \n"
                    + "where temp.setting_id = s.setting_id and s.type like ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, "%" + term + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingID(rs.getInt("s.setting_id"));
                s.setType(rs.getString("s.type"));
                s.setNote(rs.getString("value"));
                s.setDescription(rs.getString("note"));
                s.setStatus(rs.getBoolean("role_status"));

                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }
    public ArrayList<Setting> getSettingAllType(String term) {
        ArrayList<Setting> settings = new ArrayList<>();
        Connection connection = dbc.getConnection();
        try {
            String sql = "select s.setting_id  , s.type , role_name as value , role_description as note , role_status \n"
                    + "from setting  s,(select * from user_role union  select * from speciality  union select * from service_category union select * from blog_category) as temp \n"
                    + "where temp.setting_id = s.setting_id \n"
                    + "and (s.type like ? or s.setting_id like ? or role_description  like ? or role_status like ? or role_name like ? )";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + term + "%");
            stm.setString(2, "%" + term + "%");
            stm.setString(3, "%" + term + "%");
            stm.setString(4, "%" + term + "%");
            stm.setString(5, "%" + term + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingID(rs.getInt("s.setting_id"));
                s.setType(rs.getString("s.type"));
                s.setNote(rs.getString("value"));
                s.setDescription(rs.getString("note"));
                s.setStatus(rs.getBoolean("role_status"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }
    public void insertSpeciality(Speciality speciality) {
        Connection connection = dbc.getConnection();
        try {
            String query = "INSERT INTO speciality (speName, speDescription, speStatus, setting_id)\n"
                    + "VALUES (?,?,  ?, 4)";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setString(1, speciality.getSpeName());
            statement.setString(2, speciality.getSpeDescription());
            statement.setInt(3, speciality.getSpeStatus());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void insertRole(Role role) {
        Connection connection = dbc.getConnection();
        try {
            String query = "INSERT INTO user_role (role_name, role_description, role_Status, setting_id)\n"
                    + "VALUES (?, ?, ?, 1);";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, role.getRole_name());
            statement.setString(2, role.getRole_description());
            statement.setInt(3, role.getStatus());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void insertService(Service_Category sevice) {
        Connection connection = dbc.getConnection();
        try {
            String query = "INSERT INTO services_category (sc_name, sc_description, sc_Status, setting_id)\n"
                    + "VALUES (?, ?, ?, 3);";
            PreparedStatement statement = connection.prepareStatement(query);
            Service_Category service = new Service_Category();
            statement.setString(1, service.getName());
            statement.setString(2, service.getDescription());
            statement.setInt(3, service.getStatus());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void insertBlog(Blog_Category blog) {
        Connection connection = dbc.getConnection();
        try {
            String query = "INSERT INTO blog_category (name, description,status, setting_id)\n"
                    + "VALUES (?, ?, ?, 2);";
             PreparedStatement statement = connection.prepareStatement(query);               
                statement.setString(1, blog.getName());
                statement.setString(2, blog.getDescription());
                statement.setInt(3, blog.getStatus());
                statement.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

