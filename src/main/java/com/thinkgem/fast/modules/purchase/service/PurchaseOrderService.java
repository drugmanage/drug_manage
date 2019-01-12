package com.thinkgem.fast.modules.purchase.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoodsVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseOrder;
import com.thinkgem.fast.modules.purchase.dao.PurchaseOrderDao;

/**
 * 采购订单Service
 *
 * @author 刘海涛
 * @version 2018-12-18
 */
@Service
@Transactional(readOnly = true)
public class PurchaseOrderService extends CrudService<PurchaseOrderDao, PurchaseOrder> {

    @Autowired
    private PurchaseGoodsService purchaseGoodsService;

    @Autowired
    private GoodsService goodsService;

    public PurchaseOrder get(String id) {
        PurchaseOrder purchaseOrder = super.get(id);

        List<PurchaseGoodsVo> purchaseGoodsVoList = new ArrayList<PurchaseGoodsVo>();
        PurchaseGoods purchaseGoods = new PurchaseGoods();
        purchaseGoods.setPurchaseOrder(purchaseOrder);
        List<PurchaseGoods> purchaseGoodsList = purchaseGoodsService.findList(purchaseGoods);
        // 构造要显示的采购商品订单
        for (PurchaseGoods purchaseGoods1 : purchaseGoodsList) {
            PurchaseGoodsVo purchaseGoodsVo = new PurchaseGoodsVo(purchaseGoods1);
            purchaseGoodsVoList.add(purchaseGoodsVo);
        }
        purchaseOrder.setGoodsList(purchaseGoodsVoList);
        return purchaseOrder;
    }

    public List<PurchaseOrder> findList(PurchaseOrder purchaseOrder) {
        return super.findList(purchaseOrder);
    }

    public Page<PurchaseOrder> findPage(Page<PurchaseOrder> page, PurchaseOrder purchaseOrder) {
        return super.findPage(page, purchaseOrder);
    }

    @Transactional(readOnly = false)
    public void save(PurchaseOrder purchaseOrder) {
        super.save(purchaseOrder);
        List<PurchaseGoodsVo> purchaseGoodsVoList = purchaseOrder.getGoodsList();
        if (CollectionUtils.isNotEmpty(purchaseGoodsVoList)) {
            for (PurchaseGoodsVo purchaseGoodsVo : purchaseGoodsVoList) {
                // 通过PurchaseGoodsVo构造PurchaseGoods得到采购商品订单信息
                PurchaseGoods purchaseGoods = new PurchaseGoods(purchaseGoodsVo);
                purchaseGoods.setPurchaseOrder(purchaseOrder);
                purchaseGoods.setGoods(goodsService.get(purchaseGoodsVo.getGoodsId()));
                purchaseGoodsService.save(purchaseGoods);
            }
        }
    }

    @Transactional(readOnly = false)
    public void delete(PurchaseOrder purchaseOrder) {
        super.delete(purchaseOrder);
    }

    public List<PurchaseOrder> findTodayList(PurchaseOrder purchaseOrder){
        return  super.findList(purchaseOrder);
    }
}