/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

<<<<<<< Updated upstream
import dbContext.DBConnection;
import java.sql.Connection;
import java.sql.Date;
=======
>>>>>>> Stashed changes
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
        List<Blog_Category> blogCategory = new ArrayList<>();
        PreparedStatement ps = null;
        Connection connection = null;
        ResultSet result = null;
        String sql = "SELECT *FROM mabs.blog_category ";

        try {
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
