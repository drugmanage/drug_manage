package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.Stock;
import com.thinkgem.fast.modules.repo.dao.StockDao;

/**
 * 库存查询Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class StockService extends CrudService<StockDao, Stock> {

	public Stock get(String id) {
		return super.get(id);
	}
	
	public List<Stock> findList(Stock stock) {
		return super.findList(stock);
	}
	
	public Page<Stock> findPage(Page<Stock> page, Stock stock) {
		return super.findPage(page, stock);
	}
	
	@Transactional(readOnly = false)
	public void save(Stock stock) {
		super.save(stock);
	}
	
	@Transactional(readOnly = false)
	public void delete(Stock stock) {
		super.delete(stock);
	}
	
}