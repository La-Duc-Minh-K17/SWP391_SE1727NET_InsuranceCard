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
public class Appointment {

    private int apptId;
    private String apptNote;
    private Date apptDate;
    private String apptTime;
    private String diagnosis;
    private String status;
    private int staffId;
    private int doctorId;
    private int patientId;

    public Appointment() {
    }

    public Appointment(String apptNote, Date apptDate, String apptTime, String status, int staffId, int doctorId, int patientId) {
        this.apptNote = apptNote;
        this.apptDate = apptDate;
        this.apptTime = apptTime;
        this.status = status;
        this.staffId = staffId;
        this.doctorId = doctorId;
        this.patientId = patientId;
    }

    public int getApptId() {
        return apptId;
    }

    public void setApptId(int apptId) {
        this.apptId = apptId;
    }

    public String getApptNote() {
        return apptNote;
    }

    public void setApptNote(String apptNote) {
        this.apptNote = apptNote;
    }

    public Date getApptDate() {
        return apptDate;
    }

    public void setApptDate(Date apptDate) {
        this.apptDate = apptDate;
    }

    public String getApptTime() {
        return apptTime;
    }

    public void setApptTime(String apptTime) {
        this.apptTime = apptTime;
    }

    

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

   

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

}
