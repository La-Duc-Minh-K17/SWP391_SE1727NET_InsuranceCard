/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Patient {

    private int patientId;
   
    private UserAccount userAccount;
    private UserRelative userRelative;

    public Patient() {
       
    }
    public Patient(UserAccount userAccountId, UserRelative userRelativeId) {
        this.userAccount = userAccountId;
        this.userRelative = userRelativeId;
    }   

    public Patient(String fullName, int gender, String phone, String image, String dob, String addess, String dateAppoint) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Patient(String fullName, int gender, String phone, String image, String dob, String addess, String dateAppoint, int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public int getPatientId() {
        return patientId;
    }
    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }
    public UserAccount getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(UserAccount userAccount) {
        this.userAccount = userAccount;
    }

    public UserRelative getUserRelative() {
        return userRelative;
    }

    public void setUserRelative(UserRelative userRelative) {
        this.userRelative = userRelative;
    }

    public Patient(int patientId, UserAccount userAccount, UserRelative userRelative) {
        this.patientId = patientId;
        this.userAccount = userAccount;
        this.userRelative = userRelative;
    }

    @Override
    public String toString() {
        return "Patient{" + "patientId=" + patientId + ", userAccount=" + userAccount + ", userRelative=" + userRelative + '}';
    }

    
    
    
        

}
