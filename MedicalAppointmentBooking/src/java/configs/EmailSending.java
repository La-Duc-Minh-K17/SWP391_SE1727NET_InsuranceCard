/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configs;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.UserAccount;

/**
 *
 * @author Admin
 */
public class EmailSending {

    public static final String EMAILSENDER = "bestshoesvietnam@gmail.com";
    public static final String PASSWORDSENDER = "vnrzcqpntzjbzaog";

    public static void sendEmail(String emailTo, String subject, String msg) {

        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true"); //TLS

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAILSENDER, PASSWORDSENDER);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(EMAILSENDER));
            mess.addRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
            mess.setSubject("User Email Verification.");
            mess.setSentDate(new Date());
            mess.setContent(msg, "text/html; charset=UTF-8");
            Transport.send(mess);

        } catch (MessagingException ex) {
            System.out.println(ex);
        }

    }

    public static void sendRecoverAccount(String urlLink, String emailTo) {
        String subject = "[MABS] ACCOUNT RECOVERY";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "    \n"
                + "</head>\n"
                + "\n"
                + "    <body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #f2f3f8;\" leftmargin=\"0\">\n"
                + "        <!--100% body table-->\n"
                + "        <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" \n"
                + "            style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); \n"
                + "                    font-family: 'Open Sans', sans-serif;\">\n"
                + "            <tr>\n"
                + "                <td>\n"
                + "                    <table style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\" width=\"100%\"  cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                        <tr>\n"
                + "                            <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                        </tr>\n"
                + "                       \n"
                + "                        <tr>\n"
                + "                            <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                        </tr>\n"
                + "                        <tr>\n"
                + "                            <td>\n"
                + "                                <table width=\"95%\" cellpadding=\"0\" cellspacing=\"0\"\n"
                + "                                    style=\"max-width:670px;\n"
                + "                                           background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\n"
                + "                                    <tr>\n"
                + "                                        <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                    </tr>\n"
                + "                                    <tr>\n"
                + "                                           <td style=\"padding:0 35px;\">\n"
                + "                                            <h1\n"
                + "                                                style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;\">\n"
                + "                                                You have\n"
                + "                                                requested to reset your password</h1>\n"
                + "                                            <span\n"
                + "                                                style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\n"
                + "                                            <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0;\">\n"
                + "                                                We cannot simply send you your old password. A unique link to reset your\n"
                + "                                                password has been generated for you. To reset your password, click the\n"
                + "                                                following link and follow the instructions.\n"
                + "                                            </p>\n"
                + "                                            <a href=\" " + urlLink + "\"\n"
                + "                                                style=\"background:#2054e2;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:50px;\">Reset\n"
                + "                                                Password</a>\n"
                + "                                        </td>\n"
                + "                                    </tr>\n"
                + "                                    <tr>\n"
                + "                                        <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                    </tr>\n"
                + "                                </table>\n"
                + "                            </td>\n"
                + "                        <tr>\n"
                + "                            <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                        </tr>\n"
                + "                        <tr>\n"
                + "                            <td style=\"text-align:center;\">\n"
                + "                                <p\n"
                + "                                    style=\"font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;\">\n"
                + "                                    &copy; <strong>www.FPTU_RoyalClinic.com</strong></p>\n"
                + "                            </td>\n"
                + "                        </tr>\n"
                + "                        <tr>\n"
                + "                            <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                        </tr>\n"
                + "                    </table>\n"
                + "                </td>\n"
                + "            </tr>\n"
                + "        </table>\n"
                + "        <!--/100% body table-->\n"
                + "  \n"
                + "</body>\n"
                + "\n"
                + "</html>";
        EmailSending.sendEmail(emailTo, subject, message);
    }

    public static void sendVerificationMail(UserAccount user, String url, String emailTo) {
        String subject = "[MABS] ACCOUNT CONFIRMATION";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "    <!-- Head content can be added here -->\n"
                + "</head>\n"
                + "\n"
                + "<body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #f2f3f8;\" leftmargin=\"0\">\n"
                + "    <!-- 100% body table -->\n"
                + "    <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;\">\n"
                + "        <tr>\n"
                + "            <td>\n"
                + "                <table style=\"background-color: #f2f3f8; max-width:670px; margin:0 auto;\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                    <tr>\n"
                + "                        <td>\n"
                + "                            <table width=\"95%\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:670px; background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\n"
                + "                                <tr>\n"
                + "                                    <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                </tr>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"padding:0 35px;\">\n"
                + "                                        <h1 style=\"color:#2727d4; font-weight:500;  font-size:32px; font-family:'Rubik',sans-serif;\">\n"
                + "                                            Welcome to MABS, " + user.getFullName() + "!\n"
                + "                                        </h1>\n"
                + "                                        <span style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\n"
                + "                                        <p style=\"color:#455056; font-size:15px; line-height:24px; margin:0;\">\n"
                + "                                            Your account is almost ready. Please confirm your account.\n"
                + "                                        </p>\n"
                + "                                        <a href=\" " + url + "\" style=\"background:#e27720; text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff; text-transform:uppercase; font-size:14px; padding:10px 24px; display:inline-block; border-radius:50px;\">\n"
                + "                                            Confirm Account\n"
                + "                                        </a>\n"
                + "                                        <p style=\"padding-top :20px;color:#455056; font-size:15px; line-height:24px; margin:0;\">If clicking the button doesn't seem to work ,you can copy and paste the following link into the browser.</p>\n"
                + "                                        <a href=\" " + url + "\" style=\"color:#e27720;\">"+ url+"</a>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"height:40px;\">&nbsp;</td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    <tr>\n"
                + "                        <td style=\"height:20px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                    \n"
                + "                    <tr>\n"
                + "                        <td style=\"height:80px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "                </table>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "    <!-- /100% body table -->\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        EmailSending.sendEmail(emailTo, subject, message);
    }

}
