package com.xzit.spring.controller;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.Datagrid;
import com.xzit.spring.entity.Role;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("/jump")
    public String jump()
    {
        return "Rolelist";
    }
    @RequestMapping("findAll")
    @ResponseBody
    public Datagrid<Role> findAll(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
                                   @RequestParam(value = "limit", defaultValue = "10", required = false) int rows,
                                   Role role)
    {
        Datagrid<Role> roleDatagrid = new Datagrid<>();
        PageInfo<Role> rolePageInfo = roleService.pageSelect(role,page,rows);
        roleDatagrid.setCode(0);
        roleDatagrid.setCount(rolePageInfo.getTotal());
        roleDatagrid.setData(rolePageInfo.getList());
        roleDatagrid.setMsg("角色查询信息结果");
        return roleDatagrid;
    }
}
