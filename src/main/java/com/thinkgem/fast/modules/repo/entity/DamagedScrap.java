package com.thinkgem.fast.modules.repo.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 破损/报废单Entity
 * @author shiao
 * @version 2019-03-10
 */
public class DamagedScrap extends DataEntity<DamagedScrap> {
	
	private static final long serialVersionUID = 1L;
	private String docNumber;		// 单据编号
	private String status;		// 单据状态
	private String repoId;		// 仓库
	private String reason;		// 破损/报废原因
	
	public DamagedScrap() {
		super();
	}

	public DamagedScrap(String id){
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
	
	@Length(min=0, max=64, message="仓库长度必须介于 0 和 64 之间")
	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}
	
	@Length(min=0, max=500, message="破损/报废原因长度必须介于 0 和 500 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}