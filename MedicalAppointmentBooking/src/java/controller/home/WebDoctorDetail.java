/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DoctorDAO;
import dal.SpecialityDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.sql.Timestamp;
import model.DoctorFeedback;
import model.UserAccount;
import utils.SessionUtils;

/**
 *
 * @author DELL
 */
public class WebDoctorDetail extends HttpServlet {

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
        SpecialityDAO spe = new SpecialityDAO();
        request.setAttribute("speList", spe.getAllSpeciality());
        int id = Integer.parseInt(request.getParameter("doctorId"));
        DoctorDAO doctor = new DoctorDAO();
        request.setAttribute("doctor", doctor.getDoctorById(id));
        request.setAttribute("feedback", doctor.getFeedBackByDoctorID(id));
        request.getRequestDispatcher("frontend/view/webdoctordetail.jsp").forward(request, response);
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
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
         //out.println(user.getUserId());
        String comments = request.getParameter("message");
        //out.println(comments);
        float rate = Float.parseFloat(request.getParameter("rating"));
        //out.println(rate);
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        //out.println(doctorId);
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        //out.println(createTime);
        DoctorFeedback df = new DoctorFeedback();
        df.setUser(user);
        df.setDoctor_id(doctorId);
        df.setContent(comments);
        df.setRate(rate);
        df.setCreate_time(createTime);
        
        DoctorDAO doc = new DoctorDAO();
        doc.insertFeedback(df);
        
        SpecialityDAO spe = new SpecialityDAO();
        request.setAttribute("speList", spe.getAllSpeciality());
       
        DoctorDAO doctor = new DoctorDAO();
        request.setAttribute("doctor", doctor.getDoctorById(doctorId));
        request.setAttribute("feedback", doctor.getFeedBackByDoctorID(doctorId));
        request.getRequestDispatcher("frontend/view/webdoctordetail.jsp").forward(request, response);
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
