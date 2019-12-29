package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAll();
    PageInfo<Role> pageSelect(Role role, Integer pageNo, Integer pageSize);
}
