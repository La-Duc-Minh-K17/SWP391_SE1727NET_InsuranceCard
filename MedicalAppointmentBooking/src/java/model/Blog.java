/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;



public class Blog {
    int ID;
    int category_id;
    String title;
    Date created_time;
    String content;
    String script;
    String image;

    @Override
    public String toString() {
        return "Blog{" + "ID=" + ID + ", category_id=" + category_id + ", title=" + title + ", created_time=" + created_time + ", content=" + content + ", script=" + script + ", image=" + image + '}';
    }

    public Blog(int ID, int category_id, String title, Date created_time, String content, String script, String image) {
        this.ID = ID;
        this.category_id = category_id;
        this.title = title;
        this.created_time = created_time;
        this.content = content;
        this.script = script;
        this.image = image;
    }

    public Blog() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
    
}
