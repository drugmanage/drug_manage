package com.thinkgem.fast.modules.purchase.service;

import java.util.ArrayList;
import java.util.List;

import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicketVo;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicket;
import com.thinkgem.fast.modules.purchase.dao.PurchaseBackTicketDao;

/**
 * 采购退款开票单Service
 *
 * @author 刘海涛
 * @version 2019-01-08
 */
@Service
@Transactional(readOnly = true)
public class PurchaseBackTicketService extends CrudService<PurchaseBackTicketDao, PurchaseBackTicket> {

    @Autowired
    private PurchaseBackTicketDao purchaseBackTicketDao;

    @Autowired
    private PurchaseGoodsService purchaseGoodsService;

    @Autowired
    private GoodsService goodsService;

    public PurchaseBackTicket get(String id) {
        PurchaseBackTicket purchaseBackTicket = super.get(id);
        // 查找与目标对象同一退款单号的
        PurchaseBackTicket purchaseBackTicketForQuery = new PurchaseBackTicket();
        purchaseBackTicketForQuery.setBackTicketNumber(purchaseBackTicket.getBackTicketNumber());
        List<PurchaseBackTicket> purchaseBackTicketList = this.findList(purchaseBackTicketForQuery);
        // 构造要显示的列表内容
        List<PurchaseBackTicketVo> purchaseBackTicketVoList = new ArrayList<PurchaseBackTicketVo>();
        for (PurchaseBackTicket purchaseBackTicket1 : purchaseBackTicketList) {
            PurchaseGoods purchaseGoods = purchaseGoodsService.get(purchaseBackTicket1.getPurchaseGoods().getId());
            Goods goods = goodsService.get(purchaseGoods.getGoods().getId());
            PurchaseGoodsVo purchaseGoodsVo = new PurchaseGoodsVo(purchaseGoods, goods);
            PurchaseBackTicketVo purchaseBackTicketVo = new PurchaseBackTicketVo(purchaseBackTicket1, purchaseGoodsVo);
            purchaseBackTicketVoList.add(purchaseBackTicketVo);
        }
        purchaseBackTicket.setPurchaseBackTicketVoList(purchaseBackTicketVoList);
        return purchaseBackTicket;
    }

    public List<PurchaseBackTicket> findList(PurchaseBackTicket purchaseBackTicket) {
        return super.findList(purchaseBackTicket);
    }

    public Page<PurchaseBackTicket> findPage(Page<PurchaseBackTicket> page, PurchaseBackTicket purchaseBackTicket) {
        return super.findPage(page, purchaseBackTicket);
    }

    @Transactional(readOnly = false)
    public void save(PurchaseBackTicket purchaseBackTicket) {
        List<PurchaseBackTicketVo> purchaseBackTicketVoList = purchaseBackTicket.getPurchaseBackTicketVoList();
        for (PurchaseBackTicketVo purchaseBackTicketVo : purchaseBackTicketVoList) {
            PurchaseBackTicket purchaseBackTicketSave = new PurchaseBackTicket(purchaseBackTicketVo);
            purchaseBackTicketSave.setBackTicketNumber(purchaseBackTicket.getBackTicketNumber());
            purchaseBackTicketSave.setOffice(purchaseBackTicket.getOffice());
            purchaseBackTicketSave.setPurchaseOrder(purchaseBackTicket.getPurchaseOrder());
            PurchaseGoods purchaseGoods = new PurchaseGoods();
            purchaseGoods.setId(purchaseBackTicketVo.getPurchaseGoodsId());
            purchaseBackTicketSave.setPurchaseGoods(purchaseGoods);
            // todo 退回税相关字段先置空
            purchaseBackTicketSave.setBackPriceTaxFree(null);
            purchaseBackTicketSave.setBackPriceTotalTax(null);
            purchaseBackTicketSave.setBackPriceTaxAmount(null);
            super.save(purchaseBackTicketSave);
        }
    }

    @Transactional(readOnly = false)
    public void delete(PurchaseBackTicket purchaseBackTicket) {
        super.delete(purchaseBackTicket);
    }

    public PurchaseBackTicket findFirstByOrderNumLikeOrderByOrderNumDesc() {
        return purchaseBackTicketDao.findFirstByOrderNumLikeOrderByOrderNumDesc();
    }

}