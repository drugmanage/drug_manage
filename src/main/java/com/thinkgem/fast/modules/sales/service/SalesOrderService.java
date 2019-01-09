package com.thinkgem.fast.modules.sales.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;
import com.thinkgem.fast.modules.sales.dao.SalesOrderDao;

/**
 * 销售开票单Service
 * @author shiao
 * @version 2019-01-09
 */
@Service
@Transactional(readOnly = true)
public class SalesOrderService extends CrudService<SalesOrderDao, SalesOrder> {

	public SalesOrder get(String id) {
		return super.get(id);
	}
	
	public List<SalesOrder> findList(SalesOrder salesOrder) {
		return super.findList(salesOrder);
	}
	
	public Page<SalesOrder> findPage(Page<SalesOrder> page, SalesOrder salesOrder) {
		return super.findPage(page, salesOrder);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesOrder salesOrder) {
		super.save(salesOrder);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesOrder salesOrder) {
		super.delete(salesOrder);
	}
	
}