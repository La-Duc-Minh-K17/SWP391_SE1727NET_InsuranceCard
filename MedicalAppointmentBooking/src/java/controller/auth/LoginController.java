/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dal.DoctorDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;
import model.UserAccount;
import resource.RoleProp;
import utils.SessionUtils;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("frontend/view/login.jsp").forward(request, response);
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
        DoctorDAO dDAO = new DoctorDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        UserAccount account = uDAO.getUserAccount(username, password);

        if (account == null) {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/frontend/view/login.jsp").forward(request, response);
            return;
        } else {
            Doctor doctor = null;
            if (account.getRole().getRole_name().equals(RoleProp.DOCTOR)) {
                doctor = dDAO.getDoctorByUserId(account.getUserId());
                SessionUtils.getInstance().putValue(request, "user", doctor);
            } else {
                SessionUtils.getInstance().putValue(request, "user", account);
            }

            Cookie cusername = new Cookie("username", username);
            Cookie cpass = new Cookie("password", password);
            Cookie crem = new Cookie("remember", "ON");
            if (remember != null) {
                cusername.setMaxAge(60 * 60 * 24 * 30);
                cpass.setMaxAge(60 * 60 * 24 * 30);
                crem.setMaxAge(60 * 60 * 24 * 30);
            } else {
                cusername.setMaxAge(0);
                cpass.setMaxAge(0);
                crem.setMaxAge(0);
            }
            response.addCookie(cusername);
            response.addCookie(cpass);
            response.addCookie(crem);

            request.getRequestDispatcher("home").forward(request, response);
            return;
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
