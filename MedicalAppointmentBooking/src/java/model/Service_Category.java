/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Service_Category {
    private int sc_id;
    private String name;
    private String description;
    private int status;
    private int setting_id;

    public Service_Category() {
    }

    public Service_Category(String name, String description, int status, int setting_id) {
        this.name = name;
        this.description = description;
        this.status = status;
        this.setting_id = setting_id;
    }


    public Service_Category(int sc_id, String name, String description, int status, int setting_id) {
        this.sc_id = sc_id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.setting_id = setting_id;
    }

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

}