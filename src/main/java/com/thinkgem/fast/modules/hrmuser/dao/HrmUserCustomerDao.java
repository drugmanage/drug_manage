package com.thinkgem.fast.modules.hrmuser.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUserCustomer;

/**
 * 绑定客户信息DAO接口
 * @author 任硕
 * @version 2018-11-20
 */
@MyBatisDao
public interface HrmUserCustomerDao extends CrudDao<HrmUserCustomer> {
	
}