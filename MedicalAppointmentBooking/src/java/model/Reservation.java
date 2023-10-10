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
public class Reservation {
     private int resvId;
    private String resvNote;
    private Date resvDate;
    private String resvTime;
    private String testResult;
    private String status;
    private int staffId;
    private int serviceId;
    private int patientId;

    public Reservation() {
    }

    public Reservation(String resvNote, Date resvDate, String resvTime, String status, int staffId, int serviceId, int patientId) {
        this.resvNote = resvNote;
        this.resvDate = resvDate;
        this.resvTime = resvTime;
        this.status = status;
        this.staffId = staffId;
        this.serviceId = serviceId;
        this.patientId = patientId;
    }
    
    public int getResvId() {
        return resvId;
    }

    public void setResvId(int resvId) {
        this.resvId = resvId;
    }

    public String getResvNote() {
        return resvNote;
    }

    public void setResvNote(String resvNote) {
        this.resvNote = resvNote;
    }

    public Date getResvDate() {
        return resvDate;
    }

    public void setResvDate(Date resvDate) {
        this.resvDate = resvDate;
    }

    public String getResvTime() {
        return resvTime;
    }

    public void setResvTime(String resvTime) {
        this.resvTime = resvTime;
    }

    public String getTestResult() {
        return testResult;
    }

    public void setTestResult(String testResult) {
        this.testResult = testResult;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

  

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    @Override
    public String toString() {
        return "Reservation{" + "resvId=" + resvId + ", resvNote=" + resvNote + ", resvDate=" + resvDate + ", resvTime=" + resvTime + ", testResult=" + testResult + ", status=" + status + ", staffId=" + staffId + ", serviceId=" + serviceId + ", patientId=" + patientId + '}';
    }

    
}
