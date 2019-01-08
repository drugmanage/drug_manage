package com.thinkgem.fast.modules.sales.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPrice;
import com.thinkgem.fast.modules.sales.dao.SalesBackDiffPriceDao;

/**
 * 销售退补差价单Service
 * @author shiao
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class SalesBackDiffPriceService extends CrudService<SalesBackDiffPriceDao, SalesBackDiffPrice> {

	public SalesBackDiffPrice get(String id) {
		return super.get(id);
	}
	
	public List<SalesBackDiffPrice> findList(SalesBackDiffPrice salesBackDiffPrice) {
		return super.findList(salesBackDiffPrice);
	}
	
	public Page<SalesBackDiffPrice> findPage(Page<SalesBackDiffPrice> page, SalesBackDiffPrice salesBackDiffPrice) {
		return super.findPage(page, salesBackDiffPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesBackDiffPrice salesBackDiffPrice) {
		super.save(salesBackDiffPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesBackDiffPrice salesBackDiffPrice) {
		super.delete(salesBackDiffPrice);
	}
	
}