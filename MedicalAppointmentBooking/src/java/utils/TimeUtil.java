/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class TimeUtil {

    private final int OTP_EXPIRY_TIME = 3;

    public static Time sqlTime(String time) {
        Time sqlTime = Time.valueOf(time);
        return sqlTime;
    }

    public static LocalDateTime stringToLocalDateTime(String dateString) {
        try {
            String formatPattern = "yyyy-MM-dd'T'HH:mm:ss";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formatPattern);

            // Parse the string into a LocalDateTime object
            LocalDateTime localDateTime = LocalDateTime.parse(dateString, formatter);

            return localDateTime;
        } catch (Exception e) {
            // Handle parsing exceptions, e.g., invalid date format
            e.printStackTrace();
            return null; // Return null or throw an exception as needed
        }
    }

    public static String sqlDateToString(Date sqlDate) {
        try {
            String formatPattern = "yyyy-MM-dd";
            SimpleDateFormat sdf = new SimpleDateFormat(formatPattern);
            return sdf.format(sqlDate);
        } catch (Exception e) {
            // Handle any potential exceptions here
            e.printStackTrace();
            return null; // You can return null or handle exceptions as needed
        }
    }

    public static java.sql.Date dateConverter(String dateString) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date utilDate = dateFormat.parse(dateString);
            return new java.sql.Date(utilDate.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(TimeUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static java.sql.Date dateConverter1(String dateString) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = dateFormat.parse(dateString);
            return new java.sql.Date(utilDate.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(TimeUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Timestamp getNow() {
        long createdTimeMillis = System.currentTimeMillis();
        Timestamp createdTimeTimeStamp = new Timestamp(createdTimeMillis);
        return createdTimeTimeStamp;
    }

    public boolean isExpired(Timestamp createdTime) {
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        long diffTime = currentTimestamp.getTime() - createdTime.getTime();
        return (diffTime > OTP_EXPIRY_TIME * 60 * 1000);
    }

}
