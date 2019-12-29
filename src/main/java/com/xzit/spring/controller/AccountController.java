package com.xzit.spring.controller;

import com.xzit.spring.entity.Account;
import com.xzit.spring.entity.Permission;
import com.xzit.spring.entity.Staff;
import com.xzit.spring.service.AccountService;
import com.xzit.spring.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/login")
    public String login(@RequestParam String account, @RequestParam String password, HttpSession session) {
        Account account1 = accountService.findBy(account, password);
        if (account1 == null) {
            return "redirect:/index.jsp";
        } else {
            session.setAttribute("account", account1);
            return "redirect:/user/index";
        }
    }

    @RequestMapping("/index")
    public String adminIndex(HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        List<Permission> listMenu = permissionService.getSysPermissionByRoleId(account.getRoleId());
        Map<String, List<Permission>> maps = new HashMap<String, List<Permission>>();
        int parentid = 0;
        int count = 0;
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
    @RequestMapping("/register")
    public String register(@RequestParam String account,@RequestParam String password)
    {
        accountService.insertAccount(account,password);
        return "redirect:/index.jsp";
    }
}
