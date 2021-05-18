package com.example.hrms.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.hrms.entities.concretes.SystemPersonnel;

public interface SystemPersonnelDao extends JpaRepository<SystemPersonnel, Integer>{

}
