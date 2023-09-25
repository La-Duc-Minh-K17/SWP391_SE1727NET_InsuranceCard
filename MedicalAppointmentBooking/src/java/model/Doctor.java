/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Doctor {
   
    private int doctorId;
    private String name;
    private String phone;
    private String speciality;
    private String description;
    private boolean status;
    private String img;

    public Doctor(int doctorId, String name, String phone, String speciality, String description, String img) {
        this.doctorId = doctorId;
        this.name = name;
        this.phone = phone;
        this.speciality = speciality;
        this.description = description;
        this.img = img;
    }
    
    
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctor_id) {
        this.doctorId = doctor_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
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

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }
    
}
    
