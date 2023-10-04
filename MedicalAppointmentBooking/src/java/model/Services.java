/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Services {
    private String name;
    private String description;
    private String details;
    private int fee;
    private String serviceImage;
    private boolean status;
    private int catetegory_Id;

    public Services() {
    }

    
    public Services(String name, String description, String details, int fee, String serviceImage, boolean status, int catetegory_Id) {
        this.name = name;
        this.description = description;
        this.details = details;
        this.fee = fee;
        this.serviceImage = serviceImage;
        this.status = status;
        this.catetegory_Id = catetegory_Id;
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

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getServiceImage() {
        return serviceImage;
    }

    public void setServiceImage(String serviceImage) {
        this.serviceImage = serviceImage;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCatetegory_Id() {
        return catetegory_Id;
    }

    public void setCatetegory_Id(int catetegory_Id) {
        this.catetegory_Id = catetegory_Id;
    }
    
    
}
