/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dbContext.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog_Category;
import model.Blog;

/**
 *
 * @author kiemq
 */
public class NewsDao extends DBConnection {

    public CategoryDao categoryDao = new CategoryDao();

    public List<Blog> getAllNews() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT *FROM blogs";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog r = new Blog();
                r.setID(rs.getInt(1));
                r.setCategory_id(rs.getInt(2));
                r.setTitle(rs.getString(3));
                r.setCreated_time(rs.getDate(4));
                r.setContent(rs.getString(5));
                r.setScript(rs.getString(6));
                r.setImage(rs.getString(7));
                blogs.add(r);
            }
        } catch (Exception e) {
        }
        return blogs;
    }

    public List<Blog> getTop3News() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT top 3 *FROM blogs  order by created_time desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog r = new Blog();
                r.setID(rs.getInt(1));
                r.setCategory_id(rs.getInt(2));
                r.setTitle(rs.getString(3));
                r.setCreated_time(rs.getDate(4));
                r.setContent(rs.getString(5));
                r.setScript(rs.getString(6));
                r.setImage(rs.getString(7));
                blogs.add(r);
            }
        } catch (Exception e) {
        }
        return blogs;
    }

    public List<Blog> getAllNewsBySearch(String search, String from, String to, int categoryId) {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT *FROM News Where title like ? and timepost between ? and ? and categoryid = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            statement.setString(2, from);
            statement.setString(3, to);
            statement.setInt(4, categoryId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog r = new Blog();
                r.setID(rs.getInt(1));
                r.setCategory_id(rs.getInt(2));
                r.setTitle(rs.getString(3));
                r.setCreated_time(rs.getDate(4));
                r.setContent(rs.getString(5));
                r.setScript(rs.getString(6));
                r.setImage(rs.getString(7));
                blogs.add(r);
            }
        } catch (Exception e) {
        }
        return blogs;

    }

    public List<Blog> getAllNewsBySearch(String search, int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
