package com.thinkgem.fast.modules.sales.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicket;
import com.thinkgem.fast.modules.sales.dao.SalesBackTicketDao;

/**
 * 销售退回开票单Service
 * @author shiao
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class SalesBackTicketService extends CrudService<SalesBackTicketDao, SalesBackTicket> {

	public SalesBackTicket get(String id) {
		return super.get(id);
	}
	
	public List<SalesBackTicket> findList(SalesBackTicket salesBackTicket) {
		return super.findList(salesBackTicket);
	}
	
	public Page<SalesBackTicket> findPage(Page<SalesBackTicket> page, SalesBackTicket salesBackTicket) {
		return super.findPage(page, salesBackTicket);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesBackTicket salesBackTicket) {
		super.save(salesBackTicket);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesBackTicket salesBackTicket) {
		super.delete(salesBackTicket);
	}
	
}