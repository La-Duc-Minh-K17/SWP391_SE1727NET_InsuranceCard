/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.sun.xml.internal.ws.api.config.management.policy.ManagementAssertion.Setting;

/**
 *
 * @author PC
 */
public class Doctor {
   
    private int doctor_id;
    private String name;
    private int phone;
    private String description;
    private boolean status;
    private String img;

    public Doctor( int doctor_id, String name, int phone, String description, boolean status, String img) {
        
        this.doctor_id = doctor_id;
        this.name = name;
        this.phone = phone;
        this.description = description;
        this.status = status;
        this.img = img;
    }
    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
    
