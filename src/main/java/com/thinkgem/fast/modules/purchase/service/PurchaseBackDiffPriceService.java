package com.thinkgem.fast.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackDiffPrice;
import com.thinkgem.fast.modules.purchase.dao.PurchaseBackDiffPriceDao;

/**
 * 采购补差价单Service
 * @author 刘海涛
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class PurchaseBackDiffPriceService extends CrudService<PurchaseBackDiffPriceDao, PurchaseBackDiffPrice> {

	public PurchaseBackDiffPrice get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseBackDiffPrice> findList(PurchaseBackDiffPrice purchaseBackDiffPrice) {
		return super.findList(purchaseBackDiffPrice);
	}
	
	public Page<PurchaseBackDiffPrice> findPage(Page<PurchaseBackDiffPrice> page, PurchaseBackDiffPrice purchaseBackDiffPrice) {
		return super.findPage(page, purchaseBackDiffPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseBackDiffPrice purchaseBackDiffPrice) {
		super.save(purchaseBackDiffPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseBackDiffPrice purchaseBackDiffPrice) {
		super.delete(purchaseBackDiffPrice);
	}
	
}