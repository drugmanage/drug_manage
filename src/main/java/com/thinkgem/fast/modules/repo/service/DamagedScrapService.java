package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.DamagedScrap;
import com.thinkgem.fast.modules.repo.dao.DamagedScrapDao;

/**
 * 破损/报废单Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class DamagedScrapService extends CrudService<DamagedScrapDao, DamagedScrap> {

	public DamagedScrap get(String id) {
		return super.get(id);
	}
	
	public List<DamagedScrap> findList(DamagedScrap damagedScrap) {
		return super.findList(damagedScrap);
	}
	
	public Page<DamagedScrap> findPage(Page<DamagedScrap> page, DamagedScrap damagedScrap) {
		return super.findPage(page, damagedScrap);
	}
	
	@Transactional(readOnly = false)
	public void save(DamagedScrap damagedScrap) {
		super.save(damagedScrap);
	}
	
	@Transactional(readOnly = false)
	public void delete(DamagedScrap damagedScrap) {
		super.delete(damagedScrap);
	}
	
}