package com.xzit.spring.mapper;

import com.xzit.spring.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    User findUserBy(@Param("account") String userId,@Param("password") String password);
    int registeruser(@Param("user") User user);
}
