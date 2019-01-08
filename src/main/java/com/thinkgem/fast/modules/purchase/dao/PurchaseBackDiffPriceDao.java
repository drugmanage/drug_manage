package com.thinkgem.fast.modules.purchase.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackDiffPrice;

/**
 * 采购补差价单DAO接口
 * @author 刘海涛
 * @version 2019-01-08
 */
@MyBatisDao
public interface PurchaseBackDiffPriceDao extends CrudDao<PurchaseBackDiffPrice> {
	
}