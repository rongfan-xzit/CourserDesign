package com.xzit.spring.service;

import com.xzit.spring.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PermissionService {
    public List<Permission> getSysPermissionByRoleId(String role_id);
    public List<Permission> getAll();
    List<Map<String,Object>> getsyspermissiontreebyroleid(String role_id);
    void deletePerByRoleId(String role_id);
    public void updatePermissionByRoleId(@Param("role_id") String role_id, @Param("permission_id") List<Object> permission_id);
}
