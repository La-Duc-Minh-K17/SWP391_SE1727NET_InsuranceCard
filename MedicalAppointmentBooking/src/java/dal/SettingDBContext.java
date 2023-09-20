/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class SettingDBContext extends DBContext {
    public ArrayList<Setting> list() {
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "SELECT setting_id, type,value,status from settings";         
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingId(rs.getInt("setting_id"));
                s.setType(rs.getString("type"));
                s.setValue(rs.getString("value"));
                s.setStatus(rs.getBoolean("status"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public ArrayList<Setting> getSetting(String term) {
        ArrayList<Setting> settings = new ArrayList<>();

        try {
            String sql = "SELECT setting_id, type,value,status FROM settings\n"
                    + "WHERE type = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
         
            stm.setString(1, term);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting s = new Setting();
                s.setSettingId(rs.getInt("setting_id"));
                s.setType(rs.getString("type"));
                s.setValue(rs.getString("value"));
                s.setStatus(rs.getBoolean("status"));

                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }
}
