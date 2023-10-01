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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Setting;
import model.UserAccount;
import utils.ImageProcessing;

public class SettingDAO {

    DBConnection dbc = new DBConnection();

    public ArrayList<Setting> list() {
        Connection connection = dbc.getConnection();
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "select s.setting_id  , s.type , role_name as value , role_description as note , role_status \n"
                    + "from setting  s,(select * from user_role union  select * from speciality  union select * from service_category) as temp \n"
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
}
