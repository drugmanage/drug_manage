package com.thinkgem.fast.modules.repo.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 移库单Entity
 * @author shiao
 * @version 2019-03-10
 */
public class RepoTransfer extends DataEntity<RepoTransfer> {
	
	private static final long serialVersionUID = 1L;
	private Date transferDate;		// 移库日期
	private String transferNumber;		// 移库单号
	private String outRepoId;		// 出库库房
	private String inRepoId;		// 入库库房
	private String transferUserId;		// 移库员
	
	public RepoTransfer() {
		super();
	}

	public RepoTransfer(String id){
		super(id);
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}
	
	@Length(min=0, max=32, message="移库单号长度必须介于 0 和 32 之间")
	public String getTransferNumber() {
		return transferNumber;
	}

	public void setTransferNumber(String transferNumber) {
		this.transferNumber = transferNumber;
	}
	
	@Length(min=0, max=64, message="出库库房长度必须介于 0 和 64 之间")
	public String getOutRepoId() {
		return outRepoId;
	}

	public void setOutRepoId(String outRepoId) {
		this.outRepoId = outRepoId;
	}
	
	@Length(min=0, max=64, message="入库库房长度必须介于 0 和 64 之间")
	public String getInRepoId() {
		return inRepoId;
	}

	public void setInRepoId(String inRepoId) {
		this.inRepoId = inRepoId;
	}
	
	@Length(min=0, max=64, message="移库员长度必须介于 0 和 64 之间")
	public String getTransferUserId() {
		return transferUserId;
	}

	public void setTransferUserId(String transferUserId) {
		this.transferUserId = transferUserId;
	}
	
}