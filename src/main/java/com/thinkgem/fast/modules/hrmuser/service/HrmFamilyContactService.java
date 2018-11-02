package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmFamilyContact;
import com.thinkgem.fast.modules.hrmuser.dao.HrmFamilyContactDao;

/**
 * 家庭成员信息Service
 * @author 任硕
 * @version 2018-11-03
 */
@Service
@Transactional(readOnly = true)
public class HrmFamilyContactService extends CrudService<HrmFamilyContactDao, HrmFamilyContact> {

	public HrmFamilyContact get(String id) {
		return super.get(id);
	}
	
	public List<HrmFamilyContact> findList(HrmFamilyContact hrmFamilyContact) {
		return super.findList(hrmFamilyContact);
	}
	
	public Page<HrmFamilyContact> findPage(Page<HrmFamilyContact> page, HrmFamilyContact hrmFamilyContact) {
		return super.findPage(page, hrmFamilyContact);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmFamilyContact hrmFamilyContact) {
		super.save(hrmFamilyContact);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmFamilyContact hrmFamilyContact) {
		super.delete(hrmFamilyContact);
	}
	
}