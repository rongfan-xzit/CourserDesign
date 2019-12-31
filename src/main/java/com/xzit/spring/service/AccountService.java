package com.xzit.spring.service;

import com.xzit.spring.entity.Account;
import org.apache.ibatis.annotations.Param;

public interface AccountService {
    Account findBy(String account,  String password);
    void insertAccount(String account,  String password);
    void insertStaffAccount( String account,  String password, String roleId);
}
