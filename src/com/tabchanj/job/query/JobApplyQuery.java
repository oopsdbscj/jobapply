package com.tabchanj.job.query;

import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.TermQuery;

import com.tabchanj.job.util.LuceneUtils;

public class JobApplyQuery {
	private String city;
	private String trade;
	private String company;
	private String salaryLevel;
	private String keyWords;

	@Override
	public String toString() {
		return "JobApplyQuery [city=" + city + ", trade=" + trade + ", company=" + company + ", salaryLevel="
				+ salaryLevel + ", keyWords=" + keyWords + "]";
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSalaryLevel() {
		return salaryLevel;
	}

	public void setSalaryLevel(String salaryLevel) {
		this.salaryLevel = salaryLevel;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	/**
	 * 根据用户传入的查询参数,进行查询对象的拼装
	 * 
	 * @return
	 */
	public Query getQuery() {
		try {
			// 创建组合查询对象
			BooleanQuery booleanQuery = new BooleanQuery();
			if (StringUtils.isNotBlank(keyWords)) {
				QueryParser parser = new QueryParser("title", LuceneUtils.getAnalyzer());
				Query query = parser.parse(keyWords + "OR content:" + keyWords);
				booleanQuery.add(query, Occur.MUST);
			}
			if (!"-1".equals(city)) {
				Query query = new TermQuery(new Term("cityId", city));
				booleanQuery.add(query, Occur.MUST);
			}
			if (!"-1".equals(trade)) {
				Query query = new TermQuery(new Term("tradeId", trade));
				booleanQuery.add(query, Occur.MUST);
			}
			if (!"-1".equals(company)) {
				Query query = new TermQuery(new Term("companyId", company));
				booleanQuery.add(query, Occur.MUST);
			}
			if (!"-1".equals(salaryLevel)) {
				Query query = new TermQuery(new Term("salaryId", salaryLevel));
				booleanQuery.add(query, Occur.MUST);
			}
			return booleanQuery;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

}
