/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class Setting {
    private int settingID;
    private String type;
    private String note;
     private String description;
    private boolean status;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    private ArrayList<Speciality> speciality;
    private ArrayList<Blog> blog;
    private ArrayList<Services> service;
    private ArrayList<Role> role;

    public ArrayList<Blog> getBlog() {
        return blog;
    }

    public void setBlog(ArrayList<Blog> blog) {
        this.blog = blog;
    }

    public ArrayList<Services> getService() {
        return service;
    }

    public void setService(ArrayList<Services> service) {
        this.service = service;
    }

    public ArrayList<Role> getRole() {
        return role;
    }

    public void setRole(ArrayList<Role> role) {
        this.role = role;
    }
    
    public ArrayList<Speciality> getSpeciality() {
        return speciality;
    }

    public void setSpeciality(ArrayList<Speciality> speciality) {
        this.speciality = speciality;
    }
    
    public int getSettingID() {
        return settingID;
    }

    public void setSettingID(int settingID) {
        this.settingID = settingID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}
