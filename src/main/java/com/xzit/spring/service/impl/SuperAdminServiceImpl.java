package com.xzit.spring.service.impl;

import com.xzit.spring.entity.SuperAdmin;
import com.xzit.spring.mapper.SuperAdminMapper;
import com.xzit.spring.service.SuperAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SuperAdminServiceImpl implements SuperAdminService {
    @Autowired
    private SuperAdminMapper superAdminMapper;

    @Override
    public SuperAdmin findUserBy(String userId, String password) {
        return superAdminMapper.findUserBy(userId,password);
    }
}
