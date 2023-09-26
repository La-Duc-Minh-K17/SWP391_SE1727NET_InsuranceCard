/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author Admin
 */
public class ImageProcessing {

    public static String imageString(Blob blob) {
        String base64Image = "";
        InputStream inputStream = null;
        if (blob != null) {
            try {
                inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                try {
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                } catch (IOException ex) {
                    System.out.println(ex);
                }
                byte[] imageBytes = outputStream.toByteArray();
                base64Image = Base64.getEncoder().encodeToString(imageBytes);
                try {
                    inputStream.close();
                    outputStream.close();
                } catch (IOException ex) {
                    System.out.println(ex);
                }

            } catch (SQLException ex) {
            } finally {
                try {
                    inputStream.close();
                } catch (IOException ex) {
                    System.out.println(ex);
                }
            }
        } else {
            base64Image = "default";
        }
        
        return base64Image;
    }
}
