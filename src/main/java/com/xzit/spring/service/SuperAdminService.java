package com.xzit.spring.service;

import com.xzit.spring.entity.SuperAdmin;
import org.apache.ibatis.annotations.Param;

public interface SuperAdminService {
    SuperAdmin findUserBy(@Param("account") String userId, @Param("password") String password);
}
