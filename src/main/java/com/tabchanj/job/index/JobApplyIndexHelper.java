package com.tabchanj.job.index;

import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.IndexWriter;

import com.tabchanj.job.domain.JobApply;
import com.tabchanj.job.util.LuceneUtils;

@SuppressWarnings("deprecation")
public class JobApplyIndexHelper {

	public void createIndex(List<JobApply> jobApplies, boolean rebuild) {
		// 索引写入器,要保证全应用只有一个写入器,多个写入器同时写入会报错
		try {
			IndexWriter indexWriter = LuceneUtils.getIndexWriter();
			if (rebuild) {
				indexWriter.deleteAll();
				indexWriter.commit();
			}
			for (JobApply jobApply : jobApplies) {
				// 将每一条数据包装为document
				Document document = obj2Doc(jobApply);
				// 添加到索引库中
				indexWriter.addDocument(document);
			}
			indexWriter.commit();
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	private Document obj2Doc(JobApply jobApply) {
		Document document = new Document();
		document.add(new Field("id", jobApply.getId() + "", Store.YES, Index.NO));
		document.add(new Field("title", jobApply.getId() + "", Store.YES, Index.NO));
		document.add(new Field("content", jobApply.getContent(), Store.NO, Index.ANALYZED));
		document.add(new Field("companyId", jobApply.getCompany().getId() + "", Store.YES, Index.NOT_ANALYZED));
		document.add(new Field("companyName", jobApply.getCompany().getName(), Store.YES, Index.ANALYZED));
		document.add(new Field("cityName", jobApply.getCity().getName(), Store.YES, Index.ANALYZED));
		document.add(new Field("cityId", jobApply.getCity().getId() + "", Store.YES, Index.NOT_ANALYZED));
		document.add(new Field("tradeId", jobApply.getTrade().getId() + "", Store.YES, Index.NOT_ANALYZED));
		document.add(new Field("tradeName", jobApply.getTrade().getName(), Store.YES, Index.ANALYZED));
		document.add(new Field("salaryScope", jobApply.getSalaryLevel().getName(), Store.YES, Index.ANALYZED));
		document.add(new Field("salaryId", jobApply.getSalaryLevel().getId() + "", Store.YES, Index.NOT_ANALYZED));
		return document;

	}

}
