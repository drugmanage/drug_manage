package com.thinkgem.fast.modules.valuation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.valuation.entity.GoodsValuation;
import com.thinkgem.fast.modules.valuation.dao.GoodsValuationDao;

/**
 * 商品定价Service
 * @author renshuo
 * @version 2019-01-16
 */
@Service
@Transactional(readOnly = true)
public class GoodsValuationService extends CrudService<GoodsValuationDao, GoodsValuation> {

	public GoodsValuation get(String id) {
		return super.get(id);
	}
	
	public List<GoodsValuation> findList(GoodsValuation goodsValuation) {
		return super.findList(goodsValuation);
	}
	
	public Page<GoodsValuation> findPage(Page<GoodsValuation> page, GoodsValuation goodsValuation) {
		return super.findPage(page, goodsValuation);
	}
	
	@Transactional(readOnly = false)
	public void save(GoodsValuation goodsValuation) {
		super.save(goodsValuation);
	}
	
	@Transactional(readOnly = false)
	public void delete(GoodsValuation goodsValuation) {
		super.delete(goodsValuation);
	}
	
}