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

    /**
     * 进行权限界面的跳转
     * @return
     */
    @RequestMapping("/jump")
    public String jump()
    {
        return "authority-settings";
    }

    /**
     * 加载权限表中所有的权限数据
     * @return
     */
    @RequestMapping("/getsyspermissiontree")
    @ResponseBody
    public List<Permission> findAll()
    {
        return permissionService.getAll();
    }

    /**
     * 得到角色表中所有的数据
     * @return
     */
    @RequestMapping("/getsysrole")
    @ResponseBody
    public List<Role> findAll1(){
        return roleService.findAll();
    }

    /**
     * 查看角色权限时使用，根据用户的角色编号，查询角色的权限
     * @param role_id 角色编号
     * @return
     */
    @RequestMapping("/getsyspermissiontreebyroleid")
    @ResponseBody
    public List<Map<String,Object>> getSysPermission(String role_id)
    {
        return permissionService.getsyspermissiontreebyroleid(role_id);
    }

    /**
     * 用于分配权限使用，更新用户的权限
     * @param role_id 角色编号
     * @param permission_ids 前端勾选的权限编号，以数组对象形式传递
     * @return
     */
    @RequestMapping("/updatepermissionbyroleid")
    @ResponseBody
    public int updatePermissionByRoleId(String role_id, @RequestParam("permission_ids[]") List<Object> permission_ids) {
        permissionService.deletePerByRoleId(role_id);
        permissionService.updatePermissionByRoleId(role_id,permission_ids);
        return 1;
    }
}
