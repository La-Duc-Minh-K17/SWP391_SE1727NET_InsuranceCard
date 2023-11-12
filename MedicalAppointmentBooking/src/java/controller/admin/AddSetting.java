/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Blog_Category;
import model.Role;
import model.Service_Category;
import model.Setting;
import model.Speciality;

/**
 *
 * @author DELL
 */
public class AddSetting extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSetting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSetting at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        SettingDAO st = new SettingDAO();
        ArrayList<Setting> settings = st.list();
        request.setAttribute("settings", settings);
        request.getRequestDispatcher("frontend/view/settingList.jsp").forward(request, response);
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
        String settingType = request.getParameter("settingType");
        String settingValue = request.getParameter("settingValue");
        String settingDescription = request.getParameter("settingDescription");
//        String settingStatus = request.getParameter("settingStatus");
//        int status;
//        if (settingStatus.equalsIgnoreCase("Active")) {
//            status = 1;
//        } else {
//            status = 0;
//        }

        SettingDAO db = new SettingDAO();

        if (settingType.equalsIgnoreCase("user")) {
            Role role = new Role();
            role.setRole_name(settingValue);
            role.setRole_description(settingDescription);
           // role.setStatus(status);
            db.insertRole(role);
        } else if (settingType.equalsIgnoreCase("speciality")) {
            Speciality spe = new Speciality();
            spe.setSpeName(settingValue);
            spe.setSpeDescription(settingDescription);
            //spe.setSpeStatus(status);
            db.insertSpeciality(spe);
        } else if (settingType.equalsIgnoreCase("service")) {
            Service_Category service = new Service_Category();
            service.setName(settingValue);
            service.setDescription(settingDescription);
            //service.setStatus(status);
            db.insertService(service);
        } else if (settingType.equalsIgnoreCase("blog")) {
            Blog_Category blog = new Blog_Category();
            blog.setName(settingValue);
            blog.setDescription(settingDescription);
           // blog.setStatus(status);
            db.insertBlog(blog);
        }
        SettingDAO st = new SettingDAO();
        ArrayList<Setting> settings = st.list();
        request.setAttribute("settings", settings);
        
        request.getRequestDispatcher("frontend/view/admin/settingList.jsp").forward(request, response);
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
