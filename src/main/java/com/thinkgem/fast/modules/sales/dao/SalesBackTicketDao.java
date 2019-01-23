package com.thinkgem.fast.modules.sales.dao;

import java.util.List;

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
	   /**
     * 获取最新一条退回单
     *
     * @return
     */
    SalesBackTicket findFirstByOrderNumLikeOrderByOrderNumDesc();

    /**
     * 获取同一个退回开票单下详情
     *
     * @return
     */
    List<SalesBackTicket> findListWithBackTicketNumber();

}