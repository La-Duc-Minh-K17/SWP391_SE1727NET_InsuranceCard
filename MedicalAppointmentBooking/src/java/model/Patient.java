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
public class Patient {

    private int patientId;
    private String address;
    private Date dob;
    private int userAccountId;
    private int userRelativeId;

    public Patient() {
       
    }

    public Patient(String address, Date dob, int userAccountId, int userRelativeId) {
        this.address = address;
        this.dob = dob;
        this.userAccountId = userAccountId;
        this.userRelativeId = userRelativeId;
    }

    
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getUserAccountId() {
        return userAccountId;
    }

    public void setUserAccountId(int userAccountId) {
        this.userAccountId = userAccountId;
    }

    public int getUserRelativeId() {
        return userRelativeId;
    }

    public void setUserRelativeId(int userRelativeId) {
        this.userRelativeId = userRelativeId;
    }

    

}
