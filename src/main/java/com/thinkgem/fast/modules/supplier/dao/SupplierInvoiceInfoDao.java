package com.thinkgem.fast.modules.supplier.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.supplier.entity.SupplierInvoiceInfo;

/**
 * 供应商开票信息DAO接口
 * @author 任硕
 * @version 2018-11-13
 */
@MyBatisDao
public interface SupplierInvoiceInfoDao extends CrudDao<SupplierInvoiceInfo> {
	
}