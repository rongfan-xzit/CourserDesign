package com.xzit.spring.mapper;

import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    Order selectOrderrInf(@Param("orderId") String orderId);
//    List<Staff> findAll();
//    Staff findById(String workId);
}
