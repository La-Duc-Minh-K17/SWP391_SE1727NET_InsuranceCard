/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configs;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;

/**
 *
 * @author Admin
 */
public class CodeProcessing {

    private static final SecureRandom secureRandom = new SecureRandom(); //threadsafe
    private static final Base64.Encoder base64Encoder = Base64.getUrlEncoder(); //threadsafe

    public CodeProcessing() {
    }

    public static String generateNewToken() {
        byte[] randomBytes = new byte[16];
        secureRandom.nextBytes(randomBytes);
        return base64Encoder.encodeToString(randomBytes);
    }

    public static String encode(String s) {
        byte data[] = s.getBytes(StandardCharsets.UTF_8);
        String str = Base64.getEncoder().encodeToString(data);
        return str;

    }

    public static String deCode(String s) {
        byte[] decodedBytes = Base64.getDecoder().decode(s);
        String str = new String(decodedBytes);
        return str;
    }

}
