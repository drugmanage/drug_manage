package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 采购退款开票单Entity
 * @author 刘海涛
 * @version 2019-01-08
 */
public class PurchaseBackTicket extends DataEntity<PurchaseBackTicket> {
	
	private static final long serialVersionUID = 1L;
	private Office office;		// 机构id
	private String purchaseId;		// 采购id
	private String goodsId;		// 商品id
	private String unitBackNumber;		// 单位退货数量
	private String backPriceTaxFree;		// 采购退回总不含税金额
	private String backPriceTotalTax;		// 采购退回总税额
	private String backPriceTaxAmount;		// 采购退回总含税金额
	private String returnReason;		// 退货原因
	
	public PurchaseBackTicket() {
		super();
	}

	public PurchaseBackTicket(String id){
		super(id);
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=64, message="采购id长度必须介于 0 和 64 之间")
	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}
	
	@Length(min=0, max=64, message="商品id长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getUnitBackNumber() {
		return unitBackNumber;
	}

	public void setUnitBackNumber(String unitBackNumber) {
		this.unitBackNumber = unitBackNumber;
	}
	
	public String getBackPriceTaxFree() {
		return backPriceTaxFree;
	}

	public void setBackPriceTaxFree(String backPriceTaxFree) {
		this.backPriceTaxFree = backPriceTaxFree;
	}
	
	public String getBackPriceTotalTax() {
		return backPriceTotalTax;
	}

	public void setBackPriceTotalTax(String backPriceTotalTax) {
		this.backPriceTotalTax = backPriceTotalTax;
	}
	
	public String getBackPriceTaxAmount() {
		return backPriceTaxAmount;
	}

	public void setBackPriceTaxAmount(String backPriceTaxAmount) {
		this.backPriceTaxAmount = backPriceTaxAmount;
	}
	
	@Length(min=0, max=2, message="退货原因长度必须介于 0 和 2 之间")
	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}
	
}