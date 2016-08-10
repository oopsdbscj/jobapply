package com.tabchanj.job.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.tabchanj.job.domain.City;
import com.tabchanj.job.domain.Company;
import com.tabchanj.job.domain.JobApply;
import com.tabchanj.job.domain.SalaryLevel;
import com.tabchanj.job.domain.Trade;
import com.tabchanj.job.service.ICityService;
import com.tabchanj.job.service.ICompanyService;
import com.tabchanj.job.service.IJobApplyService;
import com.tabchanj.job.service.ISalaryLevelService;
import com.tabchanj.job.service.ITradeService;

public class JobApplyAction  extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private JobApply jobApply;
	private Long id;
	private List<JobApply> jobApplys;
	private List<Company> companys;
	private List<City> citys;
	private List<Trade> trades;
	private List<SalaryLevel> salayLevels;

	private IJobApplyService service;
	private ICityService cityService;
	private ITradeService tradeService;
	private ICompanyService companyService;
	private ISalaryLevelService salaryLevelService;



	public String view() {
		jobApply = service.getJobApply(id);
		return "view";
	}

	public String list() {
		this.jobApplys = this.service.listJobApplys();
		return "list";
	}
	

	public String edit() {
		citys = cityService.listCitys();
		trades = tradeService.listTrades();
		salayLevels = salaryLevelService.listSalaryLevels();
		companys = companyService.listCompanys();
		if (id != null)
			this.jobApply = this.service.getJobApply(id);
		return INPUT;
	}
	public String rebuildIndex() {
		//重建索引
		service.rebuildIndex();
		return SUCCESS;
	}

	public String update() {
		if (this.jobApply.getId() != null)
			this.service.updateJobApply(jobApply);
		else
			this.service.saveJobApply(jobApply);
		return SUCCESS;
	}

	public String delete() {
		if (this.id != null) {
			this.service.deleteJobApply(id);
		}
		return SUCCESS;
	}

	public JobApply getJobApply() {
		return jobApply;
	}

	public void setJobApply(JobApply JobApply) {
		this.jobApply = JobApply;
	}

	public List<JobApply> getJobApplys() {
		return jobApplys;
	}

	public void setJobApplys(List<JobApply> JobApplys) {
		this.jobApplys = JobApplys;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setService(IJobApplyService service) {
		this.service = service;
	}

	public List<Company> getCompanys() {
		return companys;
	}

	public List<City> getCitys() {
		return citys;
	}

	public List<Trade> getTrades() {
		return trades;
	}

	public List<SalaryLevel> getSalayLevels() {
		return salayLevels;
	}

	public void setCityService(ICityService cityService) {
		this.cityService = cityService;
	}

	public void setTradeService(ITradeService tradeService) {
		this.tradeService = tradeService;
	}

	public void setCompanyService(ICompanyService companyService) {
		this.companyService = companyService;
	}

	public void setSalaryLevelService(ISalaryLevelService salaryLevelService) {
		this.salaryLevelService = salaryLevelService;
	}
	
}
