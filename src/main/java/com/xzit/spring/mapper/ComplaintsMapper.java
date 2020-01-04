package com.xzit.spring.mapper;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComplaintsMapper {

    List<Complaints> selectComplaintsByWorkorderid(String workorderid);

    List<Complaints> selectComplaints();

    void insertComplaints(Complaints complaints);

    void deleteByComplaintsid(String complaintsid);

    void updateByComplaintsid(@Param("complaints") Complaints complaints,@Param("complaintsid")String complaintsid);
}
