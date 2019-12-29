package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Role;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.mapper.RoleMapper;
import com.xzit.spring.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        return roleMapper.findAll();
    }

    @Override
    public PageInfo<Role> pageSelect(Role role, Integer pageNo, Integer pageSize) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Role> roleAll = roleMapper.findAll();
        PageInfo<Role> page = new PageInfo<>(roleAll);
        return page;
    }
}
