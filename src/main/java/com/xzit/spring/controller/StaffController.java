package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.StaffDatagrid;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    private StaffService staffService;
    @RequestMapping("/query")
    public String query()
    {
        return "list";
    }
    @RequestMapping("/find")
    @ResponseBody
    public StaffDatagrid<Staff> findAll( @RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                         @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                         Staff staff)
    {
       StaffDatagrid<Staff> staffStaffDatagrid = new StaffDatagrid<>();
        PageInfo<Staff> staffPageInfo = staffService.pageSelect(staff,page,rows);
        staffStaffDatagrid.setCode(0);
        staffStaffDatagrid.setCount(staffPageInfo.getTotal());
        staffStaffDatagrid.setData(staffPageInfo.getList());
        staffStaffDatagrid.setMsg("员工查询信息结果");
        return staffStaffDatagrid;
    }

}
