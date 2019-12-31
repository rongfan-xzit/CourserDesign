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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    private StaffService staffService;
    @Autowired
    private AccountService accountService;
    @RequestMapping("/query")
    public String query()
    {
        return "list";
    }
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
    @RequestMapping("toadd")
    public String toadd()
    {
        return "add";
    }
    @RequestMapping("ajaxvalid")
    public AjaxOutput ajaxAdd(@Validated @RequestBody StaffDto staffDto, BindingResult bindingResult) throws Exception
    {
        AjaxOutput ajaxOutput = new AjaxOutput();
        if(bindingResult.hasErrors())
        {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            ajaxOutput.setMsgkey("vailderror");
            ajaxOutput.setMessage("数据校验失败");
            ajaxOutput.getData(allErrors);
            return ajaxOutput;
        }
        accountService.insertStaffAccount(staffDto.getWorkId(),"123",staffDto.getRoleId());
        Account account = accountService.findBy(staffDto.getWorkId(), "123");
        Staff staff = new Staff(staffDto.getWorkId(),staffDto.getType(),staffDto.getName(),staffDto.getPhone(),staffDto.getSex(),staffDto.getAge(),account.getUserInfoId());
        staffService.insertStaff(staff);
        ajaxOutput.setMessage("数据保存成功");
        return ajaxOutput;
    }

}
