package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.mapper.OrderMapper;
import com.xzit.spring.mapper.StaffMapper;
import com.xzit.spring.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public Order selectOrderrInf(String orderId) {
        return orderMapper.selectOrderrInf(orderId);
    }

//    @Override
//    public Staff findUserBy(String userId, String password) {
//        return staffMapper.findUserBy(userId,password);
//    }
//
//    @Override
//    public List<Staff> findAll() {
//        return staffMapper.findAll();
//    }
//
//    @Override
//    public PageInfo<Staff> pageSelect(Staff staff, Integer pageNo, Integer pageSize) {
//        pageNo = pageNo ==null?1:pageNo;
//        pageSize = pageSize==null?10:pageSize;
//        PageHelper.startPage(pageNo,pageSize);
//        List<Staff> staffAll = staffMapper.findAll();
//        PageInfo<Staff> page = new PageInfo<>(staffAll);
//        return page;
//    }
//
//    @Override
//    public Staff findById(String workId) {
//        return staffMapper.findById(workId);
//    }
}
