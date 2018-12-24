package com.thinkgem.fast.modules.purchase.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;

/**
 * 采购商品DAO接口
 * @author 刘海涛
 * @version 2018-12-24
 */
@MyBatisDao
public interface PurchaseGoodsDao extends CrudDao<PurchaseGoods> {
	
}