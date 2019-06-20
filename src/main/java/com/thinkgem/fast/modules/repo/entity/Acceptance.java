package com.thinkgem.fast.modules.repo.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 验收单Entity
 * @author shiao
 * @version 2019-03-10
 */
public class Acceptance extends DataEntity<Acceptance> {
	
	private static final long serialVersionUID = 1L;
	private String purchaseId;		// 采购信息
	private String receiptId;		// 收货单
	private String supplierId;		// 供应商
	private String buyerId;		// 采购员
	private Date orderDate;		// 订单日期
	private String abstractData;		// 摘要
	private String otherSalemanId;		// 对方业务员
	private String repoId;		// 入库仓库
	private String bizGroup;		// 业务组
	
	public Acceptance() {
		super();
	}

	public Acceptance(String id){
		super(id);
	}

	@Length(min=1, max=64, message="采购信息长度必须介于 1 和 64 之间")
	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}
	
	@Length(min=0, max=64, message="收货单长度必须介于 0 和 64 之间")
	public String getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	
	@Length(min=0, max=64, message="供应商长度必须介于 0 和 64 之间")
	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	@Length(min=0, max=64, message="采购员长度必须介于 0 和 64 之间")
	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	@Length(min=0, max=500, message="摘要长度必须介于 0 和 500 之间")
	public String getAbstractData() {
		return abstractData;
	}

	public void setAbstractData(String abstractData) {
		this.abstractData = abstractData;
	}
	
	@Length(min=0, max=64, message="对方业务员长度必须介于 0 和 64 之间")
	public String getOtherSalemanId() {
		return otherSalemanId;
	}

	public void setOtherSalemanId(String otherSalemanId) {
		this.otherSalemanId = otherSalemanId;
	}
	
	@Length(min=0, max=64, message="入库仓库长度必须介于 0 和 64 之间")
	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}
	
	@Length(min=0, max=64, message="业务组长度必须介于 0 和 64 之间")
	public String getBizGroup() {
		return bizGroup;
	}

	public void setBizGroup(String bizGroup) {
		this.bizGroup = bizGroup;
	}
	
}