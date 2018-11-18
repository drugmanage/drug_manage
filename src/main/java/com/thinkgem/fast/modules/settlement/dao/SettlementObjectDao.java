package com.thinkgem.fast.modules.settlement.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;

/**
 * 结算对象信息DAO接口
 * @author 任硕
 * @version 2018-11-18
 */
@MyBatisDao
public interface SettlementObjectDao extends CrudDao<SettlementObject> {
	
}