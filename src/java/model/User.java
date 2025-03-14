/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class User {

    String fullName;
    String email;
    String password;
    String role;
    String phone;
    String address;

    public User() {
    }

    public User(String fullName, String email, String password, String role, String phone, String address) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        if (role.equals("Owner")) {
            return "Chủ phương tiện";
        } else if (role.equals("Inspector")) {
            return "Công nhân";
        } else if (role.equals("Station")) {
            return "Cơ sở kiểm định";
        } else if (role.equals("Police")) {
            return "Cảnh sát";
        } else {
            return "Lỗi";
        }
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
