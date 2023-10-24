/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class DoctorSchedule {
    private int scheduleId;
    private Date date;
    private String dayOfWeek;
    private String slotTime;
    private int isOff;

    public DoctorSchedule() {
    }
    
    
    public DoctorSchedule(int scheduleId, Date date, String dayOfWeek, String slotTime, int isOff) {
        this.scheduleId = scheduleId;
        this.date = date;
        this.dayOfWeek = dayOfWeek;
        this.slotTime = slotTime;
        this.isOff = isOff;
    }
    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
    }

    public int getIsOff() {
        return isOff;
    }

    public void setIsOff(int isOff) {
        this.isOff = isOff;
    }

    @Override
    public String toString() {
        return "DoctorSchedule{" + "scheduleId=" + scheduleId + ", date=" + date + ", dayOfWeek=" + dayOfWeek + ", slotTime=" + slotTime + ", isOff=" + isOff + '}';
    }
    
    
}
