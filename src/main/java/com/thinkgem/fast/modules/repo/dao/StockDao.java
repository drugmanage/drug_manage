package com.thinkgem.fast.modules.repo.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.repo.entity.Stock;

/**
 * 库存查询DAO接口
 * @author shiao
 * @version 2019-03-10
 */
@MyBatisDao
public interface StockDao extends CrudDao<Stock> {
	
}