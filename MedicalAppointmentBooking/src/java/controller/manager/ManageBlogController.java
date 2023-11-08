/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.BlogDAO;
import dal.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
 *
 * @author Admin
 */
@MultipartConfig(maxFileSize = 16177215)
public class ManageBlogController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BlogDAO dDAO = new BlogDAO();
        String action = request.getParameter("action");
        CategoryDAO cDAO = new CategoryDAO();
        request.setAttribute("cDAO", cDAO.getAllCategorys());
        if (action != null && action.equals("view-all")) {
            List<Blog> blogList = dDAO.getAllNews();
            request.setAttribute("dList", blogList);
            request.getRequestDispatcher("frontend/view/admin/bloglist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("filter")) {
            int catId = Integer.parseInt(request.getParameter("blog_category_id"));
            List<Blog> dbiList= new ArrayList<>();
            if (catId == 0) {
                dbiList = dDAO.getAllNews();
            }else{
            dbiList = dDAO.getBlogById(catId);}
            request.setAttribute("dList", dbiList);
            request.getRequestDispatcher("frontend/view/admin/bloglist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("search")) {
            String search = request.getParameter("search").trim();
            List<Blog> bList = dDAO.getBlogByName(search);
            request.setAttribute("dList", bList);
            System.out.println(bList);
            request.getRequestDispatcher("frontend/view/admin/bloglist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Blog blog = dDAO.getBlogDetailByID(id);
            // request.setAttribute("speList", bDAO.getAllSpeciality());
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("frontend/view/admin/editblog.jsp").forward(request, response);
            return;
        }

        if (action != null && action.equals("edit-info")) {
            int blogId = Integer.parseInt(request.getParameter("blog_id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String content = request.getParameter("content");
            Part image = request.getPart("image");
            dDAO.updateBlog(blogId, title, description, content, image);
            response.sendRedirect("manage-blog?action=edit&id=" + blogId);
            return;
        }
        if (action != null && action.equals("detail")) {
            int blogId = Integer.parseInt(request.getParameter("blog_id"));
            Blog blog = dDAO.getBlogDetailByID(blogId);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("frontend/view/admin/detailblog.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("delete_blog_id"));
            dDAO.deleteBlogById(id);
            System.out.println(id);
            response.sendRedirect("manage-blog?action=view-all");
            return;
        }
        if (action != null && action.equals("add")) {
            request.getRequestDispatcher("frontend/view/admin/addblog.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("add-info")) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String content = request.getParameter("content");
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            Part image = request.getPart("image");
            Date createdTime = new java.sql.Date(System.currentTimeMillis());
            dDAO.addBlog(title, description, content, categoryId, image, createdTime);
            response.sendRedirect("manage-blog?action=view-all");
            return;
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
