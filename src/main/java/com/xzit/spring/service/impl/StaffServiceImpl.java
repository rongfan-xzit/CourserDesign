package com.xzit.spring.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.mapper.StaffMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffServiceImpl implements com.xzit.spring.service.StaffService {
    @Autowired
    private StaffMapper staffMapper;

    @Override
    public Staff findUserBy(String userId, String password) {
        return staffMapper.findUserBy(userId,password);
    }

    @Override
    public List<Staff> findAll() {
        return staffMapper.findAll();
    }

    @Override
    public PageInfo<Staff> pageSelect(Staff staff, Integer pageNo, Integer pageSize) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Staff> staffAll = staffMapper.findAll();
        PageInfo<Staff> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public PageInfo<Staff> findById(Staff staff, Integer pageNo, Integer pageSize, String name) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Staff> staffAll = staffMapper.findById(name);
        PageInfo<Staff> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public void insertStaff(Staff staff) {
        staffMapper.insertStaff(staff);
    }
}
