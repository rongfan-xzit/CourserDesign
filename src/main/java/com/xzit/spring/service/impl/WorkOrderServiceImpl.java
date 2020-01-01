package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.mapper.WorkOrderMapper;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {
    @Autowired
    private WorkOrderMapper workOrderMapper;

    @Override
    public PageInfo<WorkOrder> findAll(WorkOrder workOrder, Integer pageNo, Integer pageSize) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<WorkOrder> workOrders= workOrderMapper.findAll();
        PageInfo<WorkOrder> page = new PageInfo<>(workOrders);
        return page;
    }
}
