/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

import utils.ImageProcessing;

/**
 *
 * @author kiemq
 */
public class BlogDAO extends DBConnection {

    DBConnection dbc = new DBConnection();
    public CategoryDAO categoryDao = new CategoryDAO();

    public List<Blog> getAllNews() {
        List<Blog> blogsList = new ArrayList<>();
        String sql = "SELECT *FROM mabs.blogs ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
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
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
                int blogCategoryId = result.getInt("blog_category_id");
                Date blogCreatedTime = result.getDate("created_time");
                Blog blog = new Blog(blogId, blogTitle, blogDescription, blogContent, image, blogCategoryId, blogCreatedTime);
                blogsList3.add(blog);
            }
            return blogsList3;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Blog> getAllNewsBySearch1(int categoryId, String sort) {
        List<Blog> blogsList = new ArrayList<>();
        String sql;
        if ("all".equals(sort)) {
            sql = "SELECT * FROM mabs.blogs";
        } else if ("newest".equals(sort)) {
            sql = "SELECT * FROM mabs.blogs ORDER BY created_time DESC";
        } else {
            sql = "SELECT * FROM mabs.blogs ORDER BY created_time ASC";
        }
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);

            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
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

    public List<Blog> getAllNewsBySearch2(int categoryId, String sort) {
        List<Blog> blogsList = new ArrayList<>();
        String sql;
        if ("all".equals(sort)) {
            sql = "SELECT * FROM mabs.blogs  WHERE blog_category_id = ?";
        } else if ("newest".equals(sort)) {
            sql = "SELECT * FROM mabs.blogs WHERE blog_category_id = ? ORDER BY created_time DESC";
        } else {
            sql = "SELECT * FROM mabs.blogs WHERE blog_category_id = ? ORDER BY created_time ASC";
        }
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);

            result = ps.executeQuery();
            while (result.next()) {
                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
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

    public Blog getBlogDetailByID(int Id) {
        Blog blog = new Blog();
        String sql = "SELECT *FROM mabs.blogs where blog_id = ? ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, Id);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
                int blogCategoryId = result.getInt("blog_category_id");
                Date blogCreatedTime = result.getDate("created_time");
                blog = new Blog(blogId, blogTitle, blogDescription, blogContent, image, blogCategoryId, blogCreatedTime);
            }
            return blog;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Blog> getRandomNews() {
        List<Blog> blogsList = new ArrayList<>();
        String sql = "SELECT * FROM mabs.blogs ORDER BY RAND() LIMIT 6; ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
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

    public List<Blog> getBlogByName(String search) {
        List<Blog> blogsList = new ArrayList<>();
        String sql = "select * from mabs.blogs where title like \"%?%\" ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, search);
            result = ps.executeQuery();
            while (result.next()) {
                int blogId = result.getInt("blog_id");
                String blogTitle = result.getString("title");
                String blogDescription = result.getString("description");
                String blogContent = result.getString("content");
                String image = null;
                if (result.getBlob("image") != null) {
                    image = ImageProcessing.imageString(result.getBlob("image"));
                }
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
}
//               <!-- sql = "SELECT * FROM mabs.blogs WHERE blog_category_id = ?";
//ps.setInt(1, categoryId);
//            ps.setString(2, sort);