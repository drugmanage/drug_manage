package com.thinkgem.fast.modules.goods.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.goods.entity.Goods;

/**
 * 商品资料DAO接口
 * @author 刘海涛
 * @version 2018-11-16
 */
@MyBatisDao
public interface GoodsDao extends CrudDao<Goods> {
	
}