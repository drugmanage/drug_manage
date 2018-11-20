package com.thinkgem.fast.modules.customer.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.customer.entity.CustomerDocumentTemplate;

/**
 * 证件模板DAO接口
 * @author 刘海涛
 * @version 2018-11-20
 */
@MyBatisDao
public interface CustomerDocumentTemplateDao extends CrudDao<CustomerDocumentTemplate> {
	
}