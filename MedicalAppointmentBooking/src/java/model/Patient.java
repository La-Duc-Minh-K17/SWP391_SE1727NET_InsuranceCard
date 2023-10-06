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
    private UserAccount userAccount;
    private UserRelative userRelative;

    public Patient() {
        userAccount = null;
        userRelative = null;
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

    public UserAccount getAccount() {
        return userAccount;
    }

    public void setAccount(UserAccount account) {
        this.userAccount = account;
    }

    public UserRelative getUserRelative() {
        return userRelative;
    }

    public void setUserRelative(UserRelative userRelative) {
        this.userRelative = userRelative;
    }

}
