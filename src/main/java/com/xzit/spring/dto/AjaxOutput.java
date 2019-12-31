package com.xzit.spring.dto;

import org.springframework.validation.ObjectError;

import java.io.Serializable;
import java.util.List;

public class AjaxOutput implements Serializable {
    /**
     * 返回客户端统一格式，包括状消息键，提示信息，以及业务数据
     */
    private static final long serialVersionUID = 1L;
    //消息键
    private String msgkey;
    //必要的提示信息
    private String message;
    private Object data;

    public AjaxOutput() {
    }

    public AjaxOutput(String msgkey, String message, Object data) {
        this.msgkey = msgkey;
        this.message = message;
        this.data = data;
    }

    //setter/getter方法

    public String getMsgkey() {
        return msgkey;
    }

    public void setMsgkey(String msgkey) {
        this.msgkey = msgkey;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}