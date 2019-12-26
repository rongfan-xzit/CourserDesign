package com.xzit.spring.controller;

import com.xzit.spring.entity.Permission;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.entity.SuperAdmin;
import com.xzit.spring.entity.User;
import com.xzit.spring.service.PermissionService;
import com.xzit.spring.service.StaffService;
import com.xzit.spring.service.SuperAdminService;
import com.xzit.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StaffService staffService;
    @Autowired
    private SuperAdminService superAdminService;
    @Autowired
    private PermissionService permissionService;
    /**
     * 1.用户登录请求
     * 2.如果不成功返回index.jsp页面
     * 3.如果成功跳转到后台界面
     * @param account 用户账号
     * @param password 用户密码
     * @return
     */
    @RequestMapping("/login")
    public String login(@RequestParam String account,@RequestParam String password,HttpSession session)
    {
        User user = userService.findUserBy(account, password);
        Staff staff = staffService.findUserBy(account, password);
        SuperAdmin superAdmin = superAdminService.findUserBy(account, password);
        if(user==null&&staff==null&&superAdmin==null)
        {
            return "redirect:/index.jsp";
        }
        else if(user!=null) {
            session.setAttribute("user",user);
            return "redirect:/user/index"; }
        else  if(staff!=null)
        {
            session.setAttribute("staff",staff);
            return "redirect:/user/index";
        }
        else {
            session.setAttribute("superAdmin",superAdmin);
            return "redirect:/user/index";
        }
    }
    @RequestMapping("/index")
    public String adminIndex(HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user!=null)
        {
            List<Permission> listMenu = permissionService.getSysPermissionByRoleId(user.getRoleId());
            Map<String, List<Permission>> maps = new HashMap<String, List<Permission>>();
            int parentid=0;
            int count=0;
            if (listMenu.size() != 0) {
                for (int i = 0; i < listMenu.size(); i++) {
                    if (listMenu.get(i).getId().equals(listMenu.get(i).getParentid())) {
                        parentid = listMenu.get(i).getParentid();
                        List<Permission> listMenus = new ArrayList<Permission>();
                        for (int j = 0; j < listMenu.size(); j++) {
                            if (listMenu.get(j).getParentid().equals(parentid)) {
                                listMenus.add(listMenu.get(j));
                            }
                        }
                        String str = "group" + count;
                        maps.put(str, listMenus);
                        count++;
                    }
                }
            }

            session.setAttribute("menuMaps", maps);
            return "index";//通过图解析器去完成地址的转发
        }
        Staff staff = (Staff) session.getAttribute("staff");
        if(staff!=null)
        {
            List<Permission> listMenu = permissionService.getSysPermissionByRoleId(staff.getRoleid());
            Map<String, List<Permission>> maps = new HashMap<String, List<Permission>>();
            int parentid=0;
            int count=0;
            if (listMenu.size() != 0) {
                for (int i = 0; i < listMenu.size(); i++) {
                    if (listMenu.get(i).getId().equals(listMenu.get(i).getParentid())) {
                        parentid = listMenu.get(i).getParentid();
                        List<Permission> listMenus = new ArrayList<Permission>();
                        for (int j = 0; j < listMenu.size(); j++) {
                            if (listMenu.get(j).getParentid().equals(parentid)) {
                                listMenus.add(listMenu.get(j));
                            }
                        }
                        String str = "group" + count;
                        maps.put(str, listMenus);
                        count++;
                    }
                }
            }

            session.setAttribute("menuMaps", maps);
            return "index";//通过图解析器去完成地址的转发
        }
       SuperAdmin superAdmin = (SuperAdmin) session.getAttribute("superAdmin");
        if(superAdmin!=null)
        {
            List<Permission> listMenu = permissionService.getSysPermissionByRoleId(superAdmin.getRoleId());
            Map<String, List<Permission>> maps = new HashMap<String, List<Permission>>();
            int parentid=0;
            int count=0;
            if (listMenu.size() != 0) {
                for (int i = 0; i < listMenu.size(); i++) {
                    if (listMenu.get(i).getId().equals(listMenu.get(i).getParentid())) {
                        parentid = listMenu.get(i).getParentid();
                        List<Permission> listMenus = new ArrayList<Permission>();
                        for (int j = 0; j < listMenu.size(); j++) {
                            if (listMenu.get(j).getParentid().equals(parentid)) {
                                listMenus.add(listMenu.get(j));
                            }
                        }
                        String str = "group" + count;
                        maps.put(str, listMenus);
                        count++;
                    }
                }
            }

            session.setAttribute("menuMaps", maps);
            return "index";//通过图解析器去完成地址的转发
        }
        return "";
    }
    @RequestMapping("/register")
    public String register(@RequestParam String userId,@RequestParam String name,@RequestParam String phone,
                           @RequestParam String sex,@RequestParam int age,@RequestParam String password,@RequestParam String address)
    {
        User user = new User(userId,name,phone,sex,age,password,address);
        userService.registeruser(user);
        return "redirect:/index.jsp";
    }
}
