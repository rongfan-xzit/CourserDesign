package com.xzit.spring.mapper;

import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    List<Order> selectOrder();

    List<Order> selectOrderByOrderId(String OrderId);

    Order selectOrderrInf(String orderId);

    void deleteByOrderId(String OrderId);

    int updateByOrderId(String OrderId);
}
