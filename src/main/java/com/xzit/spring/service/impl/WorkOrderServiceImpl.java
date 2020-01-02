package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.mapper.WorkOrderMapper;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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

    @Override
    @Transactional
    public void save(MultipartFile file, WorkOrder workOrder, ModelMap map) throws Exception {
        String filePath = "E:\\2019year-CourseDeign\\CourseDeign\\src\\main\\webapp\\upload";
        String originaleFilename = file.getOriginalFilename();
        String newFileName = UUID.randomUUID()+originaleFilename;
        File targetFile = new File(filePath,newFileName);
        file.transferTo(targetFile);
        workOrderMapper.insertBywork("123",newFileName);
    }

    @Override
    public List<WorkOrder> findByWorkId(String workId) {
        return workOrderMapper.findByWorkId(workId);
    }



    @Override
    public int insertWorkOrderInf(WorkOrder1 workOrder) {
        return workOrderMapper.insertWorkOrderInf(workOrder);
    }

    @Override
    public WorkOrder1 selectByWorkorderid(String workorderid) {
        return workOrderMapper.selectByWorkorderid(workorderid);
    }

    @Override
    public WorkOrder1 selectByOrderId(String orderId) {
        return workOrderMapper.selectByOrderId(orderId);
    }


   /* @Override
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
    public Staff findById(String workId) {
        return staffMapper.findById(workId);
    }*/
}
