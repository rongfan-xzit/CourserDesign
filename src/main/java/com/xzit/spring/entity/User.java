package com.xzit.spring.entity;

public class User {
    private String userId;
    private String name;
    private String phone;
    private String sex;
    private Integer age;
    private String password;
    private String address;
    private String roleId;

    public User(String userId, String name, String phone, String sex, Integer age, String password, String address) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.password = password;
        this.address = address;
    }

    public User() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
