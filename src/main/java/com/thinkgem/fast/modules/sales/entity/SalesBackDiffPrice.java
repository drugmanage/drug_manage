package com.thinkgem.fast.modules.sales.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 销售退补差价单Entity
 * @author shiao
 * @version 2019-01-08
 */
public class SalesBackDiffPrice extends DataEntity<SalesBackDiffPrice> {
	
	private static final long serialVersionUID = 1L;
	private String salesId;		// 销售单
	private String goodsId;		// 商品
	private String backPriceUnit;		// 单位退补差价
	private String backPriceTaxFree;		// 总不含税金额
	private String backPriceTotalTax;		// 总税额
	private String backPriceTaxAmount;		// 总含税金额
	
	public SalesBackDiffPrice() {
		super();
	}

	public SalesBackDiffPrice(String id){
		super(id);
	}

	@Length(min=0, max=64, message="销售单长度必须介于 0 和 64 之间")
	public String getSalesId() {
		return salesId;
	}

	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}
	
	@Length(min=0, max=64, message="商品长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getBackPriceUnit() {
		return backPriceUnit;
	}

	public void setBackPriceUnit(String backPriceUnit) {
		this.backPriceUnit = backPriceUnit;
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
	
}