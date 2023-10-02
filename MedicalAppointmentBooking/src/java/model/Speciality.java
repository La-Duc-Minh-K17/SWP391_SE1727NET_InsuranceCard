/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Speciality {
    public int specialityId;
    public String speName;
    public String speDescription;
    public boolean speStatus;

    public Speciality(int specialityId, String speName, String speDescription, boolean speStatus) {
        this.specialityId = specialityId;
        this.speName = speName;
        this.speDescription = speDescription;
        this.speStatus = speStatus;
    }

    public int getSpecialityId() {
        return specialityId;
    }

    public void setSpecialityId(int specialityId) {
        this.specialityId = specialityId;
    }

    public String getSpeName() {
        return speName;
    }

    public void setSpeName(String speName) {
        this.speName = speName;
    }

    public String getSpeDescription() {
        return speDescription;
    }

    public void setSpeDescription(String speDescription) {
        this.speDescription = speDescription;
    }

    public boolean isSpeStatus() {
        return speStatus;
    }

    public void setSpeStatus(boolean speStatus) {
        this.speStatus = speStatus;
    }
    
}
