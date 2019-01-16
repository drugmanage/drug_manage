package com.thinkgem.fast.modules.repo.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.repo.entity.Repo;

/**
 * 仓库DAO接口
 * @author shiao
 * @version 2019-01-16
 */
@MyBatisDao
public interface RepoDao extends CrudDao<Repo> {
	
}