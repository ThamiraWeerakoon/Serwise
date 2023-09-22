package com.CS01.SerWise.Controllers;

public class passwordHashGenerate {

    public String hashedPassword;
    public byte[] salt;

    passwordHashGenerate(String hashedPassword, byte[] salt) {
        this.hashedPassword = hashedPassword;
        this.salt = salt;
    }

}
