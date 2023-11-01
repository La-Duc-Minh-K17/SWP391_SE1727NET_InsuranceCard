
package controller.admin;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Role;
import model.UserAccount;
import utils.CodeProcessing;
import utils.EmailSending;
import utils.SessionUtils;
import utils.TimeUtil;

/**
 *
 * @author lnq
 */
@WebServlet(name = "AccountAdd", urlPatterns = {"/AccountAdd"})
public class AccountAdd extends HttpServlet {

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
            out.println("<title>Servlet AccountAdd</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountAdd at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("rl", new RoleDAO().getListRole());
        request.getRequestDispatcher("frontend/view/admin/accountadd.jsp").forward(request, response);
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
        try {
            TimeUtil timeConfig = new TimeUtil();
            UserDAO uDAO = new UserDAO();
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            String status = request.getParameter("status");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String confirmationToken = CodeProcessing.generateToken();

            UserAccount user = new UserAccount(username, "123456@", email, fullname, Integer.valueOf(gender),
                    phone, TimeUtil.dateConverter(dob), address, confirmationToken, timeConfig.getNow(), 0, new Role(Integer.valueOf(role)));
            if (uDAO.isAccountExisted(user)) {
                request.setAttribute("error", "Account has existed !");
            } else if (uDAO.isEmailtExisted(user)) {
                request.setAttribute("error", "This email already existed !");
            } else {
                SessionUtils.getInstance().putValue(request, "user", user);
                uDAO.addUserAccount(user);

                request.setAttribute("success", "Account added with default password 123456@!");
            }
            request.getRequestDispatcher("frontend/view/admin/accountadd.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
