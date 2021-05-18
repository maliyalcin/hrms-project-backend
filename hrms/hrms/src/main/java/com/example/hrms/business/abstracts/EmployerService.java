package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.Employer;

public interface EmployerService {
	List<Employer> getAll();
}
