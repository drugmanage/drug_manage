package com.thinkgem.fast.modules.valuation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.valuation.entity.SaleValuation;
import com.thinkgem.fast.modules.valuation.dao.SaleValuationDao;

/**
 * 业务员定价Service
 * @author renshuo
 * @version 2019-01-16
 */
@Service
@Transactional(readOnly = true)
public class SaleValuationService extends CrudService<SaleValuationDao, SaleValuation> {

	public SaleValuation get(String id) {
		return super.get(id);
	}
	
	public List<SaleValuation> findList(SaleValuation saleValuation) {
		return super.findList(saleValuation);
	}
	
	public Page<SaleValuation> findPage(Page<SaleValuation> page, SaleValuation saleValuation) {
		return super.findPage(page, saleValuation);
	}
	
	@Transactional(readOnly = false)
	public void save(SaleValuation saleValuation) {
		super.save(saleValuation);
	}
	
	@Transactional(readOnly = false)
	public void delete(SaleValuation saleValuation) {
		super.delete(saleValuation);
	}
	
}