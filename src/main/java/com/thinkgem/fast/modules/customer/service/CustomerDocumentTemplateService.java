package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.CustomerDocumentTemplate;
import com.thinkgem.fast.modules.customer.dao.CustomerDocumentTemplateDao;

/**
 * 证件模板Service
 * @author 刘海涛
 * @version 2018-11-20
 */
@Service
@Transactional(readOnly = true)
public class CustomerDocumentTemplateService extends CrudService<CustomerDocumentTemplateDao, CustomerDocumentTemplate> {

	public CustomerDocumentTemplate get(String id) {
		return super.get(id);
	}
	
	public List<CustomerDocumentTemplate> findList(CustomerDocumentTemplate customerDocumentTemplate) {
		return super.findList(customerDocumentTemplate);
	}
	
	public Page<CustomerDocumentTemplate> findPage(Page<CustomerDocumentTemplate> page, CustomerDocumentTemplate customerDocumentTemplate) {
		return super.findPage(page, customerDocumentTemplate);
	}
	
	@Transactional(readOnly = false)
	public void save(CustomerDocumentTemplate customerDocumentTemplate) {
		super.save(customerDocumentTemplate);
	}
	
	@Transactional(readOnly = false)
	public void delete(CustomerDocumentTemplate customerDocumentTemplate) {
		super.delete(customerDocumentTemplate);
	}
	
}