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
import java.util.ArrayList;
import java.util.List;
import model.Blog_Category;

/**
 *
 * @author nguye
 */
public class CategoryDAO extends DBConnection {
    DBConnection dbc = new DBConnection();

    public List<Blog_Category> getAllCategorys() {
        List<Blog_Category> blogCategory = new ArrayList<>();
        String sql = "SELECT blog_category_id, name FROM mabs.blog_category ";
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;

        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {

                int categoryId = result.getInt("blog_category_id");
                String categoryName = result.getString("name");
                Blog_Category category = new Blog_Category(categoryId, categoryName);
                blogCategory.add(category);
            }
            return blogCategory;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
