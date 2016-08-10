package com.tabchanj.job.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tabchanj.job.dao.IJobApplyDAO;
import com.tabchanj.job.domain.JobApply;
import com.tabchanj.job.index.JobApplyIndexHelper;
import com.tabchanj.job.query.JobApplyQuery;
import com.tabchanj.job.service.IJobApplyService;

@Transactional(propagation = Propagation.REQUIRED)
public class JobApplyServiceImpl implements IJobApplyService {
	private IJobApplyDAO dao;
	private JobApplyIndexHelper indexHelper;

	public void setIndexHelper(JobApplyIndexHelper indexHelper) {
		this.indexHelper = indexHelper;
	}

	public void setDao(IJobApplyDAO dao) {
		this.dao = dao;
	}

	@Override
	public void saveJobApply(JobApply d) {
		this.dao.save(d);
	}

	@Override
	public void updateJobApply(JobApply d) {
		this.dao.update(d);
	}

	@Override
	public void deleteJobApply(Serializable id) {
		this.dao.delete(id);
	}

	@Override
	@Transactional(readOnly = true)
	public JobApply getJobApply(Serializable id) {
		return this.dao.get(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<JobApply> listJobApplys() {
		return this.dao.list();
	}

	@Override
	public void rebuildIndex() {
		// 查询出所有的jobApply数据
		List<JobApply> jobApplies = dao.list();
		// 对所有的数据重建索引
		indexHelper.createIndex(jobApplies, true);

	}

	@Override
	public List<Map<String, Object>> search(JobApplyQuery qo) {
		return indexHelper.search(qo.getQuery());
	}

}
