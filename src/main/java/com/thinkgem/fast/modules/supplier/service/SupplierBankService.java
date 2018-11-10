package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.entity.SupplierBank;
import com.thinkgem.fast.modules.supplier.dao.SupplierBankDao;

/**
 * 供应商银行信息Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierBankService extends CrudService<SupplierBankDao, SupplierBank> {

	public SupplierBank get(String id) {
		return super.get(id);
	}
	
	public List<SupplierBank> findList(SupplierBank supplierBank) {
		return super.findList(supplierBank);
	}
	
	public Page<SupplierBank> findPage(Page<SupplierBank> page, SupplierBank supplierBank) {
		return super.findPage(page, supplierBank);
	}
	
	@Transactional(readOnly = false)
	public void save(SupplierBank supplierBank) {
		super.save(supplierBank);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupplierBank supplierBank) {
		super.delete(supplierBank);
	}
	
}