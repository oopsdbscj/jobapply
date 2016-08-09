package com.tabchanj.job.service;

import java.io.Serializable;
import java.util.List;

import com.tabchanj.job.domain.JobApply;


public interface IJobApplyService {
	void saveJobApply(JobApply u);

	void updateJobApply(JobApply u);

	void deleteJobApply(Serializable id);

	JobApply getJobApply(Serializable id);

	List<JobApply> listJobApplys();

	void rebuildIndex();

}
