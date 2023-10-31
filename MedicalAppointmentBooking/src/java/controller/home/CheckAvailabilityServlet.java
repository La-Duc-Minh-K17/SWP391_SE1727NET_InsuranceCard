/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import com.google.gson.Gson;
import dal.AppointmentDAO;
import dal.DoctorDAO;
import dal.DoctorScheduleDAO;
import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Doctor;
import model.DoctorSchedule;

/**
 *
 * @author Admin
 */
public class CheckAvailabilityServlet extends HttpServlet {

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
        ReservationDAO rDAO = new ReservationDAO();
        DoctorScheduleDAO dcDAO = new DoctorScheduleDAO();
        AppointmentDAO apptDAO = new AppointmentDAO();
        String type = request.getParameter("type");
        DoctorDAO dDAO = new DoctorDAO();
        if (type != null && type.equals("appointment")) {
            String date = request.getParameter("chosenDate");
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
            List<DoctorSchedule> scheduleList = dcDAO.getAvailableSlot(doctorId, date);
            Gson json = new Gson();
            String timeList = json.toJson(scheduleList);
            response.setContentType("text/html");
            response.getWriter().write(timeList);
            
        }
        if (type != null && type.equals("reservation")) {
            String date = request.getParameter("chosenDate");
            int serviceId = Integer.parseInt(request.getParameter("service_id"));
            List<String> timeSlot = rDAO.getAvailableTimeSlot(serviceId, date) ;
            Gson json = new Gson();
            String timeList = json.toJson(timeSlot);
            response.setContentType("text/html");
            response.getWriter().write(timeList);
        }
         if (type != null && type.equals("doctor")) {
            int specialityId = Integer.parseInt(request.getParameter("speciality_id"));
            List<Doctor> listDoctor = dDAO.getDoctorBySpeciality(specialityId);
            Gson json = new Gson();
            String list = json.toJson(listDoctor);
            response.setContentType("text/html");
            response.getWriter().write(list);
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
