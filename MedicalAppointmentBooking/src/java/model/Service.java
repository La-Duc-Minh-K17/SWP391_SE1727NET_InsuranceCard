/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Service {
    private int service_id;
    private String service_name;
    private String service_description;
    private String service_details;
    private int fee;
    private String service_image;
    private int service_status;
    private int catetegory_id;

    public Service( String service_name, String service_description, String service_details,  String service_image ) {
        this.service_name = service_name;
        this.service_description = service_description;
        this.service_details = service_details;
        this.service_image = service_image;
    }

   public Service(int service_id, String service_name, String service_description, String service_details, int fee, String service_image, int service_status, int category_id) {
        this.service_id = service_id;
        this.service_name = service_name;
        this.service_description = service_description;
        this.service_details = service_details;
        this.fee = fee;
        this.service_image = service_image;
        this.service_status = service_status;
        this.catetegory_id = category_id;
    }

    public Service() {
        
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public String getService_description() {
        return service_description;
    }

    public void setService_description(String service_description) {
        this.service_description = service_description;
    }

    public String getService_details() {
        return service_details;
    }

    public void setService_details(String service_details) {
        this.service_details = service_details;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getService_image() {
        return service_image;
    }

    public void setService_image(String service_image) {
        this.service_image = service_image;
    }

    public int getService_status() {
        return service_status;
    }

    public void setService_status(int service_status) {
        this.service_status = service_status;
    }

    public int getCatetegory_id() {
        return catetegory_id;
    }

    public void setCatetegory_id(int catetegory_id) {
        this.catetegory_id = catetegory_id;
    }


    @Override
    public String toString() {
        return "Services{" + "service_id=" + service_id + ", service_name=" + service_name + ", service_description=" + service_description + ", service_details=" + service_details + ", fee=" + fee + ", service_image=" + service_image + ", service_status=" + service_status + ", catetegory_id=" + catetegory_id + '}';
    }
   
}