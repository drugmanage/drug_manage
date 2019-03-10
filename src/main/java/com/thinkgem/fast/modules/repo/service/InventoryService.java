package com.thinkgem.fast.modules.repo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.repo.entity.Inventory;
import com.thinkgem.fast.modules.repo.dao.InventoryDao;

/**
 * 盘点表Service
 * @author shiao
 * @version 2019-03-10
 */
@Service
@Transactional(readOnly = true)
public class InventoryService extends CrudService<InventoryDao, Inventory> {

	public Inventory get(String id) {
		return super.get(id);
	}
	
	public List<Inventory> findList(Inventory inventory) {
		return super.findList(inventory);
	}
	
	public Page<Inventory> findPage(Page<Inventory> page, Inventory inventory) {
		return super.findPage(page, inventory);
	}
	
	@Transactional(readOnly = false)
	public void save(Inventory inventory) {
		super.save(inventory);
	}
	
	@Transactional(readOnly = false)
	public void delete(Inventory inventory) {
		super.delete(inventory);
	}
	
}