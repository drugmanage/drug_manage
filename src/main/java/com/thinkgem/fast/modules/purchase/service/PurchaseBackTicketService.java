package com.thinkgem.fast.modules.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicket;
import com.thinkgem.fast.modules.purchase.dao.PurchaseBackTicketDao;

/**
 * 采购退款开票单Service
 * @author 刘海涛
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class PurchaseBackTicketService extends CrudService<PurchaseBackTicketDao, PurchaseBackTicket> {

	@Autowired
	private PurchaseBackTicketDao purchaseBackTicketDao;

	public PurchaseBackTicket get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseBackTicket> findList(PurchaseBackTicket purchaseBackTicket) {
		return super.findList(purchaseBackTicket);
	}
	
	public Page<PurchaseBackTicket> findPage(Page<PurchaseBackTicket> page, PurchaseBackTicket purchaseBackTicket) {
		return super.findPage(page, purchaseBackTicket);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseBackTicket purchaseBackTicket) {
		super.save(purchaseBackTicket);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseBackTicket purchaseBackTicket) {
		super.delete(purchaseBackTicket);
	}

	public PurchaseBackTicket findFirstByOrderNumLikeOrderByOrderNumDesc() {
		return purchaseBackTicketDao.findFirstByOrderNumLikeOrderByOrderNumDesc();
	}

}