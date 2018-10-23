package com.thinkgem.fast.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.cms.dao.ArticleDataDao;
import com.thinkgem.fast.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author renshuo
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
