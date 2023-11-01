/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AppointmentDAO;
import dal.DoctorDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointment;
import model.Doctor;
import utils.EmailSending;
import utils.TimeUtil;
import dal.SpecialityDAO;
import model.Speciality;

/**
 *
 * @author Admin
 */
public class AdminAppointmentDetail extends HttpServlet {

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
        AppointmentDAO apptDAO = new AppointmentDAO();
        SpecialityDAO speDAO = new SpecialityDAO();
        DoctorDAO dDAO = new DoctorDAO();
        if (action != null && action.equals("view-detail")) {
            int apptId = Integer.parseInt(request.getParameter("apptId"));
            List<Doctor> doctorList = null;
            List<Speciality> speList = null;
            Appointment appt = apptDAO.getAppointmentById(apptId);
            if (appt.getDoctor() != null) {
                doctorList = dDAO.getDoctorBySpeciality(appt.getDoctor().getSpeciality());
                request.setAttribute("doctorL", doctorList);
            } else {
                speList = speDAO.getAllSpeciality();
                request.setAttribute("speList", speList);
            }
            request.setAttribute("appt", appt);
            request.getRequestDispatcher("frontend/view/admin/admin_appointmentdetail.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("reassign")) {
            int doctorId = Integer.parseInt(request.getParameter("doctor"));
            String date = request.getParameter("appt-date");
            String time = request.getParameter("appt-time");
            int apptId = Integer.parseInt(request.getParameter("apptId"));
            Appointment appointment = apptDAO.getAppointmentById(apptId);
            appointment.setApptDate(TimeUtil.dateConverter1(date));
            appointment.setApptTime(time);
            Doctor d = dDAO.getDoctorById(doctorId);
            appointment.setDoctor(d);
            apptDAO.rescheduleAppointment(appointment);
            response.sendRedirect("admin-appointmentdetail?action=view-detail&apptId=" + appointment.getApptId());
            return;
        } if (action != null && action.equals("remove")) {  
            int apptId = Integer.parseInt(request.getParameter("apptId"));
            Appointment appointment = apptDAO.getAppointmentById(apptId);
            appointment.setApptDate(null);
            appointment.setApptTime("");
            appointment.setDoctor(null);
            apptDAO.rescheduleAppointment(appointment);
            response.sendRedirect("admin-appointmentdetail?action=view-detail&apptId=" + appointment.getApptId());
            return;
        }
        if (action != null && action.equals("confirm")) {
            int apptId = Integer.parseInt(request.getParameter("apptId"));
            Appointment appointment = apptDAO.getAppointmentById(apptId);
            appointment.setStatus("CONFIRMED");
            System.out.println(appointment);
            apptDAO.updateStatus(appointment);
            EmailSending.sendReminderEmail(appointment);
            response.sendRedirect("admin-appointmentdetail?action=view-detail&apptId=" + appointment.getApptId());
            return;
        }
        if (action != null && action.equals("reject")) {
            int apptId = Integer.parseInt(request.getParameter("cancel_appointment"));
            String reject_reason = request.getParameter("reject_reason");
            Appointment appointment = apptDAO.getAppointmentById(apptId);
            appointment.setStatus("REJECTED");
            appointment.setRejectReason(reject_reason);
            apptDAO.updateStatus(appointment);
            response.sendRedirect("admin-appointmentdetail?action=view-detail&apptId=" + appointment.getApptId());
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
