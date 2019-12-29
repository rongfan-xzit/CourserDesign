package com.xzit.spring.mapper;

import com.xzit.spring.entity.Account;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper {
    Account findBy(@Param("account") String account, @Param("password") String password);
    void insertAccount(@Param("account") String account, @Param("password") String password);
}
