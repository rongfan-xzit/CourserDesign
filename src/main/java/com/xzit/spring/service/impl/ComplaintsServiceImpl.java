package com.xzit.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.mapper.ComplaintsMapper;
import com.xzit.spring.mapper.WorkOrderMapper;
import com.xzit.spring.service.ComplaintsService;
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
public class ComplaintsServiceImpl implements ComplaintsService {
    @Autowired
    private ComplaintsMapper complaintsMapper;

    @Override
    public void insertComplaints(Complaints complaints) {
         complaintsMapper.insertComplaints(complaints);
    }

    @Override
    public PageInfo<Complaints> selectComplaintsByWorkorderid(Integer pageNo, Integer pageSize,String workorderid) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Complaints> staffAll = complaintsMapper.selectComplaintsByWorkorderid(workorderid);
        PageInfo<Complaints> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public PageInfo<Complaints> selectComplaints(Integer pageNo, Integer pageSize) {
        pageNo = pageNo ==null?1:pageNo;
        pageSize = pageSize==null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Complaints> staffAll = complaintsMapper.selectComplaints();
        PageInfo<Complaints> page = new PageInfo<>(staffAll);
        return page;
    }

    @Override
    public void deleteByComplaintsid(String complaintsid) {
        complaintsMapper.deleteByComplaintsid(complaintsid);
    }

    @Override
    public void updateByComplaintsid(Complaints complaints,String complaintsid) {
        complaintsMapper.updateByComplaintsid(complaints,complaintsid);
    }
}
