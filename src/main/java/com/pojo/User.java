package com.pojo;

import com.utils.AESUtils;

import java.sql.Timestamp;

public class User {
    private long userId;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userPassword1;
    private String decryptUserPassword;
    private Timestamp userCreateTime;
    private Timestamp userUpdateTime;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Timestamp getUserCreateTime() {
        return userCreateTime;
    }

    public void setUserCreateTime(Timestamp userCreateTime) {
        this.userCreateTime = userCreateTime;
    }

    public Timestamp getUserUpdateTime() {
        return userUpdateTime;
    }

    public void setUserUpdateTime(Timestamp userUpdateTime) {
        this.userUpdateTime = userUpdateTime;
    }

    public String getUserPassword1() {
        return userPassword1;
    }

    public void setUserPassword1(String userPassword1) {
        this.userPassword1 = userPassword1;
    }

    public String getDecryptUserPassword() {
        return AESUtils.aesDecode(userPassword);
    }

    public void setDecryptUserPassword(String decryptUserPassword) {
        this.decryptUserPassword = decryptUserPassword;
    }
}
