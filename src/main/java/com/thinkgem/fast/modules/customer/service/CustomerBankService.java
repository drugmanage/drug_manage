package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.CustomerBank;
import com.thinkgem.fast.modules.customer.dao.CustomerBankDao;

/**
 * 客户银行卡信息Service
 * @author 刘海涛
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CustomerBankService extends CrudService<CustomerBankDao, CustomerBank> {

	public CustomerBank get(String id) {
		return super.get(id);
	}
	
	public List<CustomerBank> findList(CustomerBank customerBank) {
		return super.findList(customerBank);
	}
	
	public Page<CustomerBank> findPage(Page<CustomerBank> page, CustomerBank customerBank) {
		return super.findPage(page, customerBank);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerBank customerBank) {
		super.save(customerBank);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerBank customerBank) {
		super.delete(customerBank);
	}
	
}