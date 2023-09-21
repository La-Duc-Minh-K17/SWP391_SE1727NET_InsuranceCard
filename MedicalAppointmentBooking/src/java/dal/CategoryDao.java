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
 * @author nguye
 */
public class CategoryDao extends DBConnection {

    public List<Blog_Category> getAllCategorys() {


        List<Blog_Category> blog_category = new ArrayList<>();
        try {
            String sql = "SELECT *FROM blog_category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Blog_Category b = new Blog_Category();
                b.setID(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setStatus(rs.getString(4));
                b.setSetting_id(rs.getInt(5));
                blog_category.add(b);
            }
        } catch (Exception e) {
        }
        return blog_category;
    }

}
