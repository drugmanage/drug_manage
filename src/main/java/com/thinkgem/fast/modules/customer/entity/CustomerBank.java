package com.thinkgem.fast.modules.customer.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 客户银行卡信息Entity
 * @author 刘海涛
 * @version 2018-11-20
 */
public class CustomerBank extends DataEntity<CustomerBank> {
	
	private static final long serialVersionUID = 1L;
	private String customerId;		// 客户id
	private String bank;		// 开户银行
	private String bankNumber;		// 银行账号
	private String openAccountName;		// 开户户名
	
	public CustomerBank() {
		super();
	}

	public CustomerBank(String id){
		super(id);
	}

	@Length(min=0, max=64, message="客户id长度必须介于 0 和 64 之间")
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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
	
}