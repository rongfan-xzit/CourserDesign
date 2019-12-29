package com.xzit.spring.mapper;

import com.xzit.spring.entity.Permission;

import java.util.List;
import java.util.Map;

public interface PermissionMapper {
    public List<Permission> getSysPermissionByRoleId(String role_id);
    public List<Permission> getAll();
    List<Map<String,Object>> getsyspermissiontreebyroleid(String role_id);
}
