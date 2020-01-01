package com.xzit.spring.mapper;

import com.xzit.spring.entity.WorkOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkOrderMapper {
    List<WorkOrder> findAll();
    void insertBywork (@Param("workOrderId") String workOrderId, @Param("image") String image);
    List<WorkOrder> findByWorkId (String workId);
}
