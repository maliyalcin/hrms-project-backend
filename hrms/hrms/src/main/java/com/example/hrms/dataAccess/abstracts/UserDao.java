package com.example.hrms.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.hrms.entities.abstracts.User;

public interface UserDao extends JpaRepository<User, Integer>{

}
