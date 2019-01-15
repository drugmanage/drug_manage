package com.thinkgem.fast.modules.valuation.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 区域经理定价Entity
 * @author renshuo
 * @version 2019-01-15
 */
public class ManageValuation extends DataEntity<ManageValuation> {
	
	private static final long serialVersionUID = 1L;
	private String manageId;		// 区域经理
	private String valuationId;		// 定价表
	private Double onePrice;		// 一类价格
	private String onePriceCustomerLkId;		// 设置客户一类价格关联id
	private Double twoPrice;		// 二类价格
	private String twoPriceCustomerLkId;		// 设置客户二类价格关联id
	private Double threePrice;		// 二类价格
	private String threePriceCustomerLkId;		// 设置客户三类价格关联id
	
	public ManageValuation() {
		super();
	}

	public ManageValuation(String id){
		super(id);
	}

	@Length(min=0, max=64, message="区域经理长度必须介于 0 和 64 之间")
	public String getManageId() {
		return manageId;
	}

	public void setManageId(String manageId) {
		this.manageId = manageId;
	}
	
	@Length(min=0, max=64, message="定价表长度必须介于 0 和 64 之间")
	public String getValuationId() {
		return valuationId;
	}

	public void setValuationId(String valuationId) {
		this.valuationId = valuationId;
	}
	
	public Double getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}
	
	@Length(min=0, max=64, message="设置客户一类价格关联id长度必须介于 0 和 64 之间")
	public String getOnePriceCustomerLkId() {
		return onePriceCustomerLkId;
	}

	public void setOnePriceCustomerLkId(String onePriceCustomerLkId) {
		this.onePriceCustomerLkId = onePriceCustomerLkId;
	}
	
	public Double getTwoPrice() {
		return twoPrice;
	}

	public void setTwoPrice(Double twoPrice) {
		this.twoPrice = twoPrice;
	}
	
	@Length(min=0, max=64, message="设置客户二类价格关联id长度必须介于 0 和 64 之间")
	public String getTwoPriceCustomerLkId() {
		return twoPriceCustomerLkId;
	}

	public void setTwoPriceCustomerLkId(String twoPriceCustomerLkId) {
		this.twoPriceCustomerLkId = twoPriceCustomerLkId;
	}
	
	public Double getThreePrice() {
		return threePrice;
	}

	public void setThreePrice(Double threePrice) {
		this.threePrice = threePrice;
	}
	
	@Length(min=0, max=64, message="设置客户三类价格关联id长度必须介于 0 和 64 之间")
	public String getThreePriceCustomerLkId() {
		return threePriceCustomerLkId;
	}

	public void setThreePriceCustomerLkId(String threePriceCustomerLkId) {
		this.threePriceCustomerLkId = threePriceCustomerLkId;
	}
	
}