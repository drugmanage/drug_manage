package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUser;
import com.thinkgem.fast.modules.hrmuser.dao.HrmUserDao;

/**
 * 内部员工信息操作Service
 * @author 任硕
 * @version 2018-11-02
 */
@Service
@Transactional(readOnly = true)
public class HrmUserService extends CrudService<HrmUserDao, HrmUser> {

	@Autowired
	private HrmUserDao hrmUserDao;
	public HrmUser get(String id) {
		return super.get(id);
	}
	
	public List<HrmUser> findList(HrmUser hrmUser) {
		return super.findList(hrmUser);
	}
	
	public Page<HrmUser> findPage(Page<HrmUser> page, HrmUser hrmUser) {
		return super.findPage(page, hrmUser);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmUser hrmUser) {
		super.save(hrmUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmUser hrmUser) {
		super.delete(hrmUser);
	}

	public int findCount(){
		return hrmUserDao.findCount();
	}
}