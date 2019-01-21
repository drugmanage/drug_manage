package com.thinkgem.fast.modules.purchase.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicket;

import java.util.List;

/**
 * 采购退回开票单DAO接口
 * @author 刘海涛
 * @version 2019-01-08
 */
@MyBatisDao
public interface PurchaseBackTicketDao extends CrudDao<PurchaseBackTicket> {

    /**
     * 获取最新一条退回单
     *
     * @return
     */
    PurchaseBackTicket findFirstByOrderNumLikeOrderByOrderNumDesc();

    /**
     * 获取同一个退回开票单下详情
     *
     * @return
     */
    List<PurchaseBackTicket> findListWithBackTicketNumber();
}