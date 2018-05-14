package com.consumerreports.auth.service;

import java.util.List;

import com.consumerreports.auth.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> findAllUsers();
}
