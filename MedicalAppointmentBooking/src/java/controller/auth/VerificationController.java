/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import model.UserAccount;
import utils.SessionUtils;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class VerificationController extends HttpServlet {

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
        String action = request.getParameter("action");
        TimeUtil timeConfig = new TimeUtil();
        UserDAO uDAO = new UserDAO();
        if (action != null && action.equals("confirm")) {
            UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
            Timestamp confirmationTokenTime = user.getConfirmationTokenTime();
            if (!timeConfig.isExpired(confirmationTokenTime)) {
                String token = uDAO.getConfirmationToken(user);
                String urlToken = request.getParameter("token");
                if (token.equals(urlToken)) {
                    uDAO.activateUserAccount(user);
                    request.setAttribute("message", "Verify Successfully.");
                } else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");
            }
            request.getRequestDispatcher("/login").forward(request, response);
            return;
        }
        if (action != null && action.equals("verify-reset")) {
            UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
            request.getRequestDispatcher("frontend/view/resetpassword.jsp").forward(request, response);
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
