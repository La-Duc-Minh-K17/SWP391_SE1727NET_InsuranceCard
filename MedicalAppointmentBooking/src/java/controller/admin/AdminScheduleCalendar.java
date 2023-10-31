/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.google.gson.Gson;
import dal.AppointmentDAO;
import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Appointment;
import model.Calendar;
import model.Reservation;

/**
 *
 * @author Admin
 */
public class AdminScheduleCalendar extends HttpServlet {

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
        AppointmentDAO apptDAO = new AppointmentDAO();
        ReservationDAO resvDAO = new ReservationDAO();
        List<Appointment> apptList = apptDAO.getAllAppointment();
        List<Reservation> resvList = resvDAO.getAllReservation();
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();
        String baseUrl = scheme + "://" + serverName + ":" + serverPort + contextPath + "/";
        List<Calendar> list = new ArrayList<>();
        for (Appointment a : apptList) {
            if (!a.getStatus().equals("REJECTED") && !a.getStatus().equals("PENDING") && !a.getStatus().equals("CANCELED")) {
                Calendar c = new Calendar(a);
                c.setUrl(baseUrl + "admin-appointmentdetail?action=view-detail&apptId=" + a.getApptId());
                list.add(c);
            }
        }
        for (Reservation resv : resvList) {
            if (!resv.getStatus().equals("REJECTED") && !resv.getStatus().equals("PENDING") && !resv.getStatus().equals("CANCELED")) {
                Calendar c = new Calendar(resv);
                c.setUrl(baseUrl + "admin-reservationdetail?action=view-detail&resvId=" + resv.getResvId());
                list.add(c);
            }
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(new Gson().toJson(list));
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
