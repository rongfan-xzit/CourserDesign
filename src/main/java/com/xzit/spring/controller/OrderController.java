package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.AjaxOutput;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.entity.Complaints;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.service.OrderService;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.ParseException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 跳转到处理工单页面
     * @return
     */
    @RequestMapping("/disposeOrderPage")
    public String disposeOrderPage()
    {
        return "disposeOrderPage";
    }

    /**
     * 查看订单状态页面接口
     * @return
     */
    @GetMapping("/find")
    @ResponseBody
    public Datagrid<Order> find(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                     @RequestParam(value = "limit", defaultValue = "10", required = false) int rows) {
        Datagrid<Order> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        PageInfo<Order> staffPageInfo = orderService.selectOrder(page,rows);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("已投诉工单信息列表");
        return staffDatagrid;
    }

//    /**
//     * 订单处理页面查询订单编号接口
//     * @return
//     */
//    @RequestMapping("/selectOrderId/{OrderId}")
//    @ResponseBody
//    public AjaxOutput selectOrderId(@PathVariable String OrderId)
//    {
//        AjaxOutput ajaxOutput = new AjaxOutput();
//        //查询是否存在订单编号
//        Order order = orderService.selectOrderrInf(OrderId);
//        if(null != order){
//            ajaxOutput.setData(order);
//        }else {
//            ajaxOutput.setMsgkey("vailderror");
//            ajaxOutput.setMessage("此订单编号不存在，请重新填写！");
//        }
//        return ajaxOutput;
//    }

    /**
     * 根据订单编号查看订单状态接口
     * @return
     */
    @GetMapping("/disposeOrderByOrderId/{OrderId}")
    @ResponseBody
    public Datagrid<Order> disposeOrderByOrderId(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                                 @PathVariable String  OrderId) {
        Datagrid<Order> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        PageInfo<Order> staffPageInfo = orderService.selectOrderByOrderId(page,rows,OrderId);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("已投诉工单信息列表");
        return staffDatagrid;
    }
}
