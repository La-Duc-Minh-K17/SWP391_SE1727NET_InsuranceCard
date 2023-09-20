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
import java.sql.Timestamp;
import java.util.Base64;
import model.UserAccount;

/**
 *
 * @author Admin
 */
public class UserDAO {

    PreparedStatement ps = null;
    ResultSet result = null;
    DBConnection dbc = new DBConnection();
    Connection connection = null;

    // Convert blob to Base64 string
    public String imageString(Blob blob) {
        String base64Image = null;
        InputStream inputStream = null;
        try {
            inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            try {
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            } catch (IOException ex) {
                System.out.println(ex);
            }
            byte[] imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
            try {
                inputStream.close();
                outputStream.close();
            } catch (IOException ex) {
                System.out.println(ex);
            }

        } catch (SQLException ex) {
        } finally {
            try {
                inputStream.close();
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }
        return base64Image;
    }

    public UserAccount getAccountByEmail(String email) {
        String sql = "select * from useraccount where email = ? ";
        UserAccount userAccount = new UserAccount();
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeQuery();
            while (result.next()) {
                String userName = result.getString("username");
                String emailAddress = result.getString("email");
                String fullName = result.getString("full_name");
                String image = imageString(result.getBlob("image"));
                int gender = result.getInt("gender");
                String phone = result.getString("phone");
                userAccount = new UserAccount(userName, emailAddress , fullName , gender , phone , image);
            }
            return userAccount;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateRecoveryToken(String token) {

    }

    public Timestamp getRecoveryTokenTime() {
        return null;
    }

    public void updatePassword(UserAccount user, String pswd) {

    }

    public void addUserAccount(UserAccount user) {

    }

    public void activeUserAccount(UserAccount user) {

    }
}
