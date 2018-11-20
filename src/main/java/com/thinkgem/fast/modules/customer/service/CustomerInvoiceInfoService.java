package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.CustomerInvoiceInfo;
import com.thinkgem.fast.modules.customer.dao.CustomerInvoiceInfoDao;

/**
 * 开票信息Service
 * @author 刘海涛
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CustomerInvoiceInfoService extends CrudService<CustomerInvoiceInfoDao, CustomerInvoiceInfo> {

	public CustomerInvoiceInfo get(String id) {
		return super.get(id);
	}
	
	public List<CustomerInvoiceInfo> findList(CustomerInvoiceInfo customerInvoiceInfo) {
		return super.findList(customerInvoiceInfo);
	}
	
	public Page<CustomerInvoiceInfo> findPage(Page<CustomerInvoiceInfo> page, CustomerInvoiceInfo customerInvoiceInfo) {
		return super.findPage(page, customerInvoiceInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerInvoiceInfo customerInvoiceInfo) {
		super.save(customerInvoiceInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerInvoiceInfo customerInvoiceInfo) {
		super.delete(customerInvoiceInfo);
	}
	
}