package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
