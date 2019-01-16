package com.thinkgem.fast.modules.repo.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 仓库Entity
 * @author shiao
 * @version 2019-01-16
 */
public class Repo extends DataEntity<Repo> {
	
	private static final long serialVersionUID = 1L;
	private String repoName;		// 仓库名称
	private String repoType;		// 仓库类型:1-整件仓 2-散件仓 3-赠品库
	private String isStop;		// 是否停用
	private String isPauseIn;		// 是否暂停入库
	private String isPauseOut;		// 是否暂停出库
	private String repoDesc;		// 备注信息
	
	public Repo() {
		super();
	}

	public Repo(String id){
		super(id);
	}

	@Length(min=1, max=255, message="仓库名称长度必须介于 1 和 255 之间")
	public String getRepoName() {
		return repoName;
	}

	public void setRepoName(String repoName) {
		this.repoName = repoName;
	}
	
	@Length(min=1, max=1, message="仓库类型:1-整件仓 2-散件仓 3-赠品库长度必须介于 1 和 1 之间")
	public String getRepoType() {
		return repoType;
	}

	public void setRepoType(String repoType) {
		this.repoType = repoType;
	}
	
	@Length(min=0, max=1, message="是否停用长度必须介于 0 和 1 之间")
	public String getIsStop() {
		return isStop;
	}

	public void setIsStop(String isStop) {
		this.isStop = isStop;
	}
	
	@Length(min=0, max=1, message="是否暂停入库长度必须介于 0 和 1 之间")
	public String getIsPauseIn() {
		return isPauseIn;
	}

	public void setIsPauseIn(String isPauseIn) {
		this.isPauseIn = isPauseIn;
	}
	
	@Length(min=0, max=1, message="是否暂停出库长度必须介于 0 和 1 之间")
	public String getIsPauseOut() {
		return isPauseOut;
	}

	public void setIsPauseOut(String isPauseOut) {
		this.isPauseOut = isPauseOut;
	}
	
	@Length(min=1, max=255, message="备注信息长度必须介于 1 和 255 之间")
	public String getRepoDesc() {
		return repoDesc;
	}

	public void setRepoDesc(String repoDesc) {
		this.repoDesc = repoDesc;
	}
	
}