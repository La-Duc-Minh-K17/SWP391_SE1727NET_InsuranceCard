/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Reservation;

/**
 *
 * @author Admin
 */
public class AdminReservation extends HttpServlet {

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
        ReservationDAO rsDAO = new ReservationDAO();
        String uri = null;
        String action = request.getParameter("action");
        List<Reservation> resvList = new ArrayList<>();
        if (action != null && action.equals("cancel")) {
            int resvId = Integer.parseInt(request.getParameter("reservation_canceled"));
            rsDAO.deleteRecord(resvId);
            response.sendRedirect("admin-reservation?action=view");
            return;
        }
        if (action != null && action.equals("view")) {
            resvList = rsDAO.getAllReservation();
            uri = "admin-reservation?action=view";
        }
        if (action != null && action.equals("search")) {
            String search = request.getParameter("search");
            resvList = rsDAO.searchReservationByPatientName(search);
            uri = "admin-reservation?action=search&search=" + search;
        }
        if (action != null && action.equals("filter")) {
            String status = request.getParameter("status_filter");
            resvList = null;
            if (status.equals("ALL")) {
                response.sendRedirect("admin-reservation?action=view");
            } else {
                resvList = rsDAO.getFilteredReservationList(status);
            }
            uri = "admin-reservation?action=filter&status=" + status;
            request.setAttribute("status", status);
        }
        if (resvList != null) {
            int page, numberpage = 5;
            int size = resvList.size();
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
            List<Reservation> reservation = rsDAO.getListByPage(resvList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("url", uri);
            request.setAttribute("resvList", reservation);
            request.getRequestDispatcher("frontend/view/admin/admin_reservation.jsp").forward(request, response);
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
