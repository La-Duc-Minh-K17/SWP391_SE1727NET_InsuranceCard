/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class TimestampUtils {
    private final double OTP_EXPIRY_TIME = 1;
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
