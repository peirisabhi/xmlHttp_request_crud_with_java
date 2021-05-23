package com.zonebecreations.javawebeecoodingexam.dto;

public class User {
    int id;
    String fname;
    String lname;
    String nic;
    String mobile;


    public User(int id, String fname, String lname, String nic, String mobile) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.nic = nic;
        this.mobile = mobile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
