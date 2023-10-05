/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
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
        BlogDAO bDAO = new BlogDAO();
        if (action != null && action.equals("view-all")) {
            List<Blog> blogList = dDAO.getAllNews();
            request.setAttribute("dList", blogList);
            request.getRequestDispatcher("frontend/view/admin/bloglist.jsp").forward(request, response);
            return;
        }
        
        if (action != null && action.equals("search")) {
            String search = request.getParameter("search").trim();
            List<Blog> bList = dDAO.getBlogByName(search);
            request.setAttribute("dList", bList);
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
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
            String name = request.getParameter("fullname");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            int spe_id = Integer.parseInt(request.getParameter("speciality"));
            String position = request.getParameter("position");
            String description = request.getParameter("description");
            int status = Integer.parseInt(request.getParameter("status"));
            Part image = request.getPart("image");
            response.sendRedirect("manage-doctor?action=edit&id=" + doctorId);
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
