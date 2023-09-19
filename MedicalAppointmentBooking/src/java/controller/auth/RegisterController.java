/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import configs.CodeProcessing;
import configs.EmailSending;
import configs.SessionConfigs;
import configs.TimestampConfigs;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        TimestampConfigs timeConfig = new TimestampConfigs();
        UserDAO uDAO = new UserDAO();
        String action = request.getParameter("action");
        if (action.equals("verify")) {
            UserAccount user = (UserAccount) SessionConfigs.getInstance().getValue(request, "user");
            Timestamp confirmationTokenTime = user.getRecoveryTokenTime();
            if (timeConfig.isExpired(confirmationTokenTime)) {
                uDAO.activeUserAccount(user);
                request.setAttribute("message", "Verify Successfully.");
            } else {
               request.setAttribute("error", "The link time has expired" );
               request.getRequestDispatcher("/register?action=register").forward(request, response);
            }
            response.sendRedirect(request.getContextPath() + "/frontend/view/homepage.jsp");
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

        TimestampConfigs timeConfig = new TimestampConfigs();
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");

        if (action.equals("register")) {
            String confirmationToken = CodeProcessing.generateToken();
            UserAccount user = new UserAccount(username, password, email, fullname, gender, phone, confirmationToken, timeConfig.getNow(), 0);
            SessionConfigs.getInstance().putValue(request, "user", user);
            uDAO.addUserAccount(user);
            EmailSending.sendVerificationMail(user, request.getContextPath() + "/register?action=verify&token=" + confirmationToken, email);
            request.getRequestDispatcher("/register?action=verify").forward(request, response);
        }

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
