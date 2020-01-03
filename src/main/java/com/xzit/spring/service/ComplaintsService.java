package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ComplaintsService {

    PageInfo<Complaints> selectComplaintsByWorkorderid(Integer pageNo, Integer pageSize, String workorderid);

    void insertComplaints(Complaints complaints);
}
