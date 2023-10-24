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
  
    private Service service;
    private Patient patient;

    public Reservation() {
    }

    public Reservation(String resvNote, Date resvDate, String resvTime, String status, Service service , Patient patient) {
        this.resvNote = resvNote;
        this.resvDate = resvDate;
        this.resvTime = resvTime;
        this.status = status;
        this.service = service;
        this.patient = patient;
    }

    public Reservation(int resvId, String resvNote, Date resvDate, String resvTime, String testResult, String status, Service service , Patient patient) {
        this.resvId = resvId;
        this.resvNote = resvNote;
        this.resvDate = resvDate;
        this.resvTime = resvTime;
        this.testResult = testResult;
        this.status = status;
        this.service = service;
        this.patient = patient;
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

 
    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    

  
}
