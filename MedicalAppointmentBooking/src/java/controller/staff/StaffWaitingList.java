/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.staff;

import dal.AppointmentDAO;
import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointment;
import model.Reservation;
import model.UserAccount;
import utils.SessionUtils;

/**
 *
 * @author Admin
 */
public class StaffWaitingList extends HttpServlet {

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
        AppointmentDAO aDAO = new AppointmentDAO();
        ReservationDAO rDAO = new ReservationDAO();
        String action = request.getParameter("action");

        if (action != null && action.equals("view-all")) {
            List<Appointment> apptList = aDAO.getWatingAppointment();
            List<Reservation> resvList = rDAO.getWatingReservation();
            request.setAttribute("apptList", apptList);
            request.setAttribute("resvList", resvList);
            request.getRequestDispatcher("frontend/view/admin/staff_waitinglist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("accept")) {
            String type = request.getParameter("type");
            if (type.equals("appointment")) {
                int apptId = Integer.parseInt(request.getParameter("appointment_accepted"));
                UserAccount account = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
                aDAO.assignAppointment(apptId, account);
            }
            if (type.equals("reservation")) {
                int resvId = Integer.parseInt(request.getParameter("reservation_accepted"));
                UserAccount account = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
                rDAO.assignReservation(resvId, account);
            }
            request.setAttribute("message-success" , "CONFIRM SUCCESSFULLY");
            request.getRequestDispatcher("staff-waiting-list?action=view-all").forward(request, response);
            return;
        }
        if (action != null && action.equals("cancel")) {
            String type = request.getParameter("type");
            if (type.equals("appointment")) {
                int apptId = Integer.parseInt(request.getParameter("appointment_accepted"));
                UserAccount account = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
                aDAO.cancelAppointment(apptId, account);
            }
            if (type.equals("reservation")) {
                int resvId = Integer.parseInt(request.getParameter("reservation_accepted"));
                UserAccount account = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
                rDAO.cancelReservation(resvId, account);
            }
            request.setAttribute("message-success" , "CANCEL SUCCESSFULLY");
            request.getRequestDispatcher("staff-waiting-list?action=view-all").forward(request, response);
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
