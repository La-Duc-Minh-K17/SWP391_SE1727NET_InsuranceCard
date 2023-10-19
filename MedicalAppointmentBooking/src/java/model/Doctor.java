/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Doctor extends UserAccount {

    private int doctorId;
    private String speciality;
    private String position;
    private String description;
    private double serviceFee;
    
    public Doctor() {
        
    }

    public Doctor(int doctorId, String speciality,String position,  String description, String username, String email, String fullName, int gender, String phone, String image, int status) {
        super(username, email, fullName, gender, phone, image, status);
        this.doctorId = doctorId;
        this.speciality = speciality;
        this.position = position;
        this.description = description;
    }       

    public Doctor(int doctorId, String speciality, String position, String description, double serviceFee, String username, String email, String fullName, int gender, String phone, String image, int status) {
        super(username, email, fullName, gender, phone, image, status);
        this.doctorId = doctorId;
        this.speciality = speciality;
        this.position = position;
        this.description = description;
        this.serviceFee = serviceFee;
    }

    public Doctor(int doctorId, String speciality, String position, String description, double serviceFee, int userId, String username, String email, String fullName, int gender, String phone, String image, Date dob, String address, int status) {
        super(userId, username, email, fullName, gender, phone, image, dob, address, status);
        this.doctorId = doctorId;
        this.speciality = speciality;
        this.position = position;
        this.description = description;
        this.serviceFee = serviceFee;
    }
    
    
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(double serviceFee) {
        this.serviceFee = serviceFee;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctorId=" + doctorId + ", speciality=" + speciality + ", position=" + position + ", description=" + description + '}';
    }

}
