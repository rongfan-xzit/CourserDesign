package com.xzit.spring.dto;

import com.xzit.spring.entity.Staff;

public class StaffAccount extends Staff {
    private String roleId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
