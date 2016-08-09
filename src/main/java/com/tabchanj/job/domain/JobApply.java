package com.tabchanj.job.domain;

/**
 * 职位对象
 * @author Administrator
 *
 */
public class JobApply {
	private Long id;
	private String title;
	private String content;
	
	private Company company;
	private City city;
	private SalaryLevel salaryLevel;
	private Trade trade;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public SalaryLevel getSalaryLevel() {
		return salaryLevel;
	}
	public void setSalaryLevel(SalaryLevel salaryLevel) {
		this.salaryLevel = salaryLevel;
	}
	public Trade getTrade() {
		return trade;
	}
	public void setTrade(Trade trade) {
		this.trade = trade;
	}
}
