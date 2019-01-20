package com.thinkgem.fast.modules.sales.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
import com.thinkgem.fast.modules.sales.dao.SalesOrderDao;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;

/**
 * 销售开票单Service
 * @author shiao
 * @version 2019-01-09
 */
@Service
@Transactional(readOnly = true)
public class SalesOrderService extends CrudService<SalesOrderDao, SalesOrder> {
	@Autowired
	protected SalesOrderDao salesOrderdao;
	
	@Autowired
    private SalesGoodsService salesGoodsService;

	@Autowired
	private GoodsService goodsService;
	    
	public SalesOrder get(String id) {
		SalesOrder salesOrder = super.get(id);
		// set要显示的订单商品
		salesOrder.setGoodsList(this.getSalesGoodsVoList(salesOrder));
		return salesOrder;
	}
	
	public List<SalesOrder> findList(SalesOrder salesOrder) {
		List<SalesOrder> salesOrderList = super.findList(salesOrder);
		for(SalesOrder so : salesOrderList) {
			so.setGoodsList(this.getSalesGoodsVoList(so));
		}
		return salesOrderList;
	}
	
	public Page<SalesOrder> findPage(Page<SalesOrder> page, SalesOrder salesOrder) {
		Page<SalesOrder> salesOrderPage = super.findPage(page, salesOrder);
		for(SalesOrder so : salesOrderPage.getList()) {
			so.setGoodsList(this.getSalesGoodsVoList(so));
		}
		return salesOrderPage;
	}
	
	@Transactional(readOnly = false)
	public void save(SalesOrder salesOrder) {
		List<SalesGoodsVo> saleGoodsVoList = salesOrder.getGoodsList();
        if (CollectionUtils.isNotEmpty(saleGoodsVoList)) {
            for (SalesGoodsVo salesGoodsVo : saleGoodsVoList) {
                // 通过salesGoodsVo构造salesGoods得到采购商品订单信息
                SalesGoods salesGoods = new SalesGoods(salesGoodsVo);
                salesGoods.setSalesOrder(salesOrder);
                salesGoods.setGoods(goodsService.get(salesGoodsVo.getGoodsId()));
                // 暂时将税相关字段置空
                salesGoods.setTax(null);
                salesGoods.setTaxFree(null);
                salesGoods.setTaxAmount(null);
                salesGoods.setTaxRate(null);
                salesGoodsService.save(salesGoods);
            }
        }
		super.save(salesOrder);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesOrder salesOrder) {
		super.delete(salesOrder);
	}
	
	
	public SalesOrder findFirstByOrderNumLikeOrderByOrderNumDesc() {
        return salesOrderdao.findFirstByOrderNumLikeOrderByOrderNumDesc();
	}
	
	/**
	   * 构造页面显示的销售商品列表
     *
     * @param salesOrder
     * @return
     */
    public List<SalesGoodsVo> getSalesGoodsVoList(SalesOrder salesOrder) {
        List<SalesGoodsVo> salesGoodsVoList = new ArrayList<SalesGoodsVo>();
        SalesGoods salesGoods = new SalesGoods();
        salesGoods.setSalesOrder(salesOrder);
        List<SalesGoods> salesGoodsList = salesGoodsService.findList(salesGoods);
        // 构造要显示的订单商品
        for (SalesGoods sg : salesGoodsList) {
            Goods goods = goodsService.get(sg.getGoods().getId());
            SalesGoodsVo salesGoodsVo = new SalesGoodsVo(sg,goods);
            salesGoodsVoList.add(salesGoodsVo);
        }
        return salesGoodsVoList;
    }
	
}