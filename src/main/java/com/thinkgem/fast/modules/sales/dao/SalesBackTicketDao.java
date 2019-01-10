package com.thinkgem.fast.modules.sales.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicket;

/**
 * 销售退回开票单DAO接口
 * @author shiao
 * @version 2019-01-08
 */
@MyBatisDao
public interface SalesBackTicketDao extends CrudDao<SalesBackTicket> {
	
}