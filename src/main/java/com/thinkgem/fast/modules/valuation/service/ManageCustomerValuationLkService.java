package com.thinkgem.fast.modules.valuation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.valuation.entity.ManageCustomerValuationLk;
import com.thinkgem.fast.modules.valuation.dao.ManageCustomerValuationLkDao;

/**
 * 区域经理客户定价关联表Service
 * @author renshuo
 * @version 2019-01-15
 */
@Service
@Transactional(readOnly = true)
public class ManageCustomerValuationLkService extends CrudService<ManageCustomerValuationLkDao, ManageCustomerValuationLk> {

	public ManageCustomerValuationLk get(String id) {
		return super.get(id);
	}
	
	public List<ManageCustomerValuationLk> findList(ManageCustomerValuationLk manageCustomerValuationLk) {
		return super.findList(manageCustomerValuationLk);
	}
	
	public Page<ManageCustomerValuationLk> findPage(Page<ManageCustomerValuationLk> page, ManageCustomerValuationLk manageCustomerValuationLk) {
		return super.findPage(page, manageCustomerValuationLk);
	}
	
	@Transactional(readOnly = false)
	public void save(ManageCustomerValuationLk manageCustomerValuationLk) {
		super.save(manageCustomerValuationLk);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManageCustomerValuationLk manageCustomerValuationLk) {
		super.delete(manageCustomerValuationLk);
	}
	
}