package com.thinkgem.fast.modules.sales.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;
import com.thinkgem.fast.modules.sales.dao.SalesGoodsDao;

/**
 * 销售商品Service
 * @author shiao
 * @version 2019-01-16
 */
@Service
@Transactional(readOnly = true)
public class SalesGoodsService extends CrudService<SalesGoodsDao, SalesGoods> {

	public SalesGoods get(String id) {
		return super.get(id);
	}
	
	public List<SalesGoods> findList(SalesGoods salesGoods) {
		return super.findList(salesGoods);
	}
	
	public Page<SalesGoods> findPage(Page<SalesGoods> page, SalesGoods salesGoods) {
		return super.findPage(page, salesGoods);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesGoods salesGoods) {
		super.save(salesGoods);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesGoods salesGoods) {
		super.delete(salesGoods);
	}
	
}