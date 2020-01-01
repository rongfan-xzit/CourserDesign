package com.xzit.spring.mapper;

import com.xzit.spring.entity.WorkOrder;

import java.util.List;

public interface WorkOrderMapper {
    List<WorkOrder> findAll();
}
