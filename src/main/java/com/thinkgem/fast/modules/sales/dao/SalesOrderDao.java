package com.thinkgem.fast.modules.sales.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;

/**
 * 销售开票单DAO接口
 * @author shiao
 * @version 2019-01-09
 */
@MyBatisDao
public interface SalesOrderDao extends CrudDao<SalesOrder> {
	
	SalesOrder findFirstByOrderNumLikeOrderByOrderNumDesc();
}