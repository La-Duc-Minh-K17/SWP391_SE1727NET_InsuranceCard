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
   
    private Doctor doctor;
    private Patient patient;

    public Appointment() {
    }

    public Appointment(String apptNote, Date apptDate, String apptTime, String status, Doctor doctor, Patient patient) {
        this.apptNote = apptNote;
        this.apptDate = apptDate;
        this.apptTime = apptTime;
        this.status = status;
        this.doctor = doctor;
        this.patient = patient;
    }

    public Appointment(int apptId, String apptNote, Date apptDate, String apptTime, String diagnosis, String status, Doctor doctor, Patient patient) {
        this.apptId = apptId;
        this.apptNote = apptNote;
        this.apptDate = apptDate;
        this.apptTime = apptTime;
        this.diagnosis = diagnosis;
        this.status = status;
        this.doctor = doctor;
        this.patient = patient;
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

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
   
    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Override
    public String toString() {
        return "Appointment{" + "apptId=" + apptId + ", apptNote=" + apptNote + ", apptDate=" + apptDate + ", apptTime=" + apptTime + ", diagnosis=" + diagnosis + ", status=" + status + ", doctor=" + doctor + ", patient=" + patient + '}';
    } 
}
