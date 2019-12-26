package com.xzit.spring.service.impl;

import com.xzit.spring.entity.Permission;
import com.xzit.spring.mapper.PermissionMapper;
import com.xzit.spring.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public List<Permission> getSysPermissionByRoleId(String role_id) {
        return permissionMapper.getSysPermissionByRoleId(role_id);
    }
}
