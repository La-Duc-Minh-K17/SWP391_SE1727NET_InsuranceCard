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
import utils.SessionUtils;

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
            List<Service> List = null;
            String uri = null;
            request.setAttribute("cateList", sDAO.getAllServiceCategory());
            if (action != null && action.equals("view-all")) {
                List = sDAO.getAllServiceByStatus();
                uri = "service?action=view-all";
            }
            if (action != null && action.equals("filter")) {
                int cateId = Integer.parseInt(request.getParameter("category_id"));
                List = sDAO.getServiceByCategoryID(cateId);
                uri = "service?action=filter&category_id="+cateId;
            }
            if (action != null && action.equals("search")) {
                String keyword = request.getParameter("keyword").trim();
                List = sDAO.searchServicesByName(keyword);
                uri = "service?action=search&keyword="+keyword;
            }
            if (action != null && action.equals("view")) {
                int serivce_id = Integer.parseInt(request.getParameter("id"));
                Service service = sDAO.getServiceById(serivce_id);
                request.setAttribute("service", service);
                request.getRequestDispatcher("frontend/view/servicedetail.jsp").forward(request, response);

            }
            if (action != null && action.equals("sorted")) {
                String by = request.getParameter("by");
                String sort = request.getParameter("sort");
                List = sDAO.sortService(by, sort);
                uri = "service?action=sorted&by=feename&sort=" + sort;
            }
            if (action != null && action.equals("book-service")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Service serviceDetail = sDAO.getServiceById(id);
                SessionUtils.getInstance().putValue(request, "chosen_service", serviceDetail);
                request.getRequestDispatcher("booking?action=form-filling").forward(request, response);
                return;
            }
            if (List != null) {
                int page, numberpage = 6;
                int size = List.size();
                int num = (size % numberpage == 0 ? (size / numberpage) : ((size / numberpage) + 1));
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start = (page - 1) * numberpage;
                int end = Math.min(page * numberpage, size);

                List<Service> servicelist = sDAO.getListByPage(List, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("url", uri);
                request.setAttribute("sList", servicelist);
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
