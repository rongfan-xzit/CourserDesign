package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;

import java.util.List;

public interface WorkOrderService {
    PageInfo<WorkOrder> findAll(WorkOrder workOrder, Integer pageNo, Integer pageSize);
}
