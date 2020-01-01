package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/workOrder")
public class WorkOrderController {
    @Autowired
    private WorkOrderService workOrderService;

    /**
     * 跳转到显示所有工单列表的界面
     * @return
     */
    @RequestMapping("/orderList")
    public String orderList()
    {
        return "WorkOrderlist";
    }

    /**
     * 返回查询到的所有待分配的工单
     * @return
     */
    @RequestMapping("/listJson")
    @ResponseBody
    public Datagrid<WorkOrder> findById(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                    @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                    WorkOrder workOrder)
    {
        Datagrid<WorkOrder> workOrderDatagrid = new Datagrid<>();
        PageInfo<WorkOrder> workOrderPageInfo = workOrderService.findAll(workOrder,page,rows);
        workOrderDatagrid.setCode(0);
        workOrderDatagrid.setCount(workOrderPageInfo.getTotal());
        workOrderDatagrid.setData(workOrderPageInfo.getList());
        workOrderDatagrid.setMsg("工单查询信息结果");
        return workOrderDatagrid;
    }
}
