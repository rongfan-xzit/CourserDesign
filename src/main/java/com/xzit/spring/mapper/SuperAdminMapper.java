package com.xzit.spring.mapper;

import com.xzit.spring.entity.SuperAdmin;
import org.apache.ibatis.annotations.Param;

public interface SuperAdminMapper {
    SuperAdmin findUserBy(@Param("account") String userId, @Param("password") String password);
}
