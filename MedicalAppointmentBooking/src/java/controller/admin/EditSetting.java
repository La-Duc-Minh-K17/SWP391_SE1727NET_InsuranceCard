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
import static java.lang.System.out;
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
public class EditSetting extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditSetting</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSetting at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        request.getRequestDispatcher("frontend/view/admin/settingList.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String editSettingType = request.getParameter("editSettingType");
        String editSettingValue = request.getParameter("editSettingValue");
        String editSettingDescription = request.getParameter("editSettingDescription");
//        String editSettingStatus = request.getParameter("editSettingStatus");
//        int status;
//        if (editSettingStatus.equalsIgnoreCase("Active")) {
//            status = 1;
//        } else {
//            status = 0;
//        }
        SettingDAO db = new SettingDAO();

        if (editSettingType.equalsIgnoreCase("user")) {
            Role role = new Role();
            role.setRole_name(editSettingValue);
            role.setRole_description(editSettingDescription);
            //role.setStatus(status);
            db.updateRole(role,id);
        } else if (editSettingType.equalsIgnoreCase("speciality")) {
            Speciality spe = new Speciality();
            spe.setSpeName(editSettingValue);
            spe.setSpeDescription(editSettingDescription);
           // spe.setSpeStatus(status);
            db.updateSpeciality(spe,id);
        } else if (editSettingType.equalsIgnoreCase("service")) {
            Service_Category service = new Service_Category();
            service.setName(editSettingValue);
            service.setDescription(editSettingDescription);
            //service.setStatus(status);
            db.updateService(service,id);
        } else if (editSettingType.equalsIgnoreCase("blog")) {
            Blog_Category blog = new Blog_Category();
            blog.setName(editSettingValue);
            blog.setDescription(editSettingDescription);
            //blog.setStatus(status);
            db.updateBlog(blog,id);
        }
        SettingDAO st = new SettingDAO();
        ArrayList<Setting> settings = st.list();
        request.setAttribute("settings", settings);
        
        request.getRequestDispatcher("frontend/view/admin/settingList.jsp").forward(request, response);
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
