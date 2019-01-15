package com.thinkgem.fast.modules.valuation.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.valuation.entity.ManageCustomerValuationLk;

/**
 * 区域经理客户定价关联表DAO接口
 * @author renshuo
 * @version 2019-01-15
 */
@MyBatisDao
public interface ManageCustomerValuationLkDao extends CrudDao<ManageCustomerValuationLk> {
	
}