/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class Calendar {

    private String title;
    private String start;
    private String url;
    private String backgroundColor;
    private String borderColor;
    private String textColor;

    public Calendar(Appointment appt) {
        this.title = "Dr." + appt.getDoctor().getFullName();
        String date = TimeUtil.sqlDateToString(appt.getApptDate()) + "T" + appt.getApptTime();
        this.start = date;
        if (TimeUtil.stringToLocalDateTime(date).isBefore(LocalDateTime.now())) {
            this.backgroundColor = "lightgray";
            this.borderColor = "gray";
            this.textColor = "red   ";
        } else {
            this.backgroundColor = "#28a745";
            this.borderColor = "#28a745";
            this.textColor = "white";
        }
    }

    public Calendar(Reservation resv) {
        this.title = "Service:." + resv.getService().getService_name();
        String date = TimeUtil.sqlDateToString(resv.getResvDate()) + "T" + resv.getResvTime();
        this.start = date;
        if (TimeUtil.stringToLocalDateTime(date).isBefore(LocalDateTime.now())) {
            this.backgroundColor = "lightgray";
            this.borderColor = "gray";
            this.textColor = "red";
        } else {
            this.backgroundColor = "#28a745";
            this.borderColor = "#28a745";
            this.textColor = "white";
        }
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(String backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public String getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(String borderColor) {
        this.borderColor = borderColor;
    }

    public String getTextColor() {
        return textColor;
    }

    public void setTextColor(String textColor) {
        this.textColor = textColor;
    }

    @Override
    public String toString() {
        return "Calendar{" + "title=" + title + ", start=" + start + ", url=" + url + ", backgroundColor=" + backgroundColor + ", borderColor=" + borderColor + ", textColor=" + textColor + '}';
    }

}
