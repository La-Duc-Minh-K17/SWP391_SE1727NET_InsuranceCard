/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.home;

import dal.CategoryDao;
import dal.NewsDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Blog_Category;
/**
 *
 * @author nguye
 */
public class NewDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        NewsDao dao = new NewsDao();
        HttpSession session = req.getSession();
        session.setAttribute("new", blogsdetail);
        CategoryDao cda = new CategoryDao();
        List<Blog_Category> listC = cda.getAllCategorys();
        List<Blog> list3 = new ArrayList<>();
        list3 = dao.getTop3News();
        req.setAttribute("list3", list3);
        req.setAttribute("listC", listC);
        req.setAttribute("news", blogsdetail);
        req.getRequestDispatcher("frontend/view/new_details.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
