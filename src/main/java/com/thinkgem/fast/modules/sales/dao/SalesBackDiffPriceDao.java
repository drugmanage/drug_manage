package com.thinkgem.fast.modules.sales.dao;

import java.util.List;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPrice;

/**
 * 销售退补差价单DAO接口
 * @author shiao
 * @version 2019-01-08
 */
@MyBatisDao
public interface SalesBackDiffPriceDao extends CrudDao<SalesBackDiffPrice> {
	  /**
     * 获取最新一条退补单
     *
     * @return
     */
    SalesBackDiffPrice findFirstByOrderNumLikeOrderByOrderNumDesc();

    /**
     * 获取同一个退补开票单下详情
     *
     * @return
     */
    List<SalesBackDiffPrice> findListWithBackDiffPriceNumber();

}