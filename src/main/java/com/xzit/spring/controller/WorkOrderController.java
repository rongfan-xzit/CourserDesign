package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.AjaxOutput;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.dto.StaffAccount;
import com.xzit.spring.entity.Order;
import com.xzit.spring.entity.WorkOrder;
import com.xzit.spring.entity.WorkOrder1;
import com.xzit.spring.service.OrderService;
import com.xzit.spring.service.WorkOrderService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.UUID;


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
            return "complaintsPage";
        }

    /**
     * 跳转到处理工单页面
     * @return
     */
    @RequestMapping("/disposeWorkOrderPage")
    public String disposeWorkOrderPage()
    {
        return "disposeWorkOrderPage";
    }


        /**
         *填写工单接口
         */
        @RequestMapping("/addWorkOrder")
        @ResponseBody
        public AjaxOutput addWorkOrder(@Valid @RequestBody WorkOrder1 workOrder1) throws ParseException {
            AjaxOutput ajaxOutput = new AjaxOutput();
            //通过订单编号查询是否存在此订单
            Order order = orderService.selectOrderrInf(workOrder1.getOrderId());
            //存在此订单情况(保修卡编号是否存在问题未考虑)
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


    /**
     *处理工单进度
     */
    @RequestMapping("disWorkOrderPage/{orderId}")
    public ModelAndView  disWorkOrderPage(@PathVariable String orderId)
    {
        WorkOrder1 workOrder1 = workOrderService.selectByOrderId(orderId);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chuliWorkOrder");
        mv.addObject("workOrder1",workOrder1);
        return mv;
    }
    /**
     *查看工单进度接口
     */
    @RequestMapping("upImgWorkOrderPage/{orderId}")
    public ModelAndView  upImgWorkOrderPage(@PathVariable String orderId)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("upImgWorkOrder");
        mv.addObject("orderId",orderId);
        return mv;
    }

//    @RequestMapping("upImgWorkOrderPage")
//    public ModelAndView  upImgWorkOrderPage()
//    {
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("upImgWorkOrder");
//        return mv;
//    }
    /**
     *确认工单信息查询接口
     */
    @RequestMapping("/yesWorkOrderSelect/{orderId}")
    @ResponseBody
    public AjaxOutput yesWorkOrderSelect( @PathVariable String orderId) {
        AjaxOutput ajaxOutput = new AjaxOutput();
        WorkOrder1 workOrder1 = workOrderService.selectByOrderId(orderId);
        //订单号存在
        if(null != workOrder1){
            ajaxOutput.setData(workOrder1);
        }else {
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("没有此订单号的工单信息");
        }
        return ajaxOutput;
    }

    /**
     *确认工单信息接口
     */
    @RequestMapping("/yesWorkOrder")
    @ResponseBody
    public AjaxOutput yesWorkOrder( @PathVariable String orderId) {
        AjaxOutput ajaxOutput = new AjaxOutput();
        WorkOrder1 workOrder1 = workOrderService.selectByOrderId(orderId);
        //订单号存在
        if(null != workOrder1){
            ajaxOutput.setData(workOrder1);
        }else {
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("没有此订单号的工单信息");
        }
        return ajaxOutput;
    }

    /**
     *根据订单号查询处理工单信息接口
     */
    @RequestMapping("/disposeWorkOrder/{orderId}")
    @ResponseBody
    public Datagrid<WorkOrder1> disposeWorkOrder(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                       @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                       @PathVariable String  orderId) {
        Datagrid<WorkOrder1> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        PageInfo<WorkOrder1> staffPageInfo = workOrderService.selectOrderByOrderId(page,rows,orderId);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("工单信息列表");
        return staffDatagrid;
    }

    /**
     *查询处理工单信息接口
     */
    @RequestMapping("/find")
    @ResponseBody
    public Datagrid<WorkOrder1> find(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                       @RequestParam(value = "limit", defaultValue = "10", required = false) int rows) {
        Datagrid<WorkOrder1> staffDatagrid = new Datagrid<>();
        //查询是否存在工单编号
        PageInfo<WorkOrder1> staffPageInfo = workOrderService.selectOrder(page,rows);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("工单信息列表");
        return staffDatagrid;
    }

    /**
     *处理工单信息接口
     */
    @RequestMapping("/disWorkOrder")
    @ResponseBody
    public AjaxOutput disWorkOrder(HttpServletRequest request ,WorkOrder1 workOrder1) throws Exception {
        AjaxOutput ajaxOutput = new AjaxOutput();
        //通过订单编号查询是否存在此订单
        Order order = orderService.selectOrderrInf(workOrder1.getOrderId());
        //存在此订单情况(保修卡编号是否存在问题未考虑)
        if(null != order){
            WorkOrder1 workOrder2 =  workOrderService.selectByWorkorderid(workOrder1.getWorkorderid());
            //工单编号存在的情况
            if(null != workOrder2){
            //处理图片将图片保存在工程upload文件夹中
                //使用UUID给图片重命名，并去掉四个“-”
                String name = UUID.randomUUID().toString().replaceAll("-", "");
                //获取文件的扩展名
                String ext = FilenameUtils.getExtension(workOrder1.getPictureFile().getOriginalFilename());
                //设置图片上传路径
                String url = request.getSession().getServletContext().getRealPath("/upload");
                String ur = request.getSession().getServletContext().getRealPath("/");
                System.out.println(ur);
                workOrder1.getPictureFile().transferTo(new File(url+"/"+name + "." + ext));
                //将图片路径保存在数据库中
                workOrder1.setImagePath("\\"+"upload"+"\\"+name + "." + ext);
                //购买此订单的用户编号
                workOrder1.setUserid(order.getUserId());
                workOrder1.setCheckResult("检查完成");
                int coun =  workOrderService.updateWorkOrderInf(workOrder1);
                if(coun >0){
                    ajaxOutput.setMsgkey("vailderror");
                    ajaxOutput.setMessage("工单信息处理成功");
                }else {
                    ajaxOutput.setMsgkey("vailderror");
                    ajaxOutput.setMessage("工单信息处理提交出现错误！");
                }
            }else {
                ajaxOutput.setMsgkey("vailderror");
                ajaxOutput.setMessage("此工单编号不存在！请重新填写！");
            }
        }else {
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("此订单编号不存在！");
        }
        return ajaxOutput;
    }


    /**
     * 用于根据订单编号删除订单信息
     */
    @RequestMapping("/deleteByOrderId/{OrderId}")
    @ResponseBody
    public AjaxOutput  deleteByOrderId(@PathVariable String OrderId)
    {
      int coun = workOrderService.deleteByOrderId(OrderId);
        AjaxOutput ajaxOutput = new AjaxOutput();
        ajaxOutput.setMsgkey("delSuccess");
        if(coun >0){
            ajaxOutput.setMessage("删除成功");
        }else {
            ajaxOutput.setMessage("此工单信息存在未删除的订单，所以不可删除！");
        }
        return ajaxOutput;
    }


    @RequestMapping("/upinfo")
    @ResponseBody
    public void upinfo(HttpServletRequest request ,@RequestParam("pictureFile") MultipartFile pictureFile) throws Exception {
        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        //设置图片上传路径
        String url = request.getSession().getServletContext().getRealPath("/upload");
        String ur = request.getSession().getServletContext().getRealPath("/");
        System.out.println(ur);
        pictureFile.transferTo(new File(url+"/"+name + "." + ext));
        System.out.println("\\"+"upload"+"\\"+name + "." + ext);
        //以绝对路径保存重名命后的图片

//        String workspacePath = directory.getCanonicalPath(); //获取工作空间的绝对路径
//        System.out.println(workspacePath);
//        String uploadDicPath = "\\src\\main\\webapp\\upload\\"; //手动添加上传文件夹的路径
//        String uploadPath = workspacePath + uploadDicPath; //最终图片上传的路径
//
//        File targetFile = new File(uploadPath,name + "." + ext);
//        pictureFile.transferTo(targetFile);
        //把图片存储路径保存到数据库
//        user.setImageURL("upload/"+name + "." + ext);
//
//        userService.addUser(user);
        //重定向到查询所有用户的Controller，测试图片回显

    }


}
