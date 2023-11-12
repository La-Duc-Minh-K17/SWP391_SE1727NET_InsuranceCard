/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author 
 */
@WebServlet(name = "AccountDetail", urlPatterns = {"/admin-accountdetail"})
public class AccountDetail extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action == null) {
            UserDAO uDAO = new UserDAO();
            request.setAttribute("acc", uDAO.getAccountById(Integer.valueOf(request.getParameter("aid"))));
            request.setAttribute("rl", new RoleDAO().getListRoleButAdmin());
            request.getRequestDispatcher("frontend/view/admin/accountdetail.jsp").forward(request, response);

        } else {
            UserDAO uDAO = new UserDAO();
            request.setAttribute("acc", uDAO.getAccountById(Integer.valueOf(request.getParameter("aid"))));
            request.setAttribute("rl", new RoleDAO().getListRoleButAdmin());
            request.getRequestDispatcher("frontend/view/admin/accountedit.jsp").forward(request, response);
        }

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
        UserDAO uDAO = new UserDAO();
        String id = request.getParameter("id");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        uDAO.updateAccount(id, role, status, fullname, phone, gender, dob);
        request.setAttribute("success", "Update account information successfully.");
        request.setAttribute("acc", uDAO.getAccountById(Integer.valueOf(request.getParameter("id"))));
        request.setAttribute("rl", new RoleDAO().getListRole());
        request.getRequestDispatcher("frontend/view/admin/accountedit.jsp").forward(request, response);

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
