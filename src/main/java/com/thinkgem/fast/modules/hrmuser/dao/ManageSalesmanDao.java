package com.thinkgem.fast.modules.hrmuser.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.hrmuser.entity.ManageSalesman;

/**
 * 区域经理绑定业务员DAO接口
 * @author 任硕
 * @version 2018-11-19
 */
@MyBatisDao
public interface ManageSalesmanDao extends CrudDao<ManageSalesman> {
	
}