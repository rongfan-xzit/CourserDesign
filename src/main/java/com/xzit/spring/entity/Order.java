package com.xzit.spring.entity;


import org.springframework.validation.annotation.Validated;

import java.util.Date;

/**
 *订单
 */
@Validated
public class Order {

    //订单编号
    private String OrderId;

    //用户编号
    private String userId;

    //商品编号
    private String goodsId;

    //购买日期
    private Date time;

    //数量
    private int number;

    //总金额
    private Double money;


    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String orderId) {
        OrderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}
