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
import model.UserAccount;
import utils.ImageProcessing;

/**
 *
 * @author Admin
 */
public class UserDAO {

    DBConnection dbc = new DBConnection();

    public UserAccount getAccountByEmail(String email) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        String sql = "select * from user_account where email = ? ";
        UserAccount userAccount = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            result = ps.executeQuery();
            if (result.next()) {
                String userName = result.getString("username");
                String emailAddress = result.getString("email");
                String fullName = result.getString("full_name");
                String image = ImageProcessing.imageString(result.getBlob("image"));
                int gender = result.getInt("gender");
                String phone = result.getString("phone");
                String confirmationToken = result.getString("confirmation_token");
                Timestamp confirmationTime = result.getTimestamp("confirmation_token_time");
                String recoveryToken = result.getString("recovery_token");
                Timestamp recoveryTime = result.getTimestamp("recovery_token_time");
                userAccount = new UserAccount(userName, emailAddress, fullName, gender, phone, image, confirmationToken, confirmationTime, recoveryToken, recoveryTime);
            }
            return userAccount;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (connection != null) {
                // closes the database connection
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

        }
        return null;
    }

    public void updateRecoveryToken(UserAccount user, String token, Timestamp updatedTime) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE user_account SET recovery_token = ? , recovery_token_time = ? WHERE email = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, token);
            ps.setTimestamp(2, updatedTime);
            ps.setString(3, user.getEmail());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }

    }

    public void updatePassword(UserAccount user, String newPassword) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE user_account SET password = ? WHERE username = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, user.getUserName());
            System.out.println(user.getUserName());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
    }

    public void addUserAccount(UserAccount user) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "INSERT INTO `mabs`.`user_account`\n"
                + "(`username`,\n"
                + "`password`,\n"
                + "`email`,\n"
                + "`full_name`,\n"
                + "`gender`,\n"
                + "`phone`,\n"
                + "`status`,\n"
                + "`confirmation_token`,\n"
                + "`confirmation_token_time`,\n"
                + "`role_id`)\n"
                + "VALUES\n"
                + "( ?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);   ";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getFullName());
            ps.setInt(5, user.getGender());
            ps.setString(6, user.getPhone());
            ps.setInt(7, user.getStatus());
            ps.setString(8, user.getConfirmationToken());
            ps.setTimestamp(9, user.getConfirmationTokenTime());
            ps.setInt(10, user.getRole().getRole_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }

    }

    public void activateUserAccount(UserAccount user) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE user_account SET status = 1 WHERE email = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
    }

    public String getConfirmationToken(UserAccount account) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        String token = null;
        String sql = "select confirmation_token from user_account where email = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            rs = ps.executeQuery();
            if (rs.next()) {
                token = rs.getString(1);
            }
            return token;
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return token;
    }

    public boolean isAccountExisted(UserAccount account) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet rs = null;
        boolean isExisted = false;
        String sql = "select * from user_account where email = ? and username = ? ";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getUserName());
            rs = ps.executeQuery();
            if (rs.next()) {
                isExisted = true;
            }
            return isExisted;
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return isExisted;
    }

    public UserAccount getUserAccount(String username, String password) {
        PreparedStatement stm = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user_account "
                + "WHERE username = ?\n"
                + "AND password = ?";
        try {
            connection = dbc.getConnection();

            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                UserAccount account = new UserAccount();
                String userName = rs.getString("username");
                String emailAddress = rs.getString("email");
                String fullName = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                account = new UserAccount(userName, emailAddress, fullName, gender, phone, image , status);

                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
