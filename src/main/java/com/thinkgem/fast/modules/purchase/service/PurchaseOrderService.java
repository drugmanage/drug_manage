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

    @Autowired
    private PurchaseOrderDao purchaseOrderDao;

    public PurchaseOrder get(String id) {
        PurchaseOrder purchaseOrder = super.get(id);
        // set要显示的订单商品
        purchaseOrder.setGoodsList(this.getPurchaseGoodsVoList(purchaseOrder));
        return purchaseOrder;
    }

    public List<PurchaseOrder> findList(PurchaseOrder purchaseOrder) {
        List<PurchaseOrder> purchaseOrderList = super.findList(purchaseOrder);
        for (PurchaseOrder purchaseOrder1 : purchaseOrderList) {
            purchaseOrder1.setGoodsList(this.getPurchaseGoodsVoList(purchaseOrder1));
        }

        return purchaseOrderList;
    }

    public Page<PurchaseOrder> findPage(Page<PurchaseOrder> page, PurchaseOrder purchaseOrder) {
        Page<PurchaseOrder> purchaseOrderPage = super.findPage(page, purchaseOrder);
        List<PurchaseOrder> purchaseOrderList = purchaseOrderPage.getList();
        for (PurchaseOrder purchaseOrder1 : purchaseOrderList) {
            purchaseOrder1.setGoodsList(this.getPurchaseGoodsVoList(purchaseOrder1));
        }

        return purchaseOrderPage;
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
                // 订单商品的库房与订单库房保持一致
                purchaseGoods.setStoreroomName(purchaseOrder.getStorehouse());
                purchaseGoods.setGoods(goodsService.get(purchaseGoodsVo.getGoodsId()));
                // 暂时将税相关字段置空
                purchaseGoods.setTax(null);
                purchaseGoods.setTaxFree(null);
                purchaseGoods.setTaxAmount(null);
                purchaseGoods.setTaxRate(null);
                purchaseGoodsService.save(purchaseGoods);
            }
        }
    }

    @Transactional(readOnly = false)
    public void delete(PurchaseOrder purchaseOrder) {
        super.delete(purchaseOrder);
    }

    /**
     * 构造页面显示的采购商品列表
     *
     * @param purchaseOrder
     * @return
     */
    public List<PurchaseGoodsVo> getPurchaseGoodsVoList(PurchaseOrder purchaseOrder) {

        List<PurchaseGoodsVo> purchaseGoodsVoList = new ArrayList<PurchaseGoodsVo>();
        PurchaseGoods purchaseGoods = new PurchaseGoods();
        purchaseGoods.setPurchaseOrder(purchaseOrder);
        List<PurchaseGoods> purchaseGoodsList = purchaseGoodsService.findList(purchaseGoods);
        // 构造要显示的订单商品
        for (PurchaseGoods purchaseGoods1 : purchaseGoodsList) {
            Goods goods = goodsService.get(purchaseGoods1.getGoods().getId());
            PurchaseGoodsVo purchaseGoodsVo = new PurchaseGoodsVo(purchaseGoods1, goods);
            purchaseGoodsVoList.add(purchaseGoodsVo);
        }
        return purchaseGoodsVoList;
    }

    public PurchaseOrder findFirstByOrderNumLikeOrderByOrderNumDesc() {
        return purchaseOrderDao.findFirstByOrderNumLikeOrderByOrderNumDesc();
    }
}