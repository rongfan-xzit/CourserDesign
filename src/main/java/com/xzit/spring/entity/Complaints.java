package com.xzit.spring.entity;


import org.springframework.validation.annotation.Validated;

import java.util.Date;

/**
 *投诉工单
 */
@Validated
public class Complaints {

    //投诉编号
    private String complaintsid;
    //工单编号
    private String workorderid;
    //用户编号
    private String userId;
    //用户账号
    private String name;
    //用户手机号
    private String phone;
//    //投诉内容
//    private String content;
//    //投诉时间
//    private Date time;
    //图片
    private String images;




    public String getComplaintsid() {
        return complaintsid;
    }

    public void setComplaintsid(String complaintsid) {
        this.complaintsid = complaintsid;
    }

    public String getWorkorderid() {
        return workorderid;
    }

    public void setWorkorderid(String workorderid) {
        this.workorderid = workorderid;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

//    public String getContent() {
//        return content;
//    }
//
//    public void setContent(String content) {
//        this.content = content;
//    }
//
//    public Date getTime() {
//        return time;
//    }
//
//    public void setTime(Date time) {
//        this.time = time;
//    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
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
}
