package com.thinkgem.fast.modules.customer.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.customer.entity.CustomerInvoiceInfo;

/**
 * 开票信息DAO接口
 * @author 刘海涛
 * @version 2018-11-20
 */
@MyBatisDao
public interface CustomerInvoiceInfoDao extends CrudDao<CustomerInvoiceInfo> {
	
}