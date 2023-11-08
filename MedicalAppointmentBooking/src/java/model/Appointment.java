/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author Admin
 */
public class Appointment {

    private int apptId;
    private String apptNote;
    private String rescheduleReason;
    private String rejectReason;
    private Date apptDate;
    private String apptTime;
    private String diagnosis;
    private double otherCharge;
    private String status;
    private Timestamp createdTime;
    private Timestamp updatedTime;
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

    public String getRescheduleReason() {
        return rescheduleReason;
    }

    public void setRescheduleReason(String rescheduleReason) {
        this.rescheduleReason = rescheduleReason;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public double getOtherCharge() {
        return otherCharge;
    }

    public void setOtherCharge(double otherCharge) {
        this.otherCharge = otherCharge;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp created_time) {
        this.createdTime = created_time;
    }

    public Timestamp getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Timestamp updated_time) {
        this.updatedTime = updated_time;
    }

    public boolean checkNoticePeriod() {

        LocalDate apptLocalDate = apptDate.toLocalDate();
        String[] timeParts = apptTime.split(":");
        int hour = Integer.parseInt(timeParts[0]);
        int minute = Integer.parseInt(timeParts[1]);
        LocalTime apptLocalTime = LocalTime.of(hour, minute);
        LocalDateTime apptLocalDateTime = apptLocalDate.atTime(apptLocalTime);
        LocalDateTime twentyFourHoursBefore = apptLocalDateTime.minus(24, ChronoUnit.HOURS);
        LocalDateTime currentDateTime = LocalDateTime.now();
        if (currentDateTime.isBefore(twentyFourHoursBefore)) {
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "Appointment{" + "apptId=" + apptId + ", apptNote=" + apptNote + ", rescheduleReason=" + rescheduleReason + ", rejectReason=" + rejectReason + ", apptDate=" + apptDate + ", apptTime=" + apptTime + ", diagnosis=" + diagnosis + ", otherCharge=" + otherCharge + ", status=" + status + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + ", doctor=" + doctor + ", patient=" + patient + '}';
    }

}
