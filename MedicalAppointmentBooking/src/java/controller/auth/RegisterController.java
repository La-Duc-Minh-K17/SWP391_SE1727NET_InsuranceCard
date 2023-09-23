/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import utils.CodeProcessing;
import utils.EmailSending;
import utils.SessionUtils;
import utils.TimestampUtils;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import model.Role;
import model.UserAccount;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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

        // Get the server name
        TimestampUtils timeConfig = new TimestampUtils();
        UserDAO uDAO = new UserDAO();
        String action = request.getParameter("action");

        if (action != null && action.equals("verify")) {
            UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
            Timestamp confirmationTokenTime = user.getRecoveryTokenTime();

            if (timeConfig.isExpired(confirmationTokenTime)) {
                String token = uDAO.getConfirmationToken(user);
                String urlToken = request.getParameter("token");
                if (token.equals(urlToken)) {
                    uDAO.activateUserAccount(user);
                    request.setAttribute("message", "Verify Successfully.");
                }
                else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                request.setAttribute("error", "The link time has expired");
                request.getRequestDispatcher("/register").forward(request, response);
            }
            response.sendRedirect(request.getContextPath() + "/frontend/view/homepage.jsp");
        }
        if (action != null && action.equals("regist")) {
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String confirmationToken = CodeProcessing.generateToken();
            UserAccount user = new UserAccount(username, password, email, fullname, gender.equals("Male") ? 1 : 0, phone, confirmationToken, timeConfig.getNow(), 0, new Role(1));
            SessionUtils.getInstance().putValue(request, "user", user);
            String fullURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getRequestURI();
            String urlLink = fullURL + "?action=verify&token=" + confirmationToken;
            EmailSending.sendVerificationMail(user, urlLink, email);
            request.setAttribute("success", "A confirmation email has been sent to your Email, please check.");
        }
        request.getRequestDispatcher("/frontend/view/register.jsp").forward(request, response);
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
