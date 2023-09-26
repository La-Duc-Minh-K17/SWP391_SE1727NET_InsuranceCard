/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class TextProcessing {

    public static String getClobString(Clob clob) {
        BufferedReader stringReader = null;
        try {
            stringReader = new BufferedReader(clob.getCharacterStream());
            String singleLine = null;
            StringBuffer strBuff = new StringBuffer();
            while ((singleLine = stringReader.readLine()) != null) {
                strBuff.append(singleLine);
            }
            return strBuff.toString();
        } catch (IOException | SQLException ex) {
            System.out.println(ex);
        } finally {
            try {
                stringReader.close();
            } catch (IOException ex) {
                Logger.getLogger(TextProcessing.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
}
