/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class Blog_Category {
    int ID;
    String name;
    String description;
    String status;
    int setting_id;

    @Override
    public String toString() {
        return "Blog_Category{" + "ID=" + ID + ", name=" + name + ", description=" + description + ", status=" + status + ", setting_id=" + setting_id + '}';
    }

    public Blog_Category(int ID, String name, String description, String status, int setting_id) {
        this.ID = ID;
        this.name = name;
        this.description = description;
        this.status = status;
        this.setting_id = setting_id;
    }

    public Blog_Category() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }
    
}
