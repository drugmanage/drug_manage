package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.Repo;
import com.thinkgem.fast.modules.repo.dao.RepoDao;

/**
 * 仓库Service
 * @author shiao
 * @version 2019-01-16
 */
@Service
@Transactional(readOnly = true)
public class RepoService extends CrudService<RepoDao, Repo> {

	public Repo get(String id) {
		return super.get(id);
	}
	
	public List<Repo> findList(Repo repo) {
		return super.findList(repo);
	}
	
	public Page<Repo> findPage(Page<Repo> page, Repo repo) {
		return super.findPage(page, repo);
	}
	
	@Transactional(readOnly = false)
	public void save(Repo repo) {
		super.save(repo);
	}
	
	@Transactional(readOnly = false)
	public void delete(Repo repo) {
		super.delete(repo);
	}
	
}