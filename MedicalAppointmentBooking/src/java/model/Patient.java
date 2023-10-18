/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Patient extends UserAccount{

    private int patientId;
    public Patient() {
       
    }

    public Patient(int patientId, int userId, String username, String email, String fullName, int gender, String phone, String image, Date dob, String address, int status) {
        super(userId, username, email, fullName, gender, phone, image, dob, address, status);
        this.patientId = patientId;
    }

    public Patient(int userId, String username, String email, String fullName, int gender, String phone, String image, Date dob, String address, int status) {
        super(userId, username, email, fullName, gender, phone, image, dob, address, status);
    }
    
    
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }
   
    
    


    
    
    
        

}