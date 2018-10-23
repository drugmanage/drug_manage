package com.thinkgem.fast.modules.sys.dao;

import com.thinkgem.fast.common.persistence.TreeDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.sys.entity.Area;

/**
 * 区域DAO接口
 * @author renshuo
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {
	
}
