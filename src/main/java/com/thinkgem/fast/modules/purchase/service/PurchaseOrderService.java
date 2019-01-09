package com.thinkgem.fast.modules.purchase.service;

import java.util.ArrayList;
import java.util.List;

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

    public PurchaseOrder get(String id) {
        PurchaseOrder purchaseOrder = super.get(id);

        List<PurchaseGoodsVo> purchaseGoodsVoList = new ArrayList<PurchaseGoodsVo>();
        PurchaseGoods purchaseGoods = new PurchaseGoods();
        purchaseGoods.setPurchaseOrderId(purchaseOrder.getId());
        List<PurchaseGoods> purchaseGoodsList = purchaseGoodsService.findList(purchaseGoods);
        // ToDo 构造要显示的采购商品订单
        for (PurchaseGoods purchaseGoods1 : purchaseGoodsList) {
            PurchaseGoodsVo purchaseGoodsVo = new PurchaseGoodsVo();
            purchaseGoodsVo.setGoodsId(purchaseGoods1.getGoodsId());
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
                // ToDo 通过PurchaseGoodsVo构造PurchaseGoods得到采购商品订单信息
                PurchaseGoods purchaseGoods = new PurchaseGoods();
                purchaseGoods.setPurchaseOrderId(purchaseOrder.getId());
                purchaseGoods.setGoodsId(purchaseGoodsVo.getGoodsId());
                purchaseGoods.setNumber(purchaseGoods.getNumber());

                purchaseGoodsService.save(purchaseGoods);
            }
        }
    }

    @Transactional(readOnly = false)
    public void delete(PurchaseOrder purchaseOrder) {
        super.delete(purchaseOrder);
    }

    public void setCollInfo(PurchaseOrder purchaseOrder) {

    }
}