package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;

import com.tabchanj.job.domain.Company;


public interface ICompanyService {
	void saveCompany(Company u);

	void updateCompany(Company u);

	void deleteCompany(Serializable id);

	Company getCompany(Serializable id);

	List<Company> listCompanys();
}
