package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.JobSeeker;

public interface JobSeekerService {
	List<JobSeeker> getAll();
}
