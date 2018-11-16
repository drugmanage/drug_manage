package com.thinkgem.fast.modules.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.dao.GoodsDao;

/**
 * 商品资料Service
 * @author 刘海涛
 * @version 2018-11-17
 */
@Service
@Transactional(readOnly = true)
public class GoodsService extends CrudService<GoodsDao, Goods> {

	@Autowired
	private GoodsDao goodsDao;
	public Goods get(String id) {
		return super.get(id);
	}
	
	public List<Goods> findList(Goods goods) {
		return super.findList(goods);
	}
	
	public Page<Goods> findPage(Page<Goods> page, Goods goods) {
		return super.findPage(page, goods);
	}
	
	@Transactional(readOnly = false)
	public void save(Goods goods) {
		super.save(goods);
	}
	
	@Transactional(readOnly = false)
	public void delete(Goods goods) {
		super.delete(goods);
	}

	public int findCount() {

		return goodsDao.findCount();
	}
}