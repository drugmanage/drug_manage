package com.thinkgem.fast.modules.supplier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 供应商银行信息Entity
 * @author 任硕
 * @version 2018-11-10
 */
public class SupplierBank extends DataEntity<SupplierBank> {
	
	private static final long serialVersionUID = 1L;
	private String supplierId;		// 供应商
	private String bank;		// 开户银行
	private String bankNumber;		// 银行账号
	private String openAccountName;		// 开户户名
	private String stopFlag;		// 是否停用
	
	public SupplierBank() {
		super();
	}

	public SupplierBank(String id){
		super(id);
	}

	@Length(min=0, max=64, message="供应商长度必须介于 0 和 64 之间")
	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	@Length(min=0, max=3, message="开户银行长度必须介于 0 和 3 之间")
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
	@Length(min=0, max=128, message="银行账号长度必须介于 0 和 128 之间")
	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	
	@Length(min=0, max=128, message="开户户名长度必须介于 0 和 128 之间")
	public String getOpenAccountName() {
		return openAccountName;
	}

	public void setOpenAccountName(String openAccountName) {
		this.openAccountName = openAccountName;
	}
	
	@Length(min=0, max=1, message="是否停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
}