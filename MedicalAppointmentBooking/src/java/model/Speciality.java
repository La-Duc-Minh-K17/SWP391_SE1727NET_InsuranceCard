/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Speciality {
    private int id;
    private String speName;
    private String speDescription;
    private int speStatus;

    public Speciality(int id, String speName, String speDescription, int speStatus) {
        this.id = id;
        this.speName = speName;
        this.speDescription = speDescription;
        this.speStatus = speStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getSpeStatus() {
        return speStatus;
    }

    public void setSpeStatus(int speStatus) {
        this.speStatus = speStatus;
    }
    
    
}
