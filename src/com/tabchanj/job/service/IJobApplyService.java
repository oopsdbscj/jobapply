package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.tabchanj.job.domain.JobApply;
import com.tabchanj.job.query.JobApplyQuery;

public interface IJobApplyService {
	void saveJobApply(JobApply u);

	void updateJobApply(JobApply u);

	void deleteJobApply(Serializable id);

	JobApply getJobApply(Serializable id);

	List<JobApply> listJobApplys();

	void rebuildIndex();

	List<Map<String, Object>> search(JobApplyQuery qo);

}
