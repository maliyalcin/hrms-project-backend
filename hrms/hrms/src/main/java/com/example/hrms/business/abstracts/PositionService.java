package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.Position;

public interface PositionService {
	List<Position> getAll();
}
