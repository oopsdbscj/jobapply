package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;

import com.tabchanj.job.domain.CompanyType;


public interface ICompanyTypeService {
	void saveCompanyType(CompanyType u);

	void updateCompanyType(CompanyType u);

	void deleteCompanyType(Serializable id);

	CompanyType getCompanyType(Serializable id);

	List<CompanyType> listCompanyTypes();
}
