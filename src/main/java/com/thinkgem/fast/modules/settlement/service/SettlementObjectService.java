package com.thinkgem.fast.modules.settlement.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;
import com.thinkgem.fast.modules.settlement.dao.SettlementObjectDao;

/**
 * 结算对象信息Service
 * @author 任硕
 * @version 2018-11-18
 */
@Service
@Transactional(readOnly = true)
public class SettlementObjectService extends CrudService<SettlementObjectDao, SettlementObject> {

	public SettlementObject get(String id) {
		return super.get(id);
	}
	
	public List<SettlementObject> findList(SettlementObject settlementObject) {
		return super.findList(settlementObject);
	}
	
	public Page<SettlementObject> findPage(Page<SettlementObject> page, SettlementObject settlementObject) {
		return super.findPage(page, settlementObject);
	}
	
	@Transactional(readOnly = false)
	public void save(SettlementObject settlementObject) {
		super.save(settlementObject);
	}
	
	@Transactional(readOnly = false)
	public void delete(SettlementObject settlementObject) {
		super.delete(settlementObject);
	}
	
}