package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.CustomerConsigner;
import com.thinkgem.fast.modules.customer.dao.CustomerConsignerDao;

/**
 * 委托人Service
 * @author 刘海涛
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CustomerConsignerService extends CrudService<CustomerConsignerDao, CustomerConsigner> {

	public CustomerConsigner get(String id) {
		return super.get(id);
	}
	
	public List<CustomerConsigner> findList(CustomerConsigner customerConsigner) {
		return super.findList(customerConsigner);
	}
	
	public Page<CustomerConsigner> findPage(Page<CustomerConsigner> page, CustomerConsigner customerConsigner) {
		return super.findPage(page, customerConsigner);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerConsigner customerConsigner) {
		super.save(customerConsigner);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerConsigner customerConsigner) {
		super.delete(customerConsigner);
	}
	
}