package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.entity.SupplierDocumentTemplate;
import com.thinkgem.fast.modules.supplier.dao.SupplierDocumentTemplateDao;

/**
 * 供应商证件模板Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierDocumentTemplateService extends CrudService<SupplierDocumentTemplateDao, SupplierDocumentTemplate> {

	public SupplierDocumentTemplate get(String id) {
		return super.get(id);
	}
	
	public List<SupplierDocumentTemplate> findList(SupplierDocumentTemplate supplierDocumentTemplate) {
		return super.findList(supplierDocumentTemplate);
	}
	
	public Page<SupplierDocumentTemplate> findPage(Page<SupplierDocumentTemplate> page, SupplierDocumentTemplate supplierDocumentTemplate) {
		return super.findPage(page, supplierDocumentTemplate);
	}
	
	@Transactional(readOnly = false)
	public void save(SupplierDocumentTemplate supplierDocumentTemplate) {
		super.save(supplierDocumentTemplate);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupplierDocumentTemplate supplierDocumentTemplate) {
		super.delete(supplierDocumentTemplate);
	}
	
}