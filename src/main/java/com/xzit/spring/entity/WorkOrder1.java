package com.xzit.spring.entity;


import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 *工单
 */
@Validated
public class WorkOrder1 {

//    @NotNull
    //工单编号
    private String workorderid;
    //用户账户编号
    private String userid;
    //订单编号
    private String orderId;
    //问题描述
    private String question;
    //员工编号(需派人处理的员工编号)
    private String staffid;
    //保修卡编号
    private String aftersalecardid;
    //手机号
    private String phone;
    //用户填写地址
    private String address;
    //用户图片路径
    private String imagePath;
    /**
     *问题类型
     */
    private String questionType;
    //用户发起时间
    private Date questionDate;
    /**
     *支付方式
     */
    private String paymethod;
    //支付金额
    private Double payment;
    //是否需要派人上门维修 0表示需要 1 表示不需要
    private String status;
    //预约处理时间
    private String appointment;
    //检查后的结果 0表示检查完成  1表示带检查
    private String checkResult;
    //是否需要耗材 0 表示需要1 不需要
    private String consumables;
    //耗材编号
    private int consumableId;


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getWorkorderid() {
        return workorderid;
    }

    public void setWorkorderid(String workorderid) {
        this.workorderid = workorderid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getAftersalecardid() {
        return aftersalecardid;
    }

    public void setAftersalecardid(String aftersalecardid) {
        this.aftersalecardid = aftersalecardid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public Date getQuestionDate() {
        return questionDate;
    }

    public void setQuestionDate(Date questionDate) {
        this.questionDate = questionDate;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }

    public String getConsumables() {
        return consumables;
    }

    public void setConsumables(String consumables) {
        this.consumables = consumables;
    }

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public String getAppointment() {
        return appointment;
    }

    public void setAppointment(String appointment) {
        this.appointment = appointment;
    }

    public int getConsumableId() {
        return consumableId;
    }

    public void setConsumableId(int consumableId) {
        this.consumableId = consumableId;
    }

}
