/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.DoctorDAO;
import dal.PatientDAO;
import dal.SpecialityDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;
import model.Doctor;
import model.Patient;

/**
 *
 * @author Admin
 */
@MultipartConfig(maxFileSize = 16177215)
public class ManageDoctorController extends HttpServlet {

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
        DoctorDAO dDAO = new DoctorDAO();
        PatientDAO pDAO = new PatientDAO();
        String action = request.getParameter("action");
        SpecialityDAO sDAO = new SpecialityDAO();
        request.setAttribute("speList", sDAO.getAllSpeciality());
        if (action != null && action.equals("view-all")) {
            List<Doctor> doctorList = dDAO.getAllDoctor();
            System.out.println(doctorList);
            request.setAttribute("dList", doctorList);
            request.getRequestDispatcher("frontend/view/admin/doctorlist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("filter")) {
            int speId = Integer.parseInt(request.getParameter("speciality_id"));
            List<Doctor> doctorList = dDAO.getDoctorBySpeciality(speId);
            request.setAttribute("dList", doctorList);
            request.getRequestDispatcher("frontend/view/admin/doctorlist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("search")) {
            String search = request.getParameter("search").trim();
            List<Doctor> dList = dDAO.getDoctorByName(search);
            request.setAttribute("dList", dList);
            request.getRequestDispatcher("frontend/view/admin/doctorlist.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Doctor doctor = dDAO.getDoctorById(id);
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("frontend/view/admin/editdoctor.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("edit-info")) {
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
            String name = request.getParameter("fullname");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            int spe_id = Integer.parseInt(request.getParameter("speciality"));
            String position = request.getParameter("position");
            String description = request.getParameter("description");
            Part image = request.getPart("image");
            dDAO.updateDoctor(doctorId, name, gender, phone, spe_id, position, description, image);
            response.sendRedirect("manage-doctor?action=edit&id=" + doctorId);
            return;
        }  
        if (action != null && action.equals("view")) {
            int doctorId = Integer.parseInt(request.getParameter("id"));
            Doctor doctor = dDAO.getDoctorById(doctorId);
            List<Patient> patient = pDAO.getPatientByDoctorId(doctorId);
            request.setAttribute("patient", patient);
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("frontend/view/admin/doctordetail.jsp").forward(request, response);

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

