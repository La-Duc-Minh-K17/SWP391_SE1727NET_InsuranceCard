/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configs;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.UUID;

/**
 *
 * @author Admin
 */
public class CodeProcessing {

    public CodeProcessing() {
    }

    private static final SecureRandom secureRandom = new SecureRandom();

    public static String generateToken() {
        byte[] tokenBytes = new byte[32];
        secureRandom.nextBytes(tokenBytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
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
