package controller.auth;

import utils.CodeProcessing;
import utils.EmailSending;
import utils.SessionUtils;
import utils.TimeUtil;
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
public class ForgotPasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     *
     * /**
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
        TimeUtil timeUtil = new TimeUtil();
        String action = request.getParameter("action");

        if (action != null && action.equals("send-link")) {

            String email = request.getParameter("email");
            UserAccount account = uDAO.getAccountByEmail(email);

            if (account == null) {
                request.setAttribute("error", "Email address is not found in the system! Try again.");
            } else {
                String recoveryToken = CodeProcessing.generateToken();
                Timestamp updatedTime = timeUtil.getNow();
                uDAO.updateRecoveryToken(account, recoveryToken, updatedTime);
                String fullURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                String urlLink = fullURL + "/verify?action=verify-reset&token=" + recoveryToken;
                EmailSending.sendRecoveryAccount(urlLink, email);
                account = uDAO.getAccountByEmail(email);
                SessionUtils.getInstance().putValue(request, "user", account);
                request.setAttribute("success", "An email has been sent to your email. Please check.");
                request.getRequestDispatcher("frontend/view/forgotpassword.jsp").forward(request, response);
                return;
            }
        }
        if (action != null && action.equals("reset-password")) {
            String newpassword = request.getParameter("password");
            UserAccount account = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
            uDAO.updatePassword(account, newpassword);
            request.getRequestDispatcher("/login").forward(request, response);
            return;
        }
        request.getRequestDispatcher("frontend/view/forgotpassword.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected UserDAO uDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    /**
     * /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @ -98,13 +65,12 @@ public class ForgotPasswordController extends
     * HttpServlet {
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    /**
     * /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
