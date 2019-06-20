package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.RepoTransfer;
import com.thinkgem.fast.modules.repo.dao.RepoTransferDao;

/**
 * 移库单Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class RepoTransferService extends CrudService<RepoTransferDao, RepoTransfer> {

	public RepoTransfer get(String id) {
		return super.get(id);
	}
	
	public List<RepoTransfer> findList(RepoTransfer repoTransfer) {
		return super.findList(repoTransfer);
	}
	
	public Page<RepoTransfer> findPage(Page<RepoTransfer> page, RepoTransfer repoTransfer) {
		return super.findPage(page, repoTransfer);
	}
	
	@Transactional(readOnly = false)
	public void save(RepoTransfer repoTransfer) {
		super.save(repoTransfer);
	}
	
	@Transactional(readOnly = false)
	public void delete(RepoTransfer repoTransfer) {
		super.delete(repoTransfer);
	}
	
}