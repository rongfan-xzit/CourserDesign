package com.xzit.spring.mapper;

import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkOrderMapper {
    List<WorkOrder> findAll();

    void insertBywork (@Param("workOrderId") String workOrderId, @Param("image") String image);

    List<WorkOrder> findByWorkId (String workId);

    int insertWorkOrderInf(WorkOrder1 workOrder);

    WorkOrder1 selectByWorkorderid(String workorderid);

    WorkOrder1 selectByOrderId(String orderId);

    List<WorkOrder1> selectOrder();

    List<WorkOrder1> selectOrderByOrderId(String orderId);

    int updateWorkOrderInf(WorkOrder1 workOrder);
}
