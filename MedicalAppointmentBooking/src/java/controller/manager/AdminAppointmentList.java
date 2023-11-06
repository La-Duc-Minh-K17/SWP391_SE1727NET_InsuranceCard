/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.AppointmentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointment;

/**
 *
 * @author Admin
 */
public class AdminAppointmentList extends HttpServlet {

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
        String uri = null;
        List<Appointment> apptList = null;
        AppointmentDAO apptDAO = new AppointmentDAO();
        if (action != null && action.equals("delete")) {
            int apptId = Integer.parseInt(request.getParameter("appointment_canceled"));
            apptDAO.deleteRecord(apptId);
            response.sendRedirect("admin-appointment?action=view");
        }
        if (action != null && action.equals("view")) {
            apptList = apptDAO.getAllAppointment();
            uri = "admin-appointment?action=view";
        }

        if (action != null && action.equals("search")) {
            String search = request.getParameter("search");
            apptList = apptDAO.searchAppointmentByPatientName(search);
            uri = "admin-appointment?action=search&search=" + search;
        }
        if (action != null && action.equals("filter")) {
            String status = request.getParameter("status_filter");
            apptList = null;
            if (status.equals("all")) {
                response.sendRedirect("admin-appointment?action=view");
            } else {
                apptList = apptDAO.getFilteredAppointmentList(status);
            }
            uri = "admin-appointment?action=filter&status=" + status;
        }
        if (apptList != null) {
            int page, numberpage = 5;
            int size = apptList.size();
            int num = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Appointment> appointment = apptDAO.getListByPage(apptList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("url", uri);
            request.setAttribute("apptList", appointment);
            request.getRequestDispatcher("frontend/view/admin/admin_appointment.jsp").forward(request, response);
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
