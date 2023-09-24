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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Blog;
import model.UserAccount;

/**
 *
 * @author kiemq
 */
public class BlogsDao extends DBConnection {

    DBConnection dbc = new DBConnection();
    public CategoryDao categoryDao = new CategoryDao();

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

    public List<Blog> getAllNews() {
        List<Blog> blogsList = new ArrayList<>();
        String sql = "SELECT *FROM mabs.blogs ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getDBConnection();
            System.out.println(connection);
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if(result.getBlob("image")!=null){
                image = imageString(result.getBlob("image"));}
                int blogCategoryId = result.getInt("blog_category_id");
                Date blogCreatedTime = result.getDate("created_time");
                Blog blog = new Blog(blogId, blogTitle, blogDescription, blogContent, image, blogCategoryId, blogCreatedTime);
                blogsList.add(blog);
            }
            return blogsList;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Blog> getTop3News() {

        List<Blog> blogsList3 = new ArrayList<>();
        String sql = "SELECT * FROM mabs.blogs ORDER BY created_time DESC LIMIT 3;";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getDBConnection();
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = imageString(result.getBlob("image"));
                int blogCategoryId = result.getInt("blog_category_id");
                Date blogCreatedTime = result.getDate("created_time");
                Blog blog3 = new Blog(blogId, blogTitle, blogDescription, blogContent, image, blogCategoryId, blogCreatedTime);
                blogsList3.add(blog3);
            }
            return blogsList3;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Blog> getAllNewsBySearch(String search, String from, String to, int categoryId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    public List<Blog> getAllNewsBySearch(String search, int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
