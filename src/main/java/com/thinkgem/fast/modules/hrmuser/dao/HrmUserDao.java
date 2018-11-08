package com.thinkgem.fast.modules.hrmuser.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUser;

/**
 * 内部员工信息操作DAO接口
 * @author 任硕
 * @version 2018-11-02
 */
@MyBatisDao
public interface HrmUserDao extends CrudDao<HrmUser> {

    int findCount();

    void updateUserUpdate(HrmUser hrmUser);
}