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
public class UserRelative {
    private int relativeId;
    private String fullName;
    private String phone;
    private int gender;
    private Date dob;
    private String address;
    private String email;
    private int userId;

    public UserRelative() {
    }

    public UserRelative(String fullName, String phone,int gender, String email,Date dob , String address, int userId) {
        this.fullName = fullName;
        this.phone = phone;
        this.gender = gender;
        this.email = email;
        this.dob = dob;
        this.address = address;
        this.userId = userId;
    }

    public UserRelative(int relativeId, String fullName, String phone, int gender, Date dob, String address, String email) {
        this.relativeId = relativeId;
        this.fullName = fullName;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.email = email;
    }

    
    
    public int getRelativeId() {
        return relativeId;
    }

    public void setRelativeId(int relativeId) {
        this.relativeId = relativeId;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

   
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
