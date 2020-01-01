package com.xzit.spring.entity;

public class Staff {
    private String workId;
    private String type;
    private String name;
    private String phone;
    private String sex;
    private String age;
    private Integer userInfoId;
    public Staff() {
    }

    public Staff(String workId, String type, String name, String phone, String sex, String age, Integer userInfoId) {
        this.workId = workId;
        this.type = type;
        this.name = name;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.userInfoId = userInfoId;
    }

    public Staff(String workId, String type, String name, String phone, String sex, String age) {
        this.workId = workId;
        this.type = type;
        this.name = name;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
    }

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

}
