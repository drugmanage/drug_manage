package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmWorkExper;
import com.thinkgem.fast.modules.hrmuser.dao.HrmWorkExperDao;

/**
 * 工作经历Service
 * @author 任硕
 * @version 2018-11-03
 */
@Service
@Transactional(readOnly = true)
public class HrmWorkExperService extends CrudService<HrmWorkExperDao, HrmWorkExper> {

	public HrmWorkExper get(String id) {
		return super.get(id);
	}
	
	public List<HrmWorkExper> findList(HrmWorkExper hrmWorkExper) {
		return super.findList(hrmWorkExper);
	}
	
	public Page<HrmWorkExper> findPage(Page<HrmWorkExper> page, HrmWorkExper hrmWorkExper) {
		return super.findPage(page, hrmWorkExper);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmWorkExper hrmWorkExper) {
		super.save(hrmWorkExper);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmWorkExper hrmWorkExper) {
		super.delete(hrmWorkExper);
	}
	
}