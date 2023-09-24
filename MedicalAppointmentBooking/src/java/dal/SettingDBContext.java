/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Setting;

/**
 *
 * @author DELL
 */
public class SettingDBContext {

    DBContext db = new DBContext();

    public ArrayList<Setting> list() {
        ArrayList<Setting> settings = new ArrayList<>();
        Connection connection = db.getConnection();
        try {
            String sql = "SELECT setting_id, type,value,description,status from settings";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingId(rs.getInt("setting_id"));
                s.setType(rs.getString("type"));
                s.setValue(rs.getString("value"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getBoolean("status"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public ArrayList<Setting> getSetting(String type, String term) {
        ArrayList<Setting> settings = new ArrayList<>();
        Connection connection = db.getConnection();
        try {
            String sql = "SELECT setting_id, type,value,description,status FROM settings\n"
                    + "WHERE " + type + " like ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, "%" + term + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingId(rs.getInt("setting_id"));
                s.setType(rs.getString("type"));
                s.setValue(rs.getString("value"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getBoolean("status"));

                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }

    public ArrayList<Setting> getSettingAllType(String term) {
        ArrayList<Setting> settings = new ArrayList<>();
        Connection connection = db.getConnection();
        try {
            String sql = "SELECT setting_id, type,value,description,status FROM settings\n"
                    + " WHERE type like ? or setting_id like ? or value like ? or description like ? or status like ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, "%" + term + "%");
            stm.setString(2, "%" + term + "%");
            stm.setString(3, "%" + term + "%");
            stm.setString(4, "%" + term + "%");
            stm.setString(5, "%" + term + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingId(rs.getInt("setting_id"));
                s.setType(rs.getString("type"));
                s.setValue(rs.getString("value"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getBoolean("status"));

                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }
}
//String columnName = "setting_id";
//String columnValue = "some_value";
//String sql = "SELECT setting_id, type, value, status FROM settings WHERE " + columnName + " = ?";
//PreparedStatement preparedStatement = connection.prepareStatement(sql);
//preparedStatement.setString(1, columnValue);
