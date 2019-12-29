package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.entity.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StaffService {
    Staff findUserBy(@Param("account") String userId, @Param("password") String password);
    List<Staff> findAll();
    PageInfo<Staff> pageSelect(Staff staff,Integer pageNo,Integer pageSize);
    Staff findById(String workId);
}
