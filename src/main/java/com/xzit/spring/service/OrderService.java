package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface OrderService {

    PageInfo<Order> selectOrder(Integer pageNo, Integer pageSize);

    PageInfo<Order> selectOrderByOrderId(Integer pageNo, Integer pageSize,String OrderId);

    Order selectOrderrInf(String orderId);

    void deleteByOrderId(String OrderId);

    int updateByOrderId(String OrderId);
}
