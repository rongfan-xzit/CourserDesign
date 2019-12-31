package com.xzit.spring.controller;

import com.xzit.spring.entity.Permission;
import com.xzit.spring.entity.Role;
import com.xzit.spring.service.PermissionService;
import com.xzit.spring.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/authority")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RoleService roleService;
    @RequestMapping("/jump")
    public String jump()
    {
        return "authority-settings";
    }
    @RequestMapping("/getsyspermissiontree")
    @ResponseBody
    public List<Permission> findAll()
    {
        return permissionService.getAll();
    }
    @RequestMapping("/getsysrole")
    @ResponseBody
    public List<Role> findAll1(){
        return roleService.findAll();
    }
    @RequestMapping("/getsyspermissiontreebyroleid")
    @ResponseBody
    public List<Map<String,Object>> getSysPermission(String role_id)
    {
        return permissionService.getsyspermissiontreebyroleid(role_id);
    }
    @RequestMapping("/updatepermissionbyroleid")
    @ResponseBody
    public int updatePermissionByRoleId(String role_id, @RequestParam("permission_ids[]") List<Object> permission_ids) {
        permissionService.deletePerByRoleId(role_id);
        permissionService.updatePermissionByRoleId(role_id,permission_ids);
        return 1;
    }
}
