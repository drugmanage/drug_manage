package com.thinkgem.fast.modules.sales.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
import com.thinkgem.fast.modules.sales.dao.SalesBackDiffPriceDao;
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPrice;
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPriceVo;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;

/**
 * 销售退补差价单Service
 * @author shiao
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class SalesBackDiffPriceService extends CrudService<SalesBackDiffPriceDao, SalesBackDiffPrice> {
	
	@Autowired
	private SalesBackDiffPriceDao salesBackDiffPriceDao;

	@Autowired
	private SalesGoodsService salesGoodsService;

	@Autowired
	private GoodsService goodsService;
	
	public SalesBackDiffPrice get(String id) {
		SalesBackDiffPrice salesBackDiffPrice = super.get(id);
		// 查找与目标对象同一退款单号的
		SalesBackDiffPrice salesBackDiffPriceForQuery = new SalesBackDiffPrice();
		salesBackDiffPriceForQuery.setBackDiffPriceNumber(salesBackDiffPrice.getBackDiffPriceNumber());
		List<SalesBackDiffPrice> salesBackDiffPriceList = this.findList(salesBackDiffPriceForQuery);
		// 构造要显示的列表内容
		List<SalesBackDiffPriceVo> salesBackDiffPriceVoList = new ArrayList<SalesBackDiffPriceVo>();
		for (SalesBackDiffPrice salesBackDiffPrice1 : salesBackDiffPriceList){
			SalesGoods salesGoods = salesGoodsService.get(salesBackDiffPrice1.getSalesGoods().getId());
			Goods goods = goodsService.get(salesGoods.getGoods().getId());
			SalesGoodsVo salesGoodsVo = new SalesGoodsVo(salesGoods, goods);
			SalesBackDiffPriceVo salesBackDiffPriceVo = new SalesBackDiffPriceVo(salesBackDiffPrice1, salesGoodsVo);
			salesBackDiffPriceVoList.add(salesBackDiffPriceVo);
		}
		salesBackDiffPrice.setSalesBackDiffPriceVoList(salesBackDiffPriceVoList);
		return salesBackDiffPrice;
	}
	
	public List<SalesBackDiffPrice> findList(SalesBackDiffPrice salesBackDiffPrice) {
		return super.findList(salesBackDiffPrice);
	}
	
	public Page<SalesBackDiffPrice> findPage(Page<SalesBackDiffPrice> page, SalesBackDiffPrice salesBackDiffPrice) {
		return super.findPage(page, salesBackDiffPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesBackDiffPrice salesBackDiffPrice) {
		List<SalesBackDiffPriceVo> salesBackDiffPriceVoList = salesBackDiffPrice.getSalesBackDiffPriceVoList();
		for (SalesBackDiffPriceVo salesBackDiffPriceVo : salesBackDiffPriceVoList){
			SalesBackDiffPrice salesBackDiffPriceSave = new SalesBackDiffPrice(salesBackDiffPriceVo);
			salesBackDiffPriceSave.setBackDiffPriceNumber(salesBackDiffPrice.getBackDiffPriceNumber());
			salesBackDiffPriceSave.setSalesOrder(salesBackDiffPrice.getSalesOrder());
			super.save(salesBackDiffPriceSave);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesBackDiffPrice salesBackDiffPrice) {
		super.delete(salesBackDiffPrice);
	}
	
	public SalesBackDiffPrice findFirstByOrderNumLikeOrderByOrderNumDesc() {
		return salesBackDiffPriceDao.findFirstByOrderNumLikeOrderByOrderNumDesc();
	}
}