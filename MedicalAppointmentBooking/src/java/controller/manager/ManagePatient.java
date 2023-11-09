/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;
import model.Patient;

/**
 *
 * @author PC
 */
@MultipartConfig(maxFileSize = 16177215)
public class ManagePatient extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            PatientDAO pDAO = new PatientDAO();
            String action = request.getParameter("action");
            if (action != null && action.equals("view-all")) {
                List<Patient> pList = pDAO.getAllPatient();
                request.setAttribute("pList", pList);
                request.getRequestDispatcher("frontend/view/admin/listpatient.jsp").forward(request, response);
            }
            if (action != null && action.equals("view")) {
                int id = Integer.parseInt(request.getParameter("patientId"));
                Patient p = pDAO.getPatientById(id);
                request.setAttribute("patient", p);
                request.getRequestDispatcher("frontend/view/admin/detailpatient.jsp").forward(request, response);
            }
            if (action != null && action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("patientId"));
                Patient p = pDAO.getPatientById(id);
                request.setAttribute("patient", p);
                request.getRequestDispatcher("frontend/view/admin/editpatient.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("edit-info")) {
                int patientId = Integer.parseInt(request.getParameter("patientId"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                String fullName = request.getParameter("fullName");
                int gender = Integer.parseInt(request.getParameter("gender"));
                String phone = request.getParameter("phone");
                String dob = request.getParameter("dob");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                int status = Integer.parseInt(request.getParameter("status"));
                Part image = request.getPart("image");
                pDAO.updatePatient(patientId, userId, username, email, fullName, gender, phone, image, dob, address, status);
                response.sendRedirect("manage-patient?action=edit&patientId=" + patientId);
                return;
            }
            
            if (action != null && action.equals("search")) {
                String search = request.getParameter("search").trim();
                List<Patient> pList = pDAO.searchPatientsByName(search);
                request.setAttribute("pList", pList);
                request.getRequestDispatcher("frontend/view/admin/listpatient.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("status")) {
                int patientId = Integer.parseInt(request.getParameter("patientId"));
                int currentStatus = Integer.parseInt(request.getParameter("status"));
                int newStatus;
                if (currentStatus == 1) {
                    newStatus = 0;
                } else {
                    newStatus = 1;
                }
                pDAO.updatePatientStatus(patientId, newStatus);
                response.sendRedirect("manage-patient?action=view-all");
                return;
            }
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
