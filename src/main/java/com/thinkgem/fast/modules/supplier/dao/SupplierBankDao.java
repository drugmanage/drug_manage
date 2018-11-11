package com.thinkgem.fast.modules.supplier.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.supplier.entity.SupplierBank;

/**
 * 供应商银行信息DAO接口
 * @author 任硕
 * @version 2018-11-12
 */
@MyBatisDao
public interface SupplierBankDao extends CrudDao<SupplierBank> {
	
}