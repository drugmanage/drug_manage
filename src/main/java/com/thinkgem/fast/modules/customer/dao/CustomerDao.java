package com.thinkgem.fast.modules.customer.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.customer.entity.Customer;

/**
 * 客户资料DAO接口
 * @author 任硕
 * @version 2018-11-17
 */
@MyBatisDao
public interface CustomerDao extends CrudDao<Customer> {

    int findCount();

}