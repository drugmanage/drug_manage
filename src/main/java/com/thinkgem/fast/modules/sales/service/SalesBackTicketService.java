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
import com.thinkgem.fast.modules.sales.dao.SalesBackTicketDao;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicket;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicketVo;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;

/**
 * 销售退回开票单Service
 * @author shiao
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class SalesBackTicketService extends CrudService<SalesBackTicketDao, SalesBackTicket> {
	
	@Autowired
	private SalesBackTicketDao salesBackTicketDao;

	@Autowired
	private SalesGoodsService salesGoodsService;

	@Autowired
	private GoodsService goodsService;
	
	public SalesBackTicket get(String id) {
		SalesBackTicket salesBackTicket = super.get(id);
		// 查找与目标对象同一退款单号的
		SalesBackTicket salesBackTicketForQuery = new SalesBackTicket();
		salesBackTicketForQuery.setBackTicketNumber(salesBackTicket.getBackTicketNumber());
		List<SalesBackTicket> salesBackTicketList = this.findList(salesBackTicketForQuery);
		// 构造要显示的列表内容
		List<SalesBackTicketVo> salesBackTicketVoList = new ArrayList<SalesBackTicketVo>();
		for (SalesBackTicket salesBackTicket1 : salesBackTicketList){
			SalesGoods salesGoods = salesGoodsService.get(salesBackTicket1.getSalesGoods().getId());
			Goods goods = goodsService.get(salesGoods.getGoods().getId());
			SalesGoodsVo salesGoodsVo = new SalesGoodsVo(salesGoods, goods);
			SalesBackTicketVo salesBackTicketVo = new SalesBackTicketVo(salesBackTicket1, salesGoodsVo);
			salesBackTicketVoList.add(salesBackTicketVo);
		}
		salesBackTicket.setSalesBackTicketVoList(salesBackTicketVoList);
		return salesBackTicket;
	}
	
	public List<SalesBackTicket> findList(SalesBackTicket salesBackTicket) {
		return super.findList(salesBackTicket);
	}
	
	public Page<SalesBackTicket> findPage(Page<SalesBackTicket> page, SalesBackTicket salesBackTicket) {
		return super.findPage(page, salesBackTicket);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesBackTicket salesBackTicket) {
		List<SalesBackTicketVo> salesBackTicketVoList = salesBackTicket.getSalesBackTicketVoList();
		for (SalesBackTicketVo salesBackTicketVo : salesBackTicketVoList){
			SalesBackTicket salesBackTicketSave = new SalesBackTicket(salesBackTicketVo);
			salesBackTicketSave.setBackTicketNumber(salesBackTicket.getBackTicketNumber());
			salesBackTicketSave.setSalesOrder(salesBackTicket.getSalesOrder());
			super.save(salesBackTicketSave);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesBackTicket salesBackTicket) {
		super.delete(salesBackTicket);
	}
	
	public SalesBackTicket findFirstByOrderNumLikeOrderByOrderNumDesc() {
		return salesBackTicketDao.findFirstByOrderNumLikeOrderByOrderNumDesc();
	}
}