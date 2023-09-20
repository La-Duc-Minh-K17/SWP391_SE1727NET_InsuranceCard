/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Account;

/**
 *
 * @author DELL
 */
public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        return String.format("%06d", number);
    }
    
    public boolean sendEmail(Account account) {
        boolean test = false;
        
        String toEmail = account.getEmail();
        String fromEmail = "minhcat3@gmail.com";
        String password = "fsmmegdntxszeatk";
        
        System.out.println(account.getEmail());
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.mail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            
            //
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                   return new PasswordAuthentication(fromEmail,password); 
                }
            });
            
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("User Email Verification.");
            mess.setSentDate(new Date());
            mess.setContent(mess, "text/html; charset=UTF-8");
                Transport.send(mess);
            
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}
