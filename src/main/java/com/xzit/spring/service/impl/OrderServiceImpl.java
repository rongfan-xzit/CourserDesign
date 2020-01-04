package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.mapper.ComplaintsMapper;
import com.xzit.spring.mapper.OrderMapper;
import com.xzit.spring.mapper.WorkOrderMapper;
import com.xzit.spring.service.OrderService;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public PageInfo<Order> selectOrder(Integer pageNo, Integer pageSize) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Order> staffAll = orderMapper.selectOrder();
        PageInfo<Order> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public PageInfo<Order> selectOrderByOrderId(Integer pageNo, Integer pageSize,String OrderId) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Order> staffAll = orderMapper.selectOrderByOrderId(OrderId);
        PageInfo<Order> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public Order selectOrderrInf(String orderId) {
        return orderMapper.selectOrderrInf(orderId);

    }
}
