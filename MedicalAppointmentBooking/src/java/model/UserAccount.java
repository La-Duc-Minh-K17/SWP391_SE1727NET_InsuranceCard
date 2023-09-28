    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class UserAccount {
    private int userId;
    private String username;
    private String password;
    private String email;
    private String fullName;
    private int gender;
    private String phone;
    private String image;
    private String confirmationToken;
    private Timestamp confirmationTokenTime;
    private String recoveryToken;
    private Timestamp recoveryTokenTime;
    private int status;
    private Role role;

    public UserAccount() {

    }

    public UserAccount(String username, String email, String fullName, int gender, String phone, String image, int status) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.image = image;
        this.status = status;
    }

    public UserAccount(String username, String password, String email, String fullName, int gender, String phone, String confirmationToken, Timestamp confirmationTokenTime, int status, Role role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.confirmationToken = confirmationToken;
        this.confirmationTokenTime = confirmationTokenTime;
        this.status = status;
        this.role = role;
    }

    public UserAccount(String username, String email, String fullName, int gender, String phone, String image, String confirmationToken, Timestamp confirmationTokenTime, String recoveryToken, Timestamp recoveryTokenTime) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.image = image;
        this.confirmationToken = confirmationToken;
        this.confirmationTokenTime = confirmationTokenTime;
        this.recoveryToken = recoveryToken;
        this.recoveryTokenTime = recoveryTokenTime;

    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getUserName() {
        return username;
    }

    public void setUserName(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public int getStatus() {
        return status;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getRecoveryToken() {
        return recoveryToken;
    }

    public void setRecoveryToken(String recoveryToken) {
        this.recoveryToken = recoveryToken;
    }

    public Timestamp getRecoveryTokenTime() {
        return recoveryTokenTime;
    }

    public void setRecoveryTokenTime(Timestamp recoveryTokenTime) {
        this.recoveryTokenTime = recoveryTokenTime;
    }

    public String getPassword() {
        return password;
    }

    public String getConfirmationToken() {
        return confirmationToken;
    }

    public Timestamp getConfirmationTokenTime() {
        return confirmationTokenTime;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "UserAccount{" + "username=" + username + ", password=" + password + ", email=" + email + ", fullName=" + fullName + ", gender=" + gender + ", phone=" + phone + ", image=" + image + ", confirmationToken=" + confirmationToken + ", confirmationTokenTime=" + confirmationTokenTime + ", recoveryToken=" + recoveryToken + ", recoveryTokenTime=" + recoveryTokenTime + ", status=" + status + ", role=" + role + '}';
    }

}
