/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Role;
import model.UserAccount;
import utils.ImageProcessing;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class UserDAO {

    DBConnection dbc = new DBConnection();
    RoleDAO rDAO = new RoleDAO();

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
                int id = result.getInt("user_id");
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
                int roleId = result.getInt("role_id");
                Role role = rDAO.getRoleById(roleId);
                userAccount = new UserAccount(userName, emailAddress, fullName, gender, phone, image, confirmationToken, confirmationTime, recoveryToken, recoveryTime);
                userAccount.setUserId(id);
                userAccount.setRole(role);
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
        public void updateAccount(String id, String role, String status, String fullname,
            String phone, String gender, String dob) {
        PreparedStatement ps = null;
        String sql = "UPDATE `mabs`.`user_account`  SET\n"
                + "            `role_id` =?,\n"
                + "            `status` = b'"+status+"',\n"
                + "            `full_name` = ?,\n"
                + "            `phone` = ?,\n"
                + "            `gender` =  b'"+gender+"',\n"
                + "            `dob` = ? \n"
                + "             WHERE `user_id` =   " + id;
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, role);
            ps.setString(2, fullname);
            ps.setString(3, phone);
            ps.setString(4, dob);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }


    public void updatePassword(UserAccount user, String newPassword) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE user_account SET password = ? WHERE username = ? and email = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, user.getUserName());
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
                + "`dob`,\n"
                + "`address`,\n"
                + "`status`,\n"
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
            ps.setDate(7, user.getDob());
            ps.setString(8, user.getAddress());
            ps.setInt(9, user.getStatus());

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
                int id = rs.getInt("user_id");
                String userName = rs.getString("username");
                String emailAddress = rs.getString("email");
                String fullName = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                Date dob = rs.getDate("dob");
                String address = rs.getString("address");
                Role role = rDAO.getRoleById(rs.getInt("role_id"));
                System.out.println(role);
                account = new UserAccount(id, userName, emailAddress, fullName, gender, phone, image, dob, address, status);
                account.setRole(role);
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public UserAccount getAccountById(int id) {
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        String sql = "select * from user_account where user_id = ? ";
        UserAccount userAccount = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeQuery();
            if (result.next()) {
                int userId = result.getInt("user_id");
                String userName = result.getString("username");
                String emailAddress = result.getString("email");
                String fullName = result.getString("full_name");
                String image = ImageProcessing.imageString(result.getBlob("image"));
                Date dob = result.getDate("dob");
                String address = result.getString("address");
                int gender = result.getInt("gender");
                String phone = result.getString("phone");
                int status = result.getInt("status");
                Role role = rDAO.getRoleById(result.getInt("role_id"));
                userAccount = new UserAccount(userId, userName, emailAddress, fullName, gender, phone, image, dob, address, status);
                userAccount.setRole(role);
            }
            return userAccount;
        } catch (SQLException ex) {

        } finally {
            if (connection != null) {
                // closes the database connection
                try {
                    connection.close();
                } catch (SQLException ex) {

                }
            }

        }
        return null;
    }

    public void updateAccountProfile(int userId, String fullName, int gender, String email, String phone, String dob, String address, Part image) {
        PreparedStatement ps = null;
        InputStream fileImage = ImageProcessing.imageStream(image);
        String sql = "UPDATE `mabs`.`user_account`\n"
                + "SET\n"
                + "`email` =?,\n"
                + "`full_name` = ?,\n"
                + "`gender` = ?,\n"
                + "`phone` = ?,\n"
                + "`dob` = ?,\n"
                + "`address`=?\n";
        if (fileImage != null) {
            sql = sql + " , image = ? \n";
        }
        sql = sql + "WHERE `user_id` =  ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, fullName);
            ps.setInt(3, gender);
            ps.setString(4, phone);
            ps.setDate(5, TimeUtil.dateConverter1(dob));
            ps.setString(6, address);
            if (fileImage != null) {
                ps.setBlob(7, fileImage);
                ps.setInt(8, userId);
            } else {
                ps.setInt(7, userId);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
public void ChangeAccountStatus(String uid, String ss) {
        PreparedStatement ps = null;
        Connection connection = null;
        String sql = "UPDATE user_account SET status = "+ss+" WHERE user_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,uid);
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
    }public UserAccount getUserAccountByID(String uid) {
        PreparedStatement stm = null;
        Connection connection = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user_account "
                + "WHERE user_id = " + uid;
        try {
            connection = dbc.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                UserAccount account = new UserAccount();
                int id = rs.getInt("user_id");
                String userName = rs.getString("username");
                String emailAddress = rs.getString("email");
                String fullName = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                Date dob = rs.getDate("dob");
                String address = rs.getString("address");
                account = new UserAccount(id, userName, emailAddress, fullName, gender, phone, image, dob, address, status);
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public ArrayList<UserAccount> getListUserAccount(String status, String role) {
        PreparedStatement stm = null;
        Connection connection = null;
        ResultSet rs = null;
        ArrayList<UserAccount> list = new ArrayList<>();
        String sql = "SELECT a.*, r.role_name FROM user_account a join user_role r on a.role_id = r.role_id where 1=1 ";
        if (!status.isEmpty()) {
            sql += "  And a.status = " + status;
        }
         if (!role.isEmpty()) {
            sql += "  And a.role_id = " + role;
        }
        try {
            connection = dbc.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {

                UserAccount account = new UserAccount();
                int id = rs.getInt("user_id");
                String userName = rs.getString("username");
                String emailAddress = rs.getString("email");
                String fullName = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                int getStatus = rs.getInt("status");
                Date dob = rs.getDate("dob");
                String address = rs.getString("address");
                Role r = new Role(rs.getInt("role_id"),rs.getString("role_name"));
                account = new UserAccount(id, userName, emailAddress, fullName, gender, phone, image, dob, address, getStatus);
               account.setRole(r);
                list.add(account);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
}
