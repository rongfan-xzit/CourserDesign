package com.xzit.spring.mapper;

import com.xzit.spring.entity.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StaffMapper {
    Staff findUserBy(@Param("account") String userId, @Param("password") String password);
    List<Staff> findAll();
}
