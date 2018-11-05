package com.thinkgem.fast.modules.attachment.dao;

import com.thinkgem.fast.common.persistence.CrudDao;
import com.thinkgem.fast.common.persistence.annotation.MyBatisDao;
import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 附件管理DAO接口
 *
 * @author renshuo
 * @version 2018-10-24
 */
@MyBatisDao
public interface MeisAttachmentDao extends CrudDao<MeisAttachment> {

    List<MeisAttachment> findMeisAttachmentByBizId(@Param("officeid") String officeid, @Param("bizid") String bizId);

    void deleteByBizId(String bizId);

    List<MeisAttachment> findAttchList(MeisAttachment meisAttachment);

    void deleteByMeis(MeisAttachment meis);
}