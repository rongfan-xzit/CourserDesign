package com.xzit.spring.mapper;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComplaintsMapper {
//    List<WorkOrder> findAll();
//    void insertBywork(@Param("workOrderId") String workOrderId, @Param("image") String image);
//    List<WorkOrder> findByWorkId(String workId);
//
//    int insertWorkOrderInf(WorkOrder1 workOrder);
//    /*List<Staff> findAll();*/
//    WorkOrder1 selectByWorkorderid(String workorderid);

    List<Complaints> selectComplaintsByWorkorderid(@Param("workorderid") String workorderid);

    void insertComplaints(Complaints complaints);
}
