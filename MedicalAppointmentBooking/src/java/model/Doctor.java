/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Doctor extends UserAccount {

    private int doctorId;
    private String speciality;
    private String position;
    private String description;
    
    public Doctor() {
        
    }
    public Doctor(int doctorId, String position, String speciality, String description, String username, String email, String fullName, int gender, String phone, String image, int status) {
        super(username, email, fullName, gender, phone, image, status);
        this.doctorId = doctorId;
        this.speciality = speciality;
        this.position = position;
        this.description = description;
    }       
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctorId=" + doctorId + ", speciality=" + speciality + ", position=" + position + ", description=" + description + '}';
    }

}
