package com.xzit.spring.service;

import com.xzit.spring.entity.User;


import java.util.List;
import java.util.Map;

public interface UserService {
    User findUserBy(String userId,  String password);
    int registeruser(User user);
}
