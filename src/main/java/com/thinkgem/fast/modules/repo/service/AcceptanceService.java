package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.Acceptance;
import com.thinkgem.fast.modules.repo.dao.AcceptanceDao;

/**
 * 验收单Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class AcceptanceService extends CrudService<AcceptanceDao, Acceptance> {

	public Acceptance get(String id) {
		return super.get(id);
	}
	
	public List<Acceptance> findList(Acceptance acceptance) {
		return super.findList(acceptance);
	}
	
	public Page<Acceptance> findPage(Page<Acceptance> page, Acceptance acceptance) {
		return super.findPage(page, acceptance);
	}
	
	@Transactional(readOnly = false)
	public void save(Acceptance acceptance) {
		super.save(acceptance);
	}
	
	@Transactional(readOnly = false)
	public void delete(Acceptance acceptance) {
		super.delete(acceptance);
	}
	
}