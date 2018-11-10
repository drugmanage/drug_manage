package com.thinkgem.fast.modules.supplier.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.supplier.entity.SupplierAddress;

/**
 * 供应商收货地址DAO接口
 * @author 任硕
 * @version 2018-11-10
 */
@MyBatisDao
public interface SupplierAddressDao extends CrudDao<SupplierAddress> {
	
}