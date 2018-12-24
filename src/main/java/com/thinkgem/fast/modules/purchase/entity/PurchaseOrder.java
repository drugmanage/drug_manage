package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 采购订单Entity
 * @author 刘海涛
 * @version 2018-12-18
 */
public class PurchaseOrder extends DataEntity<PurchaseOrder> {
	
	private static final long serialVersionUID = 1L;
	private Office office;		// 机构id,从当前登录用户获取
	private String purchaseNumber;		// 单据编号
	private String supplierId;		// 供应商
	private String purchaseId;		// 采购员id 内部员工的id（hrm_user的id）
	private Date orderTime;		// 订单日期
	private String summary;		// 摘要
	private String salespersonId;		// 对方业务员id
	private String storehouse;		// 入库仓库
	private String bizGroup;		// 业务组

	private List<PurchaseGoods> purchaseGoodsList;		// 采购商品列表


	public PurchaseOrder() {
		super();
	}

	public PurchaseOrder(String id){
		super(id);
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=10, message="单据编号长度必须介于 0 和 10 之间")
	public String getPurchaseNumber() {
		return purchaseNumber;
	}

	public void setPurchaseNumber(String purchaseNumber) {
		this.purchaseNumber = purchaseNumber;
	}
	
	@Length(min=0, max=64, message="供应商长度必须介于 0 和 64 之间")
	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	@Length(min=0, max=64, message="采购员id 内部员工的id（hrm_user的id）长度必须介于 0 和 64 之间")
	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	@Length(min=0, max=500, message="摘要长度必须介于 0 和 500 之间")
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Length(min=0, max=64, message="对方业务员id长度必须介于 0 和 64 之间")
	public String getSalespersonId() {
		return salespersonId;
	}

	public void setSalespersonId(String salespersonId) {
		this.salespersonId = salespersonId;
	}
	
	@Length(min=0, max=3, message="入库仓库长度必须介于 0 和 3 之间")
	public String getStorehouse() {
		return storehouse;
	}

	public void setStorehouse(String storehouse) {
		this.storehouse = storehouse;
	}
	
	@Length(min=0, max=32, message="业务组长度必须介于 0 和 32 之间")
	public String getBizGroup() {
		return bizGroup;
	}

	public void setBizGroup(String bizGroup) {
		this.bizGroup = bizGroup;
	}

	public List<PurchaseGoods> getPurchaseGoodsList() {
		return purchaseGoodsList;
	}

	public void setPurchaseGoodsList(List<PurchaseGoods> purchaseGoodsList) {
		this.purchaseGoodsList = purchaseGoodsList;
	}
}