package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmBank;
import com.thinkgem.fast.modules.hrmuser.dao.HrmBankDao;

/**
 * 银行卡信息Service
 * @author 任硕
 * @version 2018-11-04
 */
@Service
@Transactional(readOnly = true)
public class HrmBankService extends CrudService<HrmBankDao, HrmBank> {

	public HrmBank get(String id) {
		return super.get(id);
	}
	
	public List<HrmBank> findList(HrmBank hrmBank) {
		return super.findList(hrmBank);
	}
	
	public Page<HrmBank> findPage(Page<HrmBank> page, HrmBank hrmBank) {
		return super.findPage(page, hrmBank);
	}
	
	@Transactional(readOnly = false)
	public void save(HrmBank hrmBank) {
		super.save(hrmBank);
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmBank hrmBank) {
		super.delete(hrmBank);
	}
	
}