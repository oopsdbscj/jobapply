package com.tabchanj.job.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tabchanj.job.dao.ITradeDAO;
import com.tabchanj.job.domain.Trade;
import com.tabchanj.job.service.ITradeService;


@Transactional(propagation = Propagation.REQUIRED)
public class TradeServiceImpl implements ITradeService {
	private ITradeDAO dao;

	public void setDao(ITradeDAO dao) {
		this.dao = dao;
	}

	@Override
	public void saveTrade(Trade d) {
		this.dao.save(d);
	}

	@Override
	public void updateTrade(Trade d) {
		this.dao.update(d);
	}

	@Override
	public void deleteTrade(Serializable id) {
		this.dao.delete(id);
	}

	@Override
	@Transactional(readOnly = true)
	public Trade getTrade(Serializable id) {
		return this.dao.get(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Trade> listTrades() {
		return this.dao.list();
	}

}
