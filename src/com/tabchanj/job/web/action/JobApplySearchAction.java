package com.tabchanj.job.web.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tabchanj.job.query.JobApplyQuery;
import com.tabchanj.job.service.ICityService;
import com.tabchanj.job.service.ICompanyService;
import com.tabchanj.job.service.IJobApplyService;
import com.tabchanj.job.service.ISalaryLevelService;
import com.tabchanj.job.service.ITradeService;

public class JobApplySearchAction extends ActionSupport {
	private static final long serialVersionUID = -2553979705523059839L;
	private IJobApplyService service;
	private ICityService cityService;
	private ITradeService tradeService;
	private ICompanyService companyService;
	private ISalaryLevelService salaryLevelService;
	private JobApplyQuery qo;

	public void setService(IJobApplyService service) {
		this.service = service;
	}

	public JobApplyQuery getQo() {
		return qo;
	}

	public void setQo(JobApplyQuery qo) {
		this.qo = qo;
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

	/**
	 * 在不加方法名参数访问本action时,默认导航到search.jsp
	 */
	@Override
	public String execute() throws Exception {
		setPreparedSelectData();
		return "search";
	}

	/**
	 * 将搜索候选框中的数据设置到ActionContext中
	 */
	private void setPreparedSelectData() {
		ActionContext.getContext().put("cities", cityService.listCitys());
		ActionContext.getContext().put("rades", tradeService.listTrades());
		ActionContext.getContext().put("companyTypes", companyService.listCompanys());
		ActionContext.getContext().put("salaryLevels", salaryLevelService.listSalaryLevels());
	}

	/**
	 * 在用户点击搜索按钮后,返回结果数据
	 * 
	 * @return
	 * @throws Exception
	 */
	public String search() throws Exception {
		// 设置搜索条件下拉框的数据
		setPreparedSelectData();
		// 查询
		List<Map<String, Object>> results = service.search(qo);
		ActionContext.getContext().put("results", results);
		return "search";
	}

}
