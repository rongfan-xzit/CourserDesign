package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface WorkOrderService {
    PageInfo<WorkOrder> findAll(WorkOrder workOrder, Integer pageNo, Integer pageSize);

    void save(MultipartFile file, WorkOrder workOrder, ModelMap map) throws Exception;

    List<WorkOrder> findByWorkId(String workId);

    int insertWorkOrderInf(WorkOrder1 workOrder);

    WorkOrder1 selectByWorkorderid(String workorderid);

    WorkOrder1 selectByOrderId(String orderId);

    PageInfo<WorkOrder1> selectOrder(Integer pageNo, Integer pageSize);

    PageInfo<WorkOrder1> selectOrderByOrderId(Integer pageNo, Integer pageSize,String OrderId);

    int updateWorkOrderInf(WorkOrder1 workOrder);

    int deleteByOrderId(String orderId);
}
