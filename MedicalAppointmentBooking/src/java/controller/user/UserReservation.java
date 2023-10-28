/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Reservation;
import model.UserAccount;
import utils.SessionUtils;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class UserReservation extends HttpServlet {

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
        ReservationDAO resvDAO = new ReservationDAO();
        String action = request.getParameter("action");
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
        if (action != null && action.equals("view")) {
            List<Reservation> resvList = resvDAO.getPatientReservationByUserId(user.getUserId());
            request.setAttribute("resvList", resvList);
            request.getRequestDispatcher("frontend/view/user_reservation.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("view-detail")) {
            int resvId = Integer.parseInt(request.getParameter("resvId"));
            Reservation resv = resvDAO.getReservationById(resvId);
            request.setAttribute("resv", resv);
            request.getRequestDispatcher("frontend/view/user_reservationdetail.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("reschedule")) {
            String date = request.getParameter("resv-date");
            String time = request.getParameter("resv-time");
            String reason = request.getParameter("reschedule_reason");
            int apptId = Integer.parseInt(request.getParameter("reschedule_appointment"));
            Reservation resv = resvDAO.getReservationById(apptId);
            resv.setRescheduleReason(reason);
            resv.setResvDate(TimeUtil.dateConverter1(date));
            resv.setResvTime(time);
            resv.setStatus("RESCHEDULED");
            resvDAO.rescheduleReservationForPatient(resv);
            response.sendRedirect("user-appointment?action=view-detail&apptId=" + resv.getResvId());
            return;
        }
        if (action != null && action.equals("cancel")) {
            int resvId = Integer.parseInt(request.getParameter("cancel_appointment"));
            Reservation resv = resvDAO.getReservationById(resvId);
            resv.setStatus("CANCELED");
            resvDAO.updateStatus(resv);
            response.sendRedirect("user-reservation?action=view-detail&apptId=" + resv.getResvId());
            return;
        }
        if (action != null && action.equals("filter")) {
            String filter = request.getParameter("status_filter");
            if (filter.equalsIgnoreCase("all")) {
                response.sendRedirect("user-reservation?action=view");
                return;
            }
            List<Reservation> resvList = resvDAO.getFilteredPatientReservation(user.getUserId(), filter);
            request.setAttribute("resvList", resvList);
            request.getRequestDispatcher("frontend/view/user_reservation.jsp").forward(request, response);
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
