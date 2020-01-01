package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.AjaxOutput;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.dto.StaffAccount;
import com.xzit.spring.dto.StaffDto;
import com.xzit.spring.entity.Account;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.service.AccountService;
import com.xzit.spring.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    private StaffService staffService;
    @Autowired
    private AccountService accountService;

    /**
     * 跳转到显示所有员工信息的界面
     * @return
     */
    @RequestMapping("/query")
    public String query()
    {
        return "list";
    }

    /**
     * 分页显示查询的所有员工的信息
     * @param page
     * @param rows
     * @param staff
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public Datagrid<Staff> findAll(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                   @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                   Staff staff)
    {
       Datagrid<Staff> staffDatagrid = new Datagrid<>();
        PageInfo<Staff> staffPageInfo = staffService.pageSelect(staff,page,rows);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("员工查询信息结果");
        return staffDatagrid;
    }

    /**
     * 根据员工的姓名进行查询并显示员工信息
     * @param page
     * @param rows
     * @param staff
     * @param id
     * @return
     */
    @RequestMapping("staffInfo/{id}")
    @ResponseBody
    public Datagrid<Staff> findById(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                          @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                          Staff staff,@PathVariable String id)
    {
        Datagrid<Staff> staffDatagrid = new Datagrid<>();
        PageInfo<Staff> staffPageInfo = staffService.findById(staff,page,rows,id);
        staffDatagrid.setCode(0);
        staffDatagrid.setCount(staffPageInfo.getTotal());
        staffDatagrid.setData(staffPageInfo.getList());
        staffDatagrid.setMsg("员工查询信息结果");
        return staffDatagrid;
    }

    /**
     * 跳转到添加员工信息的界面
     * @return
     */
    @RequestMapping("toadd")
    public String toadd()
    {
        return "add";
    }

    /**
     * 对管理员添加的员工信息进行验证是否符合规范要求，如果符合可以进行数据插入，不符合返回错误信息
     *
     * @param staffDto
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/valid",produces = "application/json;charset=utf-8")
    @ResponseBody
    public AjaxOutput ajaxAdd(@Valid @RequestBody  StaffDto staffDto, BindingResult bindingResult) throws Exception
    {
        AjaxOutput ajaxOutput = new AjaxOutput();
        if(bindingResult.hasErrors())
        {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("数据校验失败");
            ajaxOutput.setData(allErrors);
            return ajaxOutput;
        }
        accountService.insertStaffAccount(staffDto.getWorkId(),"123",staffDto.getRoleId());
        Account account = accountService.findBy(staffDto.getWorkId(), "123");
        Staff staff = new Staff(staffDto.getWorkId()    ,staffDto.getType(),staffDto.getName(),staffDto.getPhone(),staffDto.getSex(),staffDto.getAge(),account.getUserInfoId());
        staffService.insertStaff(staff);
        ajaxOutput.setMessage("数据保存成功");
        return ajaxOutput;
    }

    /**
     * 根据员工的编号查找员工的信息
     * @param id
     * @return
     */
    @RequestMapping("toedit/{id}")
    public ModelAndView  toEdit(@PathVariable String id)
    {
       StaffAccount staff =  staffService.findByWorkId(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("edit");
        mv.addObject("staff",staff);
        return mv;
    }

    /**
     * 用于根据员工编号删除员工信息
     * @param id 员工编号
     * @return 返回是否删除成功信息
     */
    @RequestMapping("/todelete/{id}")
    @ResponseBody
    public AjaxOutput  toDelete(@PathVariable String id)
    {
        staffService.deleteByWorkId(id);
        accountService.deleteByWorkId(id);
        AjaxOutput ajaxOutput = new AjaxOutput();
        ajaxOutput.setMsgkey("delSuccess");
        ajaxOutput.setMessage("删除成功");
        return ajaxOutput;
    }
    @RequestMapping(value = "/update",produces = "application/json;charset=utf-8")
    @ResponseBody
    public AjaxOutput toUpdate(@Valid @RequestBody  StaffDto staffDto, BindingResult bindingResult) throws Exception
    {
        AjaxOutput ajaxOutput = new AjaxOutput();
        if(bindingResult.hasErrors())
        {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("数据校验失败");
            ajaxOutput.setData(allErrors);
            return ajaxOutput;
        }
        accountService.updateByWorkId(staffDto.getRoleId(),staffDto.getWorkId());
        Staff staff = new Staff(staffDto.getWorkId(),staffDto.getType(),staffDto.getName(),staffDto.getPhone(),staffDto.getSex(),staffDto.getAge());
        staffService.updateByWorkId(staff);
        ajaxOutput.setMessage("数据保存成功");
        return ajaxOutput;
    }

}
