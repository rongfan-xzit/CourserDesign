package com.xzit.spring.service.impl;

import com.xzit.spring.entity.Permission;
import com.xzit.spring.mapper.PermissionMapper;
import com.xzit.spring.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public List<Permission> getSysPermissionByRoleId(String role_id) {
        return permissionMapper.getSysPermissionByRoleId(role_id);
    }

    @Override
    public List<Permission> getAll() {
        return permissionMapper.getAll();
    }

    @Override
    public List<Map<String, Object>> getsyspermissiontreebyroleid(String role_id) {
        return permissionMapper.getsyspermissiontreebyroleid(role_id);
    }

    @Override
    public void deletePerByRoleId(String role_id) {
        permissionMapper.deletePerByRoleId(role_id);
    }

    @Override
    public void updatePermissionByRoleId(String role_id, List<Object> permission_id) {
        permissionMapper.updatePermissionByRoleId(role_id,permission_id);
    }
}
