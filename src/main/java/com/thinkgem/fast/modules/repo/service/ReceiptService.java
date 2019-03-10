package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.Receipt;
import com.thinkgem.fast.modules.repo.dao.ReceiptDao;

/**
 * 收货单Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class ReceiptService extends CrudService<ReceiptDao, Receipt> {

	public Receipt get(String id) {
		return super.get(id);
	}
	
	public List<Receipt> findList(Receipt receipt) {
		return super.findList(receipt);
	}
	
	public Page<Receipt> findPage(Page<Receipt> page, Receipt receipt) {
		return super.findPage(page, receipt);
	}
	
	@Transactional(readOnly = false)
	public void save(Receipt receipt) {
		super.save(receipt);
	}
	
	@Transactional(readOnly = false)
	public void delete(Receipt receipt) {
		super.delete(receipt);
	}
	
}