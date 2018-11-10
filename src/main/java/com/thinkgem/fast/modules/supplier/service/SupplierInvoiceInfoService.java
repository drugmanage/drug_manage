package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.entity.SupplierInvoiceInfo;
import com.thinkgem.fast.modules.supplier.dao.SupplierInvoiceInfoDao;

/**
 * 供应商开票信息Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierInvoiceInfoService extends CrudService<SupplierInvoiceInfoDao, SupplierInvoiceInfo> {

	public SupplierInvoiceInfo get(String id) {
		return super.get(id);
	}
	
	public List<SupplierInvoiceInfo> findList(SupplierInvoiceInfo supplierInvoiceInfo) {
		return super.findList(supplierInvoiceInfo);
	}
	
	public Page<SupplierInvoiceInfo> findPage(Page<SupplierInvoiceInfo> page, SupplierInvoiceInfo supplierInvoiceInfo) {
		return super.findPage(page, supplierInvoiceInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(SupplierInvoiceInfo supplierInvoiceInfo) {
		super.save(supplierInvoiceInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupplierInvoiceInfo supplierInvoiceInfo) {
		super.delete(supplierInvoiceInfo);
	}
	
}