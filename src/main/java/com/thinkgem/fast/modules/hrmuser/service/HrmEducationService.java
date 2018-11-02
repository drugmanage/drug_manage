package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmEducation;
import com.thinkgem.fast.modules.hrmuser.dao.HrmEducationDao;

/**
 * 教育信息Service
 * @author 任硕
 * @version 2018-11-03
 */
@Service
@Transactional(readOnly = true)
public class HrmEducationService extends CrudService<HrmEducationDao, HrmEducation> {

	public HrmEducation get(String id) {
		return super.get(id);
	}
	
	public List<HrmEducation> findList(HrmEducation hrmEducation) {
		return super.findList(hrmEducation);
	}
	
	public Page<HrmEducation> findPage(Page<HrmEducation> page, HrmEducation hrmEducation) {
		return super.findPage(page, hrmEducation);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmEducation hrmEducation) {
		super.save(hrmEducation);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmEducation hrmEducation) {
		super.delete(hrmEducation);
	}
	
}