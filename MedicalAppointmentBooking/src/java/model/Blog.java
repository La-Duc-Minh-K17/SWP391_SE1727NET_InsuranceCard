/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class Blog {

    private int blog_id;
    private String title;
    private String description;
    private String content;
    private String image;
    private int blog_category_id;
    private Date created_time;
    private Date update_time;

    public Blog() {
    }

    public Blog(int blog_id, String title, String description, String content, int blog_category_id, Date created_time) {
        this.blog_id = blog_id;
        this.title = title;
        this.description = description;
        this.content = content;
        this.blog_category_id = blog_category_id;
        this.created_time = created_time;
    }

    public Blog(int blog_id, String title, String description, String content, String image, int blog_category_id, Date created_time) {
        this.blog_id = blog_id;
        this.title = title;
        this.description = description;
        this.content = content;
        this.image = image;
        this.blog_category_id = blog_category_id;
        this.created_time = created_time;
    }

    public Blog(int blog_id, String title, String description, String content, String image, int blog_category_id, Date created_time, Date update_time) {
        this.blog_id = blog_id;
        this.title = title;
        this.description = description;
        this.content = content;
        this.image = image;
        this.blog_category_id = blog_category_id;
        this.created_time = created_time;
        this.update_time = update_time;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getBlog_category_id() {
        return blog_category_id;
    }

    public void setBlog_category_id(int blog_category_id) {
        this.blog_category_id = blog_category_id;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

}
