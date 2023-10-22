/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Role {
    private int role_id;
    private String role_name;
    private String role_description;
    private int setting_id;
    private int status;

    public Role() {
    }
        public Role(int role_id, String role_name) {
        this.role_id = role_id;
        this.role_name = role_name;
    }


    public Role(int roleId) {
        this.role_id = roleId;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRole_description() {
        return role_description;
    }

    public void setRole_description(String role_description) {
        this.role_description = role_description;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
