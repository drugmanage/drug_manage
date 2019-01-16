package com.thinkgem.fast.modules.valuation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.valuation.entity.ManageValuation;
import com.thinkgem.fast.modules.valuation.dao.ManageValuationDao;

/**
 * 区域经理定价Service
 * @author renshuo
 * @version 2019-01-16
 */
@Service
@Transactional(readOnly = true)
public class ManageValuationService extends CrudService<ManageValuationDao, ManageValuation> {

	public ManageValuation get(String id) {
		return super.get(id);
	}
	
	public List<ManageValuation> findList(ManageValuation manageValuation) {
		return super.findList(manageValuation);
	}
	
	public Page<ManageValuation> findPage(Page<ManageValuation> page, ManageValuation manageValuation) {
		return super.findPage(page, manageValuation);
	}
	
	@Transactional(readOnly = false)
	public void save(ManageValuation manageValuation) {
		super.save(manageValuation);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManageValuation manageValuation) {
		super.delete(manageValuation);
	}
	
}