package com.thinkgem.fast.modules.hrmuser.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.hrmuser.entity.HrmAddress;

/**
 * 第三方收货地址DAO接口
 * @author 任硕
 * @version 2018-11-04
 */
@MyBatisDao
public interface HrmAddressDao extends CrudDao<HrmAddress> {
	
}