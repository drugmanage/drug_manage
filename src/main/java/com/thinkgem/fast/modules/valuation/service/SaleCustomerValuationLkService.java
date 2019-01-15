package com.thinkgem.fast.modules.valuation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.valuation.entity.SaleCustomerValuationLk;
import com.thinkgem.fast.modules.valuation.dao.SaleCustomerValuationLkDao;

/**
 * 业务员客户定价关联表Service
 * @author renshuo
 * @version 2019-01-15
 */
@Service
@Transactional(readOnly = true)
public class SaleCustomerValuationLkService extends CrudService<SaleCustomerValuationLkDao, SaleCustomerValuationLk> {

	public SaleCustomerValuationLk get(String id) {
		return super.get(id);
	}
	
	public List<SaleCustomerValuationLk> findList(SaleCustomerValuationLk saleCustomerValuationLk) {
		return super.findList(saleCustomerValuationLk);
	}
	
	public Page<SaleCustomerValuationLk> findPage(Page<SaleCustomerValuationLk> page, SaleCustomerValuationLk saleCustomerValuationLk) {
		return super.findPage(page, saleCustomerValuationLk);
	}
	
	@Transactional(readOnly = false)
	public void save(SaleCustomerValuationLk saleCustomerValuationLk) {
		super.save(saleCustomerValuationLk);
	}
	
	@Transactional(readOnly = false)
	public void delete(SaleCustomerValuationLk saleCustomerValuationLk) {
		super.delete(saleCustomerValuationLk);
	}
	
}