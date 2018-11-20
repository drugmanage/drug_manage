package com.thinkgem.fast.modules.customer.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.Area;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 开票信息Entity
 * @author 刘海涛
 * @version 2018-11-20
 */
public class CustomerInvoiceInfo extends DataEntity<CustomerInvoiceInfo> {
	
	private static final long serialVersionUID = 1L;
	private String accountName;		// 开户名称
	private String bankDeposit;		// 开户行
	private Area area;		// 区域id
	private String detailAddress;		// 详细地址
	private String phone;		// 联系电话
	private String accountNumber;		// 账号
	private String dutyParagraph;		// 税号
	private String invoicePath;		// 开票图片路径
	private String stopFlag;		// 是否停用            0、未停用            1、停用
	
	public CustomerInvoiceInfo() {
		super();
	}

	public CustomerInvoiceInfo(String id){
		super(id);
	}

	@Length(min=0, max=64, message="开户名称长度必须介于 0 和 64 之间")
	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	@Length(min=0, max=128, message="开户行长度必须介于 0 和 128 之间")
	public String getBankDeposit() {
		return bankDeposit;
	}

	public void setBankDeposit(String bankDeposit) {
		this.bankDeposit = bankDeposit;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=255, message="详细地址长度必须介于 0 和 255 之间")
	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=64, message="账号长度必须介于 0 和 64 之间")
	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	@Length(min=0, max=64, message="税号长度必须介于 0 和 64 之间")
	public String getDutyParagraph() {
		return dutyParagraph;
	}

	public void setDutyParagraph(String dutyParagraph) {
		this.dutyParagraph = dutyParagraph;
	}
	
	@Length(min=0, max=128, message="开票图片路径长度必须介于 0 和 128 之间")
	public String getInvoicePath() {
		return invoicePath;
	}

	public void setInvoicePath(String invoicePath) {
		this.invoicePath = invoicePath;
	}
	
	@Length(min=0, max=1, message="是否停用            0、未停用            1、停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
}