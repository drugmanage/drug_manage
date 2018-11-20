package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.CustomerAddress;
import com.thinkgem.fast.modules.customer.dao.CustomerAddressDao;

/**
 * 客户收货地址Service
 * @author 刘海涛
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CustomerAddressService extends CrudService<CustomerAddressDao, CustomerAddress> {

	public CustomerAddress get(String id) {
		return super.get(id);
	}
	
	public List<CustomerAddress> findList(CustomerAddress customerAddress) {
		return super.findList(customerAddress);
	}
	
	public Page<CustomerAddress> findPage(Page<CustomerAddress> page, CustomerAddress customerAddress) {
		return super.findPage(page, customerAddress);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerAddress customerAddress) {
		super.save(customerAddress);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerAddress customerAddress) {
		super.delete(customerAddress);
	}
	
}