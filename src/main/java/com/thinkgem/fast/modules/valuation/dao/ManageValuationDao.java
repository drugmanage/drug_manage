package com.thinkgem.fast.modules.valuation.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.valuation.entity.ManageValuation;

/**
 * 区域经理定价DAO接口
 * @author renshuo
 * @version 2019-01-16
 */
@MyBatisDao
public interface ManageValuationDao extends CrudDao<ManageValuation> {
	
}