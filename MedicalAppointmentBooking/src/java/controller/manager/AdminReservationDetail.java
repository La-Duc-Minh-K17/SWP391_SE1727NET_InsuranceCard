/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.ReservationDAO;
import dal.ServicesDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Reservation;
import utils.EmailSending;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class AdminReservationDetail extends HttpServlet {

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

        String action = request.getParameter("action");
        ReservationDAO rDAO = new ReservationDAO();
        ServicesDAO sDAO = new ServicesDAO();
        if (action != null && action.equals("view-detail")) {
            int resvId = Integer.parseInt(request.getParameter("resvId"));
            Reservation resv = rDAO.getReservationById(resvId);
            request.setAttribute("resv", resv);
            request.getRequestDispatcher("frontend/view/admin/admin_reservationdetail.jsp").forward(request, response);
        }
        if (action != null && action.equals("update")) {
            String date = request.getParameter("resv-date");
            String time = request.getParameter("resv-time");
            int apptId = Integer.parseInt(request.getParameter("resvId"));
            Reservation resv = rDAO.getReservationById(apptId);
            resv.setResvDate(TimeUtil.dateConverter1(date));
            resv.setResvTime(time);
            rDAO.rescheduleReservation(resv);
            response.sendRedirect("manage-reservationdetail?action=view-detail&resvId=" + resv.getResvId());
            return;
        }
        if (action != null && action.equals("confirm")) {
            int resvId = Integer.parseInt(request.getParameter("resvId"));
            Reservation resv = rDAO.getReservationById(resvId);
            resv.setStatus("CONFIRMED");
            rDAO.updateStatus(resv);
            EmailSending.sendReminderEmail(resv);
            response.sendRedirect("manage-reservationdetail?action=view-detail&resvId=" + resv.getResvId());
            return;
        }
        if (action != null && action.equals("reject")) {
            int resvId = Integer.parseInt(request.getParameter("cancel_appointment"));
            String rejectReason = request.getParameter("reject_reason"); 
            Reservation resv = rDAO.getReservationById(resvId);
            resv.setStatus("REJECTED" );
            resv.setRejectReason(rejectReason);
            rDAO.rejectReservation(resv);
            response.sendRedirect("manage-reservationdetail?action=view-detail&resvId=" + resv.getResvId());
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
