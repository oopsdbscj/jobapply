package com.tabchanj.job.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;

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
		document.add(new Field("title", jobApply.getTitle(), Store.YES, Index.NO));
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

	/**
	 * 
	 * 搜索索引库
	 * 
	 * @param query
	 */
	public List<Map<String, Object>> search(Query query) {
		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		try {
			// 加载索引库
			IndexReader reader = IndexReader.open(LuceneUtils.getDirectory());
			// 获取加载了Indexreader的索引搜索器
			IndexSearcher searcher = new IndexSearcher(reader);
			// 获取结果对象
			TopDocs docs = searcher.search(query, 1000);
			// 获取结果数组
			ScoreDoc[] socres = docs.scoreDocs;
			// 遍历结果数组
			for (ScoreDoc scoreDoc : socres) {
				// 获取文档编号
				int docNumber = scoreDoc.doc;
				// 根据编号搜索文档
				Document document = searcher.doc(docNumber);
				// 把文档相应的字段封装到集合的map中
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("title", document.get("title"));
				map.put("city", document.get("cityName"));
				map.put("company", document.get("companyName"));
				map.put("trade", document.get("tradeName"));
				map.put("salaryScope", document.get("salaryScope"));
				lists.add(map);
			}

		} catch (Exception e) {
			e.printStackTrace();
//			throw new RuntimeException(e.getMessage());
		}
		return lists;
	}

}
