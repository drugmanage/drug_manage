package com.thinkgem.fast.modules.purchase.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 采购商品Entity
 * @author 刘海涛
 * @version 2018-12-24
 */
public class PurchaseGoods extends DataEntity<PurchaseGoods> {
	
	private static final long serialVersionUID = 1L;
	private String purchaseOrderId;		// 采购订单id
	private String goodsId;		// 商品id
	private String storeroomName;		// 库房名称
	private String number;		// 数量
	private String wholeNumber;		// 整件件数
	private String piecesNumber;		// 零散件数
	private String tax;		// 含税金额
	private String taxFree;		// 不含税金额
	private String taxAmount;		// 税额
	private String taxRate;		// 税率
	
	public PurchaseGoods() {
		super();
	}

	public PurchaseGoods(String id){
		super(id);
	}

	@Length(min=0, max=64, message="采购订单id长度必须介于 0 和 64 之间")
	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}

	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
	}
	
	@Length(min=0, max=64, message="商品id长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	@Length(min=0, max=64, message="库房名称长度必须介于 0 和 64 之间")
	public String getStoreroomName() {
		return storeroomName;
	}

	public void setStoreroomName(String storeroomName) {
		this.storeroomName = storeroomName;
	}
	
	@Length(min=0, max=11, message="数量长度必须介于 0 和 11 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=11, message="整件件数长度必须介于 0 和 11 之间")
	public String getWholeNumber() {
		return wholeNumber;
	}

	public void setWholeNumber(String wholeNumber) {
		this.wholeNumber = wholeNumber;
	}
	
	@Length(min=0, max=11, message="零散件数长度必须介于 0 和 11 之间")
	public String getPiecesNumber() {
		return piecesNumber;
	}

	public void setPiecesNumber(String piecesNumber) {
		this.piecesNumber = piecesNumber;
	}
	
	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}
	
	public String getTaxFree() {
		return taxFree;
	}

	public void setTaxFree(String taxFree) {
		this.taxFree = taxFree;
	}
	
	public String getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(String taxAmount) {
		this.taxAmount = taxAmount;
	}
	
	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	
}