package com.thinkgem.fast.modules.repo.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 盘点表Entity
 * @author shiao
 * @version 2019-03-10
 */
public class Inventory extends DataEntity<Inventory> {
	
	private static final long serialVersionUID = 1L;
	private String docNumber;		// 单据编号
	private String status;		// 单据状态
	private String repoId;		// 盘点仓库
	private String inventoryName;		// 盘点人姓名
	private Date inventoryTime;		// 盘点时间
	
	public Inventory() {
		super();
	}

	public Inventory(String id){
		super(id);
	}

	@Length(min=0, max=32, message="单据编号长度必须介于 0 和 32 之间")
	public String getDocNumber() {
		return docNumber;
	}

	public void setDocNumber(String docNumber) {
		this.docNumber = docNumber;
	}
	
	@Length(min=0, max=1, message="单据状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="盘点仓库长度必须介于 0 和 64 之间")
	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}
	
	@Length(min=0, max=32, message="盘点人姓名长度必须介于 0 和 32 之间")
	public String getInventoryName() {
		return inventoryName;
	}

	public void setInventoryName(String inventoryName) {
		this.inventoryName = inventoryName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInventoryTime() {
		return inventoryTime;
	}

	public void setInventoryTime(Date inventoryTime) {
		this.inventoryTime = inventoryTime;
	}
	
}