package com.xzit.spring.service.impl;

import com.xzit.spring.entity.User;
import com.xzit.spring.mapper.UserMapper;
import com.xzit.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User findUserBy(String userId, String password) {

        return userMapper.findUserBy(userId,password);
    }

    @Override
    public int registeruser(User user) {
        return userMapper.registeruser(user);
    }

}
