/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configs;

import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class SessionConfigs {

    private static SessionConfigs sessionConfigs = null;

    public static SessionConfigs getInstance() {
        if (sessionConfigs == null) {
            sessionConfigs = new SessionConfigs();
        }
        return sessionConfigs;
    }

    public void putValue(HttpServletRequest request, String key, Object value) {
        request.getSession().setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest request, String key) {
        return request.getSession().getAttribute(key);
    }

    public void removeValue(HttpServletRequest request, String key) {
        request.getSession().removeAttribute(key);
    }

}
