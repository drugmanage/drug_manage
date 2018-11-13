package com.thinkgem.fast.modules.supplier.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.supplier.entity.SupplierDocumentTemplate;

/**
 * 供应商证件模板DAO接口
 * @author 任硕
 * @version 2018-11-13
 */
@MyBatisDao
public interface SupplierDocumentTemplateDao extends CrudDao<SupplierDocumentTemplate> {
	
}