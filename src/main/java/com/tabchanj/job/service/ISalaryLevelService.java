package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;

import com.tabchanj.job.domain.SalaryLevel;


public interface ISalaryLevelService {
	void saveSalaryLevel(SalaryLevel u);

	void updateSalaryLevel(SalaryLevel u);

	void deleteSalaryLevel(Serializable id);

	SalaryLevel getSalaryLevel(Serializable id);

	List<SalaryLevel> listSalaryLevels();
}
