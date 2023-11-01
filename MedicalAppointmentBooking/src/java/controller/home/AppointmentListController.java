/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DoctorDAO;
import dal.PatientDAO;
import dal.AppointmentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Doctor;
import model.Appointment;
import utils.SessionUtils;

/**
 *
 * @author nguye
 */
public class AppointmentListController extends HttpServlet {

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
        PatientDAO pdao = new PatientDAO();
        AppointmentDAO adao = new AppointmentDAO();

        String action = request.getParameter("action");
        DoctorDAO dDao = new DoctorDAO();
        Doctor doctor = (Doctor) SessionUtils.getInstance().getValue(request, "user");
        request.setAttribute("doctor", doctor);
        if (action != null && action.equals("view-all")) {
            List<Appointment> apptList = adao.getAppointmentByDoctorId(doctor.getDoctorId());
            request.setAttribute("apptList", apptList);
            request.getRequestDispatcher("frontend/view/admin/doctorappointmentlist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("search")) {
            String search = request.getParameter("search").trim();
            List<Appointment> apptList = adao.searchAppointmentByPatientNameAndIdDoc(doctor.getDoctorId(), search);
            request.setAttribute("apptList", apptList);
            request.getRequestDispatcher("frontend/view/admin/doctorappointmentlist.jsp").forward(request, response);
            return;

        }
        if (action != null && action.equals("filter")) {
            String filter = request.getParameter("status_filter");
            if (filter.equalsIgnoreCase("all")) {
                response.sendRedirect("doctor-appointmentlist?action=view-all");
                return;
            }
            List<Appointment> returnList = new ArrayList<>();
            List<Appointment> apptList = adao.getAppointmentByDoctorId(doctor.getDoctorId());
            for (Appointment appt : apptList) {
                if (appt.getStatus().equalsIgnoreCase(filter)) {
                    returnList.add(appt);
                }
            }
            request.setAttribute("apptList", returnList);
            request.getRequestDispatcher("frontend/view/admin/doctorappointmentlist.jsp").forward(request, response);
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
