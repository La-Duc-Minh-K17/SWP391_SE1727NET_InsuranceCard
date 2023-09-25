/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.CategoryDAO;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Blog_Category;
import model.Blog;

/**
 *
 * @author kiemq
 */
public class NewListController extends HttpServlet {

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
            out.println("<title>Servlet NewsList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsList at " + request.getContextPath() + "</h1>");
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
        BlogDAO dao = new BlogDAO();
        List<Blog> blogsList = dao.getAllNews();
        request.setAttribute("data", blogsList);
        List<Blog> blogsList3 = dao.getTop3News();
        request.setAttribute("blogs3", blogsList3);
        CategoryDAO cdao = new CategoryDAO();
        List<Blog_Category> blogCategory = cdao.getAllCategorys();
        request.setAttribute("listC", blogCategory);
        request.getRequestDispatcher("frontend/view/blog.jsp").forward(request, response);
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
        String search = request.getParameter("search");
        String category = request.getParameter("choices-single-default");
        BlogDAO dao = new BlogDAO();
        List<Blog> blogslist = new ArrayList<>();

        CategoryDAO cdao = new CategoryDAO();
        List<Blog_Category> blog_category = cdao.getAllCategorys();
        blogslist = dao.getAllNewsBySearch(search, Integer.parseInt(category));
        List<Blog> blogs3 = new ArrayList<>();
        blogs3 = dao.getTop3News();
        request.setAttribute("listC", blog_category);
        request.setAttribute("list4", blogs3);
        request.setAttribute("data", blogslist);
        request.setAttribute("search", search);
        request.getRequestDispatcher("frontend/view/blog.jsp").forward(request, response);
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
