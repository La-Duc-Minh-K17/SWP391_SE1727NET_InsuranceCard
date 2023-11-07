package authorization;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import model.UserAccount;
import resource.RoleProp;
import utils.SessionUtils;

/**
 *
 * @author
 */
public class Authorization implements Filter {

    private static final String ERROR401 = "/frontend/view/error_page.jsp";
    private static final String LOGIN = "/login";
    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public Authorization() {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");
        String url = request.getRequestURI() + "?" + request.getQueryString();
        System.out.println();
        if (url.contains("/manage") || url.contains("/doctor") || url.contains("/admin")) {
            if (user != null) {
                if (url.contains("manage")) {
                    if (user.getRole().getRole_name().equals(RoleProp.MANAGER)) {
                        filterChain.doFilter(servletRequest, servletResponse);
                    } else {
                        response.sendRedirect(request.getContextPath() + ERROR401);
                    }
                } else if (url.contains("doctor")) {
                    if (user.getRole().getRole_name().equals(RoleProp.DOCTOR)) {
                        filterChain.doFilter(servletRequest, servletResponse);
                    } else {
                        response.sendRedirect(request.getContextPath() + ERROR401);
                    }
                } else if (url.contains("admin")) {
                    if (user.getRole().getRole_name().equals(RoleProp.ADMIN)) {
                        filterChain.doFilter(servletRequest, servletResponse);
                    } else {
                        response.sendRedirect(request.getContextPath() + ERROR401);
                    }
                }
            } else {
                response.sendRedirect(request.getContextPath() + LOGIN);
            }
        } else if (url.startsWith("/booking") || url.contains("book")) {

            if (user != null) {
                if (user.getRole().getRole_name().equals(RoleProp.PATIENT)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + ERROR401);
                }
            } else {
                response.sendRedirect(request.getContextPath() + LOGIN);
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }

    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("Authorization:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("Authorization()");
        }
        StringBuffer sb = new StringBuffer("Authorization(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
