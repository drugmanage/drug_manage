package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.entity.SupplierConsigner;
import com.thinkgem.fast.modules.supplier.dao.SupplierConsignerDao;

/**
 * 供应商委托人Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierConsignerService extends CrudService<SupplierConsignerDao, SupplierConsigner> {

	public SupplierConsigner get(String id) {
		return super.get(id);
	}
	
	public List<SupplierConsigner> findList(SupplierConsigner supplierConsigner) {
		return super.findList(supplierConsigner);
	}
	
	public Page<SupplierConsigner> findPage(Page<SupplierConsigner> page, SupplierConsigner supplierConsigner) {
		return super.findPage(page, supplierConsigner);
	}
	
	@Transactional(readOnly = false)
	public void save(SupplierConsigner supplierConsigner) {
		super.save(supplierConsigner);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupplierConsigner supplierConsigner) {
		super.delete(supplierConsigner);
	}
	
}