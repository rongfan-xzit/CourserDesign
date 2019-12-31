package com.xzit.spring.mapper;

import com.xzit.spring.entity.Account;
import com.xzit.spring.entity.Staff;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper {
    Account findBy(@Param("account") String account, @Param("password") String password);
    void insertAccount(@Param("account") String account, @Param("password") String password);
    void insertStaffAccount(@Param("account") String account, @Param("password") String password, @Param("roleId") String roleId);
}
