/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DoctorDAO;
import dal.SpecialityDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Service;
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

        DoctorDAO doctorDAO = new DoctorDAO();
        SpecialityDAO speDAO = new SpecialityDAO();
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("doctorId"));
        if (action != null && action.equals("view-detail")) {
            request.setAttribute("speList", speDAO.getAllSpeciality());
            request.setAttribute("doctor", doctorDAO.getDoctorById(id));
            request.setAttribute("feedback", doctorDAO.getFeedBackByDoctorID(id));
            System.out.println(doctorDAO.getFeedBackByDoctorID(id));
            request.getRequestDispatcher("frontend/view/webdoctordetail.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("book-doctor")) {
            Doctor doctor = doctorDAO.getDoctorById(id);
            Service chosenService = (Service) SessionUtils.getInstance().getValue(request, "chosen_service");
            if (chosenService != null) {
                SessionUtils.getInstance().removeValue(request, "chosen_service");
            }
            SessionUtils.getInstance().putValue(request, "chosen_doctor", doctor);
            request.getRequestDispatcher("booking?action=form-filling").forward(request, response);
            return;
        }

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
        String comments = request.getParameter("message");
        float rate = Float.parseFloat(request.getParameter("rating"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));  
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
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
