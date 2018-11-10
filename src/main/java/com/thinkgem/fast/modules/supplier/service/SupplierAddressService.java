package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.entity.SupplierAddress;
import com.thinkgem.fast.modules.supplier.dao.SupplierAddressDao;

/**
 * 供应商收货地址Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierAddressService extends CrudService<SupplierAddressDao, SupplierAddress> {

	public SupplierAddress get(String id) {
		return super.get(id);
	}
	
	public List<SupplierAddress> findList(SupplierAddress supplierAddress) {
		return super.findList(supplierAddress);
	}
	
	public Page<SupplierAddress> findPage(Page<SupplierAddress> page, SupplierAddress supplierAddress) {
		return super.findPage(page, supplierAddress);
	}
	
	@Transactional(readOnly = false)
	public void save(SupplierAddress supplierAddress) {
		super.save(supplierAddress);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupplierAddress supplierAddress) {
		super.delete(supplierAddress);
	}
	
}