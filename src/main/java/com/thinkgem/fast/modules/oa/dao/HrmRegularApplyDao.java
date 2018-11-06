package com.thinkgem.fast.modules.oa.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.oa.entity.HrmRegularApply;

/**
 * 转正申请DAO接口
 * @author 任硕
 * @version 2018-11-07
 */
@MyBatisDao
public interface HrmRegularApplyDao extends CrudDao<HrmRegularApply> {
	
}