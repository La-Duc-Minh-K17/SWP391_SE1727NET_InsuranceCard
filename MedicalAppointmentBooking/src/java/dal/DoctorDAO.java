/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Doctor;

import model.DoctorFeedback;
import model.Service;
import model.ServiceReview;
import model.UserAccount;
import utils.ImageProcessing;

/**
 *
 * @author PC
 */
public class DoctorDAO {

    DBConnection dbc = new DBConnection();

    public List<Doctor> getAllDoctor() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();
        String sql = "select * from doctors d \n"
                + "inner join user_account u on d.user_id = u.user_id \n"
                + "inner join speciality s on s.speciality_id = d.speciality_id";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Double serviceFee = rs.getDouble("service_fee");
                Doctor d = new Doctor(doctorId, speciality, position, description, serviceFee, username, email, name, gender, phone, image, status);
                doctorList.add(d);
            }
            return doctorList;
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
        return doctorList;
    }

    public List<Doctor> getDoctorByName(String text) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();
        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where u.full_name LIKE ?";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
                doctorList.add(d);
            }
            return doctorList;
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
        return doctorList;
    }

    public Doctor getDoctorById(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Doctor doctor = null;
        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where d.doctor_id = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                int fee = rs.getInt("service_fee");
                doctor = new Doctor(doctorId, speciality, position, description, username, email, fullName, gender, phone, image, status);
                doctor.setServiceFee(fee);
            }
            return doctor;
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
        return doctor;
    }

    public List<Doctor> getDoctorBySpeciality(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();

        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where s.speciality_id = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
                doctorList.add(d);
            }
            return doctorList;
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
        return doctorList;
    }

    public List<Doctor> getDoctorBySpeciality(String spe) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Doctor> doctorList = new ArrayList<>();

        String sql = "select * from doctors d \n"
                + "            inner join user_account u on d.user_id = u.user_id \n"
                + "            inner join  speciality s on s.speciality_id = d.speciality_id\n"
                + "            where s.speName = ?";

        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, spe);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                Doctor d = new Doctor(doctorId, speciality, position, description, username, email, name, gender, phone, image, status);
                doctorList.add(d);
            }

            return doctorList;
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
        return doctorList;
    }

    public void updateDoctor(int doctorId, String name, int gender, String phone, int speciality_id, String position, String description, int status, Part image) {
        PreparedStatement ps = null;
        InputStream fileImage = ImageProcessing.imageStream(image);
        String sql = "UPDATE mabs.doctors d\n"
                + "INNER JOIN mabs.user_account u ON d.user_id = u.user_id\n"
                + "SET\n"
                + "  u.full_name = ?,\n"
                + "  u.gender = ?,\n"
                + "  u.phone = ?,\n"
                + "  d.speciality_id = ?,\n"
                + "  d.doctor_position = ?,\n"
                + "  d.doctor_description = ?,\n"
                + "  u.status = ? \n";
        if (fileImage != null) {
            sql = sql + " , u.image = ? \n";
        }
        sql = sql + "WHERE d.doctor_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();

            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, gender);
            ps.setString(3, phone);
            ps.setInt(4, speciality_id);
            ps.setString(5, position);
            ps.setString(6, description);
            ps.setInt(7, status);
            if (fileImage != null) {
                ps.setBlob(8, fileImage);
                ps.setInt(9, doctorId);

            } else {
                ps.setInt(8, doctorId);
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


    public List<DoctorFeedback> getDoctorFeedback() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DoctorFeedback> doctorfeedback = new ArrayList<>();
        String sql = "SELECT\n"
                + "    ua.full_name AS patient_name,\n"
                + "    ua.image,\n"
                + "    da.full_name AS doctor_name,\n"
                + "    df.content,\n"
                + "    df.rate,\n"
                + "    df.create_time\n"
                + "FROM doctor_feedback AS df\n"
                + "JOIN user_account AS ua ON df.user_id = ua.user_id\n"
                + "JOIN doctors AS d ON df.doctor_id = d.doctor_id\n"
                + "JOIN user_account AS da ON d.user_id = da.user_id;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAccount acc = new UserAccount();
                String patientName = rs.getString("patient_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                String doctorName = rs.getString("doctor_name");

                String content = rs.getString("content");
                Timestamp create_time = rs.getTimestamp("create_time");
                float rate = rs.getFloat("rate");

                acc.setFullName(patientName);
                acc.setImage(image);

                DoctorFeedback d = new DoctorFeedback();
                d.setDoctorName(doctorName);
                d.setContent(content);
                d.setCreate_time(create_time);
                d.setRate(rate);
                d.setUser(acc);
                doctorfeedback.add(d);
            }
            return doctorfeedback;
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
        return doctorfeedback;
    }

    public List<DoctorFeedback> getDoctorFeedbackASC() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DoctorFeedback> doctorfeedback = new ArrayList<>();
        String sql = "SELECT\n"
                + "    ua.full_name AS patient_name,\n"
                + "    ua.image,\n"
                + "    da.full_name AS doctor_name,\n"
                + "    df.content,\n"
                + "    df.rate,\n"
                + "    df.create_time\n"
                + "FROM doctor_feedback AS df\n"
                + "JOIN user_account AS ua ON df.user_id = ua.user_id\n"
                + "JOIN doctors AS d ON df.doctor_id = d.doctor_id\n"
                + "JOIN user_account AS da ON d.user_id = da.user_id\n"
                + "order by df.create_time ASC";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAccount acc = new UserAccount();
                String patientName = rs.getString("patient_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                String doctorName = rs.getString("doctor_name");

                String content = rs.getString("content");
                Timestamp create_time = rs.getTimestamp("create_time");
                float rate = rs.getFloat("rate");

                acc.setFullName(patientName);
                acc.setImage(image);

                DoctorFeedback d = new DoctorFeedback();
                d.setDoctorName(doctorName);
                d.setContent(content);
                d.setCreate_time(create_time);
                d.setRate(rate);
                d.setUser(acc);
                doctorfeedback.add(d);
            }
            return doctorfeedback;
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
        return doctorfeedback;
    }
    public List<DoctorFeedback> getDoctorFeedbackDESC() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DoctorFeedback> doctorfeedback = new ArrayList<>();
        String sql = "SELECT\n"
                + "    ua.full_name AS patient_name,\n"
                + "    ua.image,\n"
                + "    da.full_name AS doctor_name,\n"
                + "    df.content,\n"
                + "    df.rate,\n"
                + "    df.create_time\n"
                + "FROM doctor_feedback AS df\n"
                + "JOIN user_account AS ua ON df.user_id = ua.user_id\n"
                + "JOIN doctors AS d ON df.doctor_id = d.doctor_id\n"
                + "JOIN user_account AS da ON d.user_id = da.user_id\n"
                + "order by df.create_time DESC";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAccount acc = new UserAccount();
                String patientName = rs.getString("patient_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                String doctorName = rs.getString("doctor_name");

                String content = rs.getString("content");
                Timestamp create_time = rs.getTimestamp("create_time");
                float rate = rs.getFloat("rate");

                acc.setFullName(patientName);
                acc.setImage(image);

                DoctorFeedback d = new DoctorFeedback();
                d.setDoctorName(doctorName);
                d.setContent(content);
                d.setCreate_time(create_time);
                d.setRate(rate);
                d.setUser(acc);
                doctorfeedback.add(d);
            }
            return doctorfeedback;
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
        return doctorfeedback;
    }

    public List<DoctorFeedback> getDoctorFeedbackByDoctorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DoctorFeedback> doctorfeedback = new ArrayList<>();
        String sql = "SELECT\n"
                + "    ua.full_name AS patient_name,\n"
                + "    ua.image,\n"
                + "    da.full_name AS doctor_name,\n"
                + "    df.content,\n"
                + "    df.rate,\n"
                + "    df.create_time\n"
                + "FROM doctor_feedback AS df\n"
                + "JOIN user_account AS ua ON df.user_id = ua.user_id\n"
                + "JOIN doctors AS d ON df.doctor_id = d.doctor_id\n"
                + "JOIN user_account AS da ON d.user_id = da.user_id\n"
                + "where d.doctor_id = ?;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAccount acc = new UserAccount();
                String patientName = rs.getString("patient_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                String doctorName = rs.getString("doctor_name");

                String content = rs.getString("content");
                Timestamp create_time = rs.getTimestamp("create_time");
                float rate = rs.getFloat("rate");

                acc.setFullName(patientName);
                acc.setImage(image);

                DoctorFeedback d = new DoctorFeedback();
                d.setDoctorName(doctorName);
                d.setContent(content);
                d.setCreate_time(create_time);
                d.setRate(rate);
                d.setUser(acc);
                doctorfeedback.add(d);
            }
            return doctorfeedback;
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
        return doctorfeedback;
    }

    public List<DoctorFeedback> getFeedBackByDoctorID(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DoctorFeedback> feedbackList = new ArrayList<>();
        String sql = "select full_name , image,create_time,rate,content \n"
                + "from doctor_feedback df join user_account u on df.user_id = u.user_id\n"
                + "where doctor_id = ?";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAccount acc = new UserAccount();
                String name = rs.getString("full_name");
                String image = ImageProcessing.imageString(rs.getBlob("image"));

                Timestamp create_time = rs.getTimestamp("create_time");
                String content = rs.getString("content");
                float rate = rs.getFloat("rate");

                acc.setFullName(name);
                acc.setImage(image);

                DoctorFeedback d = new DoctorFeedback();
                d.setUser(acc);
                d.setCreate_time(create_time);
                d.setContent(content);
                d.setRate(rate);
                feedbackList.add(d);
            }
            return feedbackList;
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
        return feedbackList;
    }

    public void insertFeedback(DoctorFeedback feedback) {
        Connection connection = dbc.getConnection();
        try {
            String query = "INSERT INTO doctor_feedback ( user_id,doctor_id,create_time,content,rate)\n"
                    + "VALUES (?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, feedback.getUser().getUserId());
            statement.setInt(2, feedback.getDoctor_id());
            statement.setTimestamp(3, feedback.getCreate_time());
            statement.setString(4, feedback.getContent());
            statement.setFloat(5, feedback.getRate());
            statement.executeUpdate();
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
    }
  
    public Doctor getDoctorRelatedCategory(int Id) {
         PreparedStatement ps = null;
        ResultSet rs = null;
        Doctor doctor = null;
        String sql = "SELECT distinct *\n" +
"                FROM mabs.doctors D\n" +
"                JOIN mabs.speciality S on D.speciality_id = S.speciality_id\n" +
"                JOIN mabs.blog_category BC on S.speName = BC.name\n" +
"                JOIN mabs.blogs B on BC.blog_category_id = B.blog_category_id\n" +
"                JOIN mabs.user_account UA on D.user_id = UA.user_id\n" +
"                WHERE B.blog_id = ?\n" +
"                ORDER BY RAND()\n" +
"                LIMIT 1;";
        Connection connection = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int doctorId = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String image = ImageProcessing.imageString(rs.getBlob("image"));
                int gender = rs.getInt("gender");
                String email = rs.getString("email");
                int status = rs.getInt("status");
                String position = rs.getString("doctor_position");
                String speciality = rs.getString("speName");
                String description = rs.getString("doctor_description");
                int fee = rs.getInt("service_fee");
                doctor = new Doctor(doctorId, speciality, position, description, username, email, fullName, gender, phone, image, status);
                doctor.setServiceFee(fee);
            }
            return doctor;
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
        return doctor;

    }

}
