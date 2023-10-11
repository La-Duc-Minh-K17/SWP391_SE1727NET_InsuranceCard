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

    private int blog_category_id;
    private String name;
    private String description;
    private int status;
    private int setting_id;

    public Blog_Category() {

    }
    public Blog_Category(int blog_category_id, String name) {
        this.blog_category_id = blog_category_id;
        this.name = name;
    }
    public Blog_Category(int blog_category_id, String name, String description, int status, int setting_id) {
        this.blog_category_id = blog_category_id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.setting_id = setting_id;
    }

    public Blog_Category(int categoryId, String categoryName) {
        this.blog_category_id = categoryId;
        this.name = categoryName;
    }

    public int getBlog_category_id() {
        return blog_category_id;
    }

    public void setBlog_category_id(int blog_category_id) {
        this.blog_category_id = blog_category_id;
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
