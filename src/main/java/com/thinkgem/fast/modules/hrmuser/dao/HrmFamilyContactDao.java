package com.thinkgem.fast.modules.hrmuser.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.hrmuser.entity.HrmFamilyContact;

/**
 * 家庭成员信息DAO接口
 * @author 任硕
 * @version 2018-11-03
 */
@MyBatisDao
public interface HrmFamilyContactDao extends CrudDao<HrmFamilyContact> {
	
}