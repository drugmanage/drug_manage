package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmAddress;
import com.thinkgem.fast.modules.hrmuser.dao.HrmAddressDao;

/**
 * 第三方收货地址Service
 * @author 任硕
 * @version 2018-11-04
 */
@Service
@Transactional(readOnly = true)
public class HrmAddressService extends CrudService<HrmAddressDao, HrmAddress> {

	public HrmAddress get(String id) {
		return super.get(id);
	}
	
	public List<HrmAddress> findList(HrmAddress hrmAddress) {
		return super.findList(hrmAddress);
	}
	
	public Page<HrmAddress> findPage(Page<HrmAddress> page, HrmAddress hrmAddress) {
		return super.findPage(page, hrmAddress);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmAddress hrmAddress) {
		super.save(hrmAddress);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmAddress hrmAddress) {
		super.delete(hrmAddress);
	}

	public void deleteByHrmUserId(String userId) {

	}
}