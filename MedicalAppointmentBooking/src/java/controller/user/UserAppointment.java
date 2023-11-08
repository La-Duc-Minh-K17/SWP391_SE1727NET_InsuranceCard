/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.AppointmentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointment;
import model.UserAccount;
import utils.SessionUtils;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class UserAppointment extends HttpServlet {

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
        String action = request.getParameter("action");
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
        if (action != null && action.equals("view")) {
            List<Appointment> listAppt = apptDAO.getPatientAppointmentByUserId(user.getUserId());
            request.setAttribute("apptList", listAppt);
            request.getRequestDispatcher("frontend/view/user_appointment.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("view-detail")) {
            int apptId = Integer.parseInt(request.getParameter("apptId"));
            Appointment appt = apptDAO.getAppointmentById(apptId);
            request.setAttribute("appt", appt);
            request.getRequestDispatcher("frontend/view/user_appointmentdetail.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("reschedule")) {
            String date = request.getParameter("appt-date");
            String time = request.getParameter("appt-time");
            String reason = request.getParameter("reschedule_reason");
            int apptId = Integer.parseInt(request.getParameter("reschedule_appointment"));
            Appointment appointment = apptDAO.getAppointmentById(apptId);
       
            if (apptDAO.checkLimitedTime(appointment, "RESCHEDULED", "RESCHEDULING") && appointment.checkNoticePeriod()) {
                appointment.setRescheduleReason(reason);
                appointment.setApptDate(TimeUtil.dateConverter1(date));
                appointment.setApptTime(time);
                appointment.setStatus("RESCHEDULING");
                appointment.setUpdatedTime(TimeUtil.getNow());
                appointment.setOtherCharge(appointment.getDoctor().getServiceFee() * 0.1);
                apptDAO.rescheduleAppointmentForPatient(appointment);
                request.setAttribute("success", "Your request for rescheduling is made successfully.Please wait for our notification.");
                response.sendRedirect("user-appointment?action=view-detail&apptId=" + appointment.getApptId());
            } else {
                request.setAttribute("error", "You cannot reschedule now. Please check again our policy or contact us for further support.");
                request.getRequestDispatcher("user-appointment?action=view-detail&apptId=" + appointment.getApptId()).forward(request, response);
            }
            return;
        }
        if (action != null && action.equals("cancel")) {
            int apptId = Integer.parseInt(request.getParameter("cancel_appointment"));
            Appointment appointment = apptDAO.getAppointmentById(apptId);
            if (appointment.checkNoticePeriod() && apptDAO.checkLimitedTime(appointment, "CANCELLING", "CANCELLED")) {
                appointment.setStatus("CANCELING");
                appointment.setOtherCharge(appointment.getDoctor().getServiceFee() * 0.1);
                apptDAO.updateStatus(appointment);
                response.sendRedirect("user-appointment?action=view-detail&apptId=" + appointment.getApptId());
            } else {
                request.setAttribute("error", "You cannot cancel now. Please check again our policy or contact us for further support.");
                request.getRequestDispatcher("user-appointment?action=view-detail&apptId=" + appointment.getApptId()).forward(request, response);

            }
            return;
        }
        if (action != null && action.equals("filter")) {
            String filter = request.getParameter("status_filter");
            if (filter.equalsIgnoreCase("all")) {
                response.sendRedirect("user-appointment?action=view");
                return;
            }
            List<Appointment> listAppt = apptDAO.getFilteredPatientAppointment(user.getUserId(), filter);
            request.setAttribute("apptList", listAppt);
            request.getRequestDispatcher("frontend/view/user_appointment.jsp").forward(request, response);
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
