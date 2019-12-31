package com.xzit.spring.dto;

import com.xzit.spring.entity.Account;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Validated
public class StaffDto extends Account {
    @NotNull
    private String workId;
    private String type;
    @Pattern(regexp = "^[\\u4e00-\\u9fa5]{0,}$",message = "姓名必须为中文")
    private String name;
    @Pattern(regexp = "^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$",message = "手机号格式不正确")
    private String phone;
    private String sex;
    @Pattern(regexp = "^[0-9]*$",message = "年龄要是数字")
    private String age;
    private Integer userInfoId;

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

    @Override
    public Integer getUserInfoId() {
        return userInfoId;
    }

    @Override
    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }
}
