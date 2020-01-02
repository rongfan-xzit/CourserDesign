package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.AjaxOutput;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.service.OrderService;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/workOrder")
public class WorkOrderController {
    @Autowired
    private WorkOrderService workOrderService;

    @Autowired
    private OrderService orderService;

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

    /**
     * 上传图片
     * @param file
     * @param workOrder
     * @param map
     * @throws Exception
     */
    @RequestMapping("/save")
    public void save( MultipartFile file, WorkOrder workOrder, ModelMap map) throws Exception {
        workOrderService.save(file,workOrder,map);
    }
    @RequestMapping("/listImages/{id}")
    public ModelAndView list(@PathVariable String id)
    {
        System.out.println(id);
       List<WorkOrder> workOrders = workOrderService.findByWorkId(id);
       ModelAndView mv = new ModelAndView();
       mv.addObject("workOrders",workOrders);
       mv.setViewName("WorkOrderContent");
       return mv;
    }



        /**
         *填写工单页面
         */
        @RequestMapping("/addWorkOrderPage")
        public String addWorkOrderPage()
        {
            return "addWorkOrderPage";
        }
        /**
         *查看工单进度页面
         */
        @RequestMapping("/selectWorkOrderPage")
        public String selectWorkOrderPage()
        {
            return "selectWorkOrderPage";
        }

        /**
         *确认工单页面
         */
        @RequestMapping("/yesWorkOrderPage")
        public String yesWorkOrderPage()
        {
            return "yesWorkOrderPage";
        }

        /**
         *评价工单页面
         */
        @RequestMapping("/evaluationWorkOrderPage")
        public String evaluationWorkOrderPage()
        {
            return "evaluationWorkOrderPage";
        }

        /**
         *投诉工单页面
         */
        @RequestMapping("/complaintsWorkOrderPage")
        public String complaintsWorkOrderPage()
        {
            return "complaintsWorkOrderPage";
        }



        /**
         *填写工单接口
         */
        @GetMapping("/addWorkOrder")
        @ResponseBody
        public AjaxOutput addWorkOrder(@Validated WorkOrder1 workOrder1) throws ParseException {
            AjaxOutput ajaxOutput = new AjaxOutput();
            //通过订单编号查询是否存在此订单
            Order order = orderService.selectOrderrInf(workOrder1.getOrderId());
            //存在此订单情况
            if(null != order){
                WorkOrder1 workOrder2 =  workOrderService.selectByWorkorderid(workOrder1.getWorkorderid());
                if(null == workOrder2){
                    //购买此订单的用户编号
                    workOrder1.setUserid(order.getUserId());
                    //从什么地方获取工单编号？
                    //用户发起时间
                    workOrder1.setQuestionDate(new Date());
                    int coun =  workOrderService.insertWorkOrderInf(workOrder1);
                    if(coun >0){
                        ajaxOutput.setMsgkey("vailderror");
                        ajaxOutput.setMessage("工单信息填写成功");
                    }else {
                        ajaxOutput.setMsgkey("vailderror");
                        ajaxOutput.setMessage("工单信息提交出现错误！");
                    }
                }else {
                    ajaxOutput.setMsgkey("vailderror");
                    ajaxOutput.setMessage("此工单编号已在处理其他订单，请选择其他工单！");
                }

            }else {
                ajaxOutput.setMsgkey("vailderror");
                ajaxOutput.setMessage("此订单编号不存在！");
            }
            return ajaxOutput;
        }

        /**
         *查看工单进度接口
         */
        @RequestMapping("/selectWorkOrder")
        public String selectWorkOrder()
        {
            return "selectWorkOrder";
        }

//    @RequestMapping("staffInfo/{id}")
//    @ResponseBody
//    public Datagrid<Staff> findById(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
//                          @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
//                          Staff staff,@PathVariable String id)
//    {
//        Datagrid<Staff> staffDatagrid = new Datagrid<>();
//        PageInfo<Staff> staffPageInfo = staffService.findById(staff,page,rows,id);
//        staffDatagrid.setCode(0);
//        staffDatagrid.setCount(staffPageInfo.getTotal());
//        staffDatagrid.setData(staffPageInfo.getList());
//        staffDatagrid.setMsg("员工查询信息结果");
//        return staffDatagrid;
//    }
//    @RequestMapping("toadd")
//    public String toadd()
//    {
//        return "add";
//    }
//    @RequestMapping("ajaxvalid")
//    public AjaxOutput ajaxAdd(@Validated @RequestBody StaffDto staffDto, BindingResult bindingResult) throws Exception
//    {
//        AjaxOutput ajaxOutput = new AjaxOutput();
//        if(bindingResult.hasErrors())
//        {
//            List<ObjectError> allErrors = bindingResult.getAllErrors();
//            ajaxOutput.setMsgkey("vailderror");
//            ajaxOutput.setMessage("数据校验失败");
//            ajaxOutput.getData(allErrors);
//            return ajaxOutput;
//        }
//        accountService.insertStaffAccount(staffDto.getWorkId(),"123",staffDto.getRoleId());
//        Account account = accountService.findBy(staffDto.getWorkId(), "123");
//        Staff staff = new Staff(staffDto.getWorkId(),staffDto.getType(),staffDto.getName(),staffDto.getPhone(),staffDto.getSex(),staffDto.getAge(),account.getUserInfoId());
//        staffService.insertStaff(staff);
//        ajaxOutput.setMessage("数据保存成功");
//        return ajaxOutput;
//    }
}
