/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.BlogDAO;
import dal.CategoryDAO;
import dal.DoctorDAO;
import dal.ServicesDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Blog_Category;
import model.Doctor;
import model.Service;
import utils.SessionUtils;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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


        CategoryDAO cdao = new CategoryDAO();
        BlogDAO blogDAO = new BlogDAO();
        DoctorDAO doctorDao = new DoctorDAO();
        ServicesDAO serviceDao = new ServicesDAO();
        List<Doctor> doctorList = doctorDao.getAllDoctor();
        List<Service> serviceList = serviceDao.getRandomTop3Service();
        List<Blog> blogsList = blogDAO.getAllNews();
        List<Blog> blogsList3 = blogDAO.getTop3News();

        List<Blog_Category> blogCategory = cdao.getAllCategorys();
        request.setAttribute("doctors", doctorList);
        request.setAttribute("service", serviceList);
        String action = request.getParameter("action");
        request.setAttribute("data", blogsList);
        request.setAttribute("blogs3", blogsList3);
        request.setAttribute("listC", blogCategory);

        if (action != null && action.equals("logout")) {
            SessionUtils.getInstance().removeValue(request, "user");
            request.getRequestDispatcher("frontend/view/home.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("view")) {
            int serivce_id = Integer.parseInt(request.getParameter("id"));
            Service service = serviceDao.getServiceById(serivce_id);
            request.setAttribute("service", service);
            request.getRequestDispatcher("frontend/view/servicedetail.jsp").forward(request, response);

        }
        if (action == null) {
            request.getRequestDispatcher("frontend/view/home.jsp").forward(request, response);
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
