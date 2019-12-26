package com.xzit.spring.service;

import com.xzit.spring.entity.Permission;

import java.util.List;

public interface PermissionService {
    public List<Permission> getSysPermissionByRoleId(String role_id);
}
