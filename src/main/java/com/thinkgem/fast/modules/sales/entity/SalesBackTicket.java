package com.thinkgem.fast.modules.sales.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 销售退回开票单Entity
 * @author shiao
 * @version 2019-01-08
 */
public class SalesBackTicket extends DataEntity<SalesBackTicket> {
	
	private static final long serialVersionUID = 1L;
	private String backTicketNumber;       // 销售退回单编号
	private SalesOrder salesOrder;		// 销售单
	private String goodsId;		// 商品
	private String unitBackNumber;		// 单位退货数量
	private String backPriceTaxFree;		// 总不含税金额
	private String backPriceTotalTax;		// 总税额
	private String backPriceTaxAmount;		// 总含税金额
	private String returnReason;		// 退货原因
	
	public SalesBackTicket() {
		super();
	}

	public SalesBackTicket(String id){
		super(id);
	}

	public SalesOrder getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrder salesOrder) {
		this.salesOrder = salesOrder;
	}
	
	@Length(min=0, max=64, message="商品长度必须介于 0 和 64 之间")
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

	public String getBackTicketNumber() {
		return backTicketNumber;
	}

	public void setBackTicketNumber(String backTicketNumber) {
		this.backTicketNumber = backTicketNumber;
	}
	
}