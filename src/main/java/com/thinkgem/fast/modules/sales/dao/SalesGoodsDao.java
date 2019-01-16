package com.thinkgem.fast.modules.sales.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;

/**
 * 销售商品DAO接口
 * @author shiao
 * @version 2019-01-16
 */
@MyBatisDao
public interface SalesGoodsDao extends CrudDao<SalesGoods> {
	
}