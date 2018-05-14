package com.consumerreports.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.consumerreports.auth.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    List<User> findAll(); 
}
