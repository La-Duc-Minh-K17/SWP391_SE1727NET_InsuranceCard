/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;
import model.Service;

/**
 *
 * @author PC
 */
public class ManageServices extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ServicesDAO sDAO = new ServicesDAO();
            String action = request.getParameter("action");
            request.setAttribute("cateList", sDAO.getAllServiceCategory());
            if (action != null && action.equals("view-all")) {
                List<Service> serviceList = sDAO.getAllService();
                System.out.println(serviceList);
                request.setAttribute("sList", serviceList);
                request.getRequestDispatcher("frontend/view/admin/listservice.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("filter")) {
                int cateId = Integer.parseInt(request.getParameter("category_id"));
                List<Service> serviceList = sDAO.getServiceByCategoryID(cateId);
                request.setAttribute("sList", serviceList);
                request.getRequestDispatcher("frontend/view/admin/listservice.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("search")) {
                String search = request.getParameter("search").trim();
                List<Service> sList = sDAO.searchServicesByName(search);
                request.setAttribute("sList", sList);
                request.getRequestDispatcher("frontend/view/admin/listservice.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("service_id"));
                Service service = sDAO.getServiceById(id);
                request.setAttribute("service", service);
                request.getRequestDispatcher("frontend/view/admin/editservice.jsp").forward(request, response);
                return;
            }
            if (action != null && action.equals("edit-info")) {
                int service_id = Integer.parseInt(request.getParameter("service_id"));
                String service_name = request.getParameter("service_name");
                int fee = Integer.parseInt(request.getParameter("fee"));
                String service_description = request.getParameter("service_description");
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                String service_details = request.getParameter("service_details");
                int service_status = Integer.parseInt(request.getParameter("status"));
                Part service_image = request.getPart("image");
                sDAO.updateService(service_id, service_name, service_description, service_details, fee, service_image, service_status, category_id);
                response.sendRedirect("manage-service?action=edit&id=" + service_id);
                return;
            }
            if (action != null && action.equals("view")) {
                int service_id = Integer.parseInt(request.getParameter("id"));
                Service sevice = sDAO.getServiceById(service_id);
                request.setAttribute("service", sevice);
                request.getRequestDispatcher("frontend/view/admin/detailservice.jsp").forward(request, response);

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
