package com.xzit.spring.service.impl;

import com.xzit.spring.entity.Account;
import com.xzit.spring.mapper.AccountMapper;
import com.xzit.spring.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Override
    public Account findBy(String account, String password) {
        return accountMapper.findBy(account,password);
    }

    @Override
    public void insertAccount(String account, String password) {
        accountMapper.insertAccount(account,password);
    }
}
