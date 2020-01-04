package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.AjaxOutput;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.dto.StaffDto;
import com.xzit.spring.entity.*;
import com.xzit.spring.service.ComplaintsService;
import com.xzit.spring.service.OrderService;
import com.xzit.spring.service.WorkOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/complaints")
public class ComplaintsController {
    @Autowired
    private ComplaintsService complaintsService;
    @Autowired
    private WorkOrderService workOrderService;

    /**
     * 投诉工单页面
     * @return
     */
    @RequestMapping("/complaintsPage")
    public String complaintsPage()
    {
        return "complaintsPage";
    }

    /**
     * 查看投诉工单页面
     * @return
     */
    @RequestMapping("/selectComplaintsPage")
    public String selectComplaintsPage()
    {
        return "selectComplaintsPage";
    }

    /**
     * 投诉工单页面查询工单编号接口
     * @return
     */
    @RequestMapping("/selectWorkorderid/{workorderid}")
    @ResponseBody
    public AjaxOutput selectWorkorderid(@PathVariable String workorderid)
    {
        AjaxOutput ajaxOutput = new AjaxOutput();
        //查询是否存在工单编号
        WorkOrder1 workOrder1 = workOrderService.selectByWorkorderid(workorderid);
        //存在此订单情况(保修卡编号是否存在问题未考虑)
        if(null != workOrder1){
            ajaxOutput.setData(workOrder1);
        }else {
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("此工单编号不存在，请重新填写！");
            }
        return ajaxOutput;
    }

    /**
     * 投诉工单页面提交投诉接口
     * @return
     */
    @RequestMapping("/conComplaints")
    @ResponseBody
    public AjaxOutput conComplaints(@Valid @RequestBody Complaints complaints)
    {
        AjaxOutput ajaxOutput = new AjaxOutput();
//        DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        //根据工单编号获取用户编号
        WorkOrder1 workOrder1 = workOrderService.selectByWorkorderid(complaints.getWorkorderid());
       /* complaints.setTime(new Date());*/
        complaints.setUserId(workOrder1.getUserid());
        complaintsService.insertComplaints(complaints);
        ajaxOutput.setMsgkey("vailderror");
        ajaxOutput.setMessage("投诉成功！");
        return ajaxOutput;
    }

    /**
     * 查看已投诉工单页面接口
     * @return
     */
    @GetMapping("/selectComplaints/{workorderid}")
    @ResponseBody
    public Datagrid<Complaints> selectComplaints(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                       @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                       @PathVariable String workorderid) {
        Datagrid<Complaints> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        WorkOrder1 workOrder1 = workOrderService.selectByWorkorderid(workorderid);
        if(null != workOrder1){
            PageInfo<Complaints> staffPageInfo = complaintsService.selectComplaintsByWorkorderid(page,rows,workorderid);
            staffDatagrid.setCode(0);
            staffDatagrid.setCount(staffPageInfo.getTotal());
            staffDatagrid.setData(staffPageInfo.getList());
            staffDatagrid.setMsg("已投诉工单信息列表");
        }else {
            staffDatagrid.setMsg("此工单编号不存在，请重新填写！");
        }

        return staffDatagrid;
    }
    /**
     * 查看已投诉工单页面接口
     * @return
     */
    @GetMapping("/find")
    @ResponseBody
    public Datagrid<Complaints> find(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                                 @RequestParam(value = "limit", defaultValue = "10", required = false) int rows) {
        Datagrid<Complaints> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        PageInfo<Complaints> staffPageInfo = complaintsService.selectComplaints(page,rows);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("已投诉工单信息列表");
        return staffDatagrid;
    }

    /**
     * 用于根据投诉编号删除投诉信息
     */
    @RequestMapping("/deleteComplaints/{complaintsid}")
    @ResponseBody
    public AjaxOutput  deleteComplaints(@PathVariable String complaintsid)
    {
        complaintsService.deleteByComplaintsid(complaintsid);
        AjaxOutput ajaxOutput = new AjaxOutput();
        ajaxOutput.setMsgkey("delSuccess");
        ajaxOutput.setMessage("删除成功");
        return ajaxOutput;
    }

}
