package com.thinkgem.fast.test.dao;

import com.thinkgem.fast.common.persistence.TreeDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.test.entity.TestTree;

/**
 * 树结构生成DAO接口
 * @author renshuo
 * @version 2015-04-06
 */
@MyBatisDao
public interface TestTreeDao extends TreeDao<TestTree> {
	
}