/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author PC
 */
public class ServiceController extends HttpServlet {

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
            ServicesDAO sDAO = new ServicesDAO();
            String action = request.getParameter("action");
            request.setAttribute("cateList", sDAO.getAllServiceCategory());
            if (action != null && action.equals("view-all")) {
                List<Service> serList = sDAO.getAllService();
                request.setAttribute("sList", serList);
                request.getRequestDispatcher("frontend/view/service.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("filter")) {
                int cateId = Integer.parseInt(request.getParameter("category_id"));
                List<Service> serList = sDAO.getServiceByCategoryID(cateId);
                request.setAttribute("sList", serList);
                request.getRequestDispatcher("frontend/view/service.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("search")) {
                String keyword = request.getParameter("keyword").trim();
                List<Service> sList = sDAO.searchServicesByName(keyword);
                request.setAttribute("sList", sList);

                request.getRequestDispatcher("frontend/view/service.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("view")) {
                int serivce_id = Integer.parseInt(request.getParameter("id"));
                Service service = sDAO.getServiceById(serivce_id);
                request.setAttribute("service", service);
                request.getRequestDispatcher("frontend/view/servicedetail.jsp").forward(request, response);

            }  if (action != null && action.equals("sorted")) {
                String by = request.getParameter("by");
                String sort = request.getParameter("sort");
                List<Service> sortedServiceList = sDAO.sortService(by, sort);
                request.setAttribute("sList", sortedServiceList);
                request.getRequestDispatcher("frontend/view/service.jsp").forward(request, response);
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
