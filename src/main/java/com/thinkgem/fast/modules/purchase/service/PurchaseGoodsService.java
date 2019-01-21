package com.thinkgem.fast.modules.purchase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
import com.thinkgem.fast.modules.purchase.dao.PurchaseGoodsDao;

/**
 * 采购商品Service
 * @author 刘海涛
 * @version 2018-12-24
 */
@Service
@Transactional(readOnly = true)
public class PurchaseGoodsService extends CrudService<PurchaseGoodsDao, PurchaseGoods> {

	public PurchaseGoods get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseGoods> findList(PurchaseGoods purchaseGoods) {
		return super.findList(purchaseGoods);
	}
	
	public Page<PurchaseGoods> findPage(Page<PurchaseGoods> page, PurchaseGoods purchaseGoods) {
		return super.findPage(page, purchaseGoods);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseGoods purchaseGoods) {
		super.save(purchaseGoods);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseGoods purchaseGoods) {
		super.delete(purchaseGoods);
	}

}