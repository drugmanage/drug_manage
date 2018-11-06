package com.thinkgem.fast.modules.oa.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.oa.entity.HrmRegularApply;
import com.thinkgem.fast.modules.oa.dao.HrmRegularApplyDao;

/**
 * 转正申请Service
 * @author 任硕
 * @version 2018-11-07
 */
@Service
@Transactional(readOnly = true)
public class HrmRegularApplyService extends CrudService<HrmRegularApplyDao, HrmRegularApply> {

	public HrmRegularApply get(String id) {
		return super.get(id);
	}
	
	public List<HrmRegularApply> findList(HrmRegularApply hrmRegularApply) {
		return super.findList(hrmRegularApply);
	}
	
	public Page<HrmRegularApply> findPage(Page<HrmRegularApply> page, HrmRegularApply hrmRegularApply) {
		return super.findPage(page, hrmRegularApply);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmRegularApply hrmRegularApply) {
		super.save(hrmRegularApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmRegularApply hrmRegularApply) {
		super.delete(hrmRegularApply);
	}
	
}