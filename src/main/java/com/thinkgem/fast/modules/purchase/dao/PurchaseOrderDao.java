package com.thinkgem.fast.modules.purchase.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.purchase.entity.PurchaseOrder;

import java.util.Date;
import java.util.List;

/**
 * 采购订单DAO接口
 * @author 刘海涛
 * @version 2018-12-18
 */
@MyBatisDao
public interface PurchaseOrderDao extends CrudDao<PurchaseOrder> {
    /**
     *  得到今天所有的订单号
     *
     */
	public List<PurchaseOrder> findTodayList(PurchaseOrder purchaseOrder);
}