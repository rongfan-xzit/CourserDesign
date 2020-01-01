package com.xzit.spring.service;

import com.github.pagehelper.PageInfo;
import com.xzit.spring.dto.StaffAccount;
import com.xzit.spring.entity.Staff;


import java.util.List;

public interface StaffService {
    Staff findUserBy( String userId,  String password);
    List<Staff> findAll();
    PageInfo<Staff> pageSelect(Staff staff,Integer pageNo,Integer pageSize);
    PageInfo<Staff> findById(Staff staff,Integer pageNo,Integer pageSize,String name);
    void insertStaff(Staff staff);
    StaffAccount findByWorkId(String workId);
    void updateByWorkId( Staff staff);
    void deleteByWorkId(String workId);
    Staff findId (String workId);
}
