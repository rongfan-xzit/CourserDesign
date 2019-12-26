package com.xzit.spring.mapper;

import com.xzit.spring.entity.Permission;

import java.util.List;

public interface PermissionMapper {
    public List<Permission> getSysPermissionByRoleId(String role_id);
}
