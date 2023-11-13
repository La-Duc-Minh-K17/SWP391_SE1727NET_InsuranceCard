/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DoctorDAO;
import dal.ServicesDAO;
import dal.SpecialityDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Doctor;
import model.DoctorFeedback;
import model.Service;
import model.ServiceReview;
import model.UserAccount;
import utils.SessionUtils;

/**
 *
 * @author PC
 */
public class ServiceDetailController extends HttpServlet {

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
        ServicesDAO servicedao = new ServicesDAO();
        DoctorDAO doctordao = new DoctorDAO();
        String action = request.getParameter("action");

        if (action != null && action.equals("view-detail")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int cateid = Integer.parseInt(request.getParameter("category_id"));
            Service serviceDetail = new Service();
            List<Service> sList = servicedao.getRelatedService(cateid);
            List<Doctor> doctorList = doctordao.getAllDoctor();
            serviceDetail = servicedao.getServiceById(id);
            request.setAttribute("reviews", servicedao.getServiceReviewById(id));
            request.setAttribute("Lists", sList);
            request.setAttribute("doctors", doctorList);
            request.setAttribute("serviceDetail", serviceDetail);
            request.setAttribute("categoryId", cateid);
            request.getRequestDispatcher("frontend/view/servicedetail.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("book-service")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Service serviceDetail = servicedao.getServiceById(id);
            Doctor chosenDoctor = (Doctor) SessionUtils.getInstance().getValue(request, "chosen_doctor");
            if (chosenDoctor != null) {
                SessionUtils.getInstance().removeValue(request, "chosen_doctor");
            }
            SessionUtils.getInstance().putValue(request, "chosen_service", serviceDetail);
            request.getRequestDispatcher("booking?action=form-filling").forward(request, response);
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cateId = Integer.parseInt(request.getParameter("category_id"));
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
        String comments = request.getParameter("message");
        float rate = Float.parseFloat(request.getParameter("rating"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        ServiceReview review = new ServiceReview();
        review.setUser(user);
        review.setService_id(serviceId);
        review.setReview(comments);
        review.setRate(rate);
        review.setCreate_time(createTime);
        ServicesDAO ser = new ServicesDAO();
        ser.insertReview(review);
        
        Service serviceDetail = new Service();
       
        
       
        response.sendRedirect("servicedetail?action=view-detail&id="+serviceId+"&category_id="+cateId);
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
