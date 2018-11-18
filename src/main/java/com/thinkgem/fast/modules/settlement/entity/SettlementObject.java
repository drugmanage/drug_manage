package com.thinkgem.fast.modules.settlement.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 结算对象信息Entity
 * @author 任硕
 * @version 2018-11-18
 */
public class SettlementObject extends DataEntity<SettlementObject> {
	
	private static final long serialVersionUID = 1L;
	private String outerId;		// 结算对象
	private String settlementType;		// 结算对象类型
	private Double bottomPricePoint;		// 底价点
	private Double handlingCost;		// 搬运费
	private Double bills;		// 清单费
	private Double freight;		// 运费
	private Double exhibitCost;		// 上货费
	private Double deliveryFee;		// 下货费
	private String partyPriceType;		// 本方网营品种结算价格类别
	private String otherPriceType;		// 他人网营品种结算价格类别
	private String partyFlag;		// 是否本方标识
	
	public SettlementObject() {
		super();
	}

	public SettlementObject(String id){
		super(id);
	}

	@Length(min=0, max=64, message="结算对象长度必须介于 0 和 64 之间")
	public String getOuterId() {
		return outerId;
	}

	public void setOuterId(String outerId) {
		this.outerId = outerId;
	}
	
	@Length(min=0, max=2, message="结算对象类型长度必须介于 0 和 2 之间")
	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}
	
	public Double getBottomPricePoint() {
		return bottomPricePoint;
	}

	public void setBottomPricePoint(Double bottomPricePoint) {
		this.bottomPricePoint = bottomPricePoint;
	}
	
	public Double getHandlingCost() {
		return handlingCost;
	}

	public void setHandlingCost(Double handlingCost) {
		this.handlingCost = handlingCost;
	}
	
	public Double getBills() {
		return bills;
	}

	public void setBills(Double bills) {
		this.bills = bills;
	}
	
	public Double getFreight() {
		return freight;
	}

	public void setFreight(Double freight) {
		this.freight = freight;
	}
	
	public Double getExhibitCost() {
		return exhibitCost;
	}

	public void setExhibitCost(Double exhibitCost) {
		this.exhibitCost = exhibitCost;
	}
	
	public Double getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(Double deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	
	@Length(min=0, max=2, message="本方网营品种结算价格类别长度必须介于 0 和 2 之间")
	public String getPartyPriceType() {
		return partyPriceType;
	}

	public void setPartyPriceType(String partyPriceType) {
		this.partyPriceType = partyPriceType;
	}
	
	@Length(min=0, max=2, message="他人网营品种结算价格类别长度必须介于 0 和 2 之间")
	public String getOtherPriceType() {
		return otherPriceType;
	}

	public void setOtherPriceType(String otherPriceType) {
		this.otherPriceType = otherPriceType;
	}
	
	@Length(min=0, max=1, message="是否本方标识长度必须介于 0 和 1 之间")
	public String getPartyFlag() {
		return partyFlag;
	}

	public void setPartyFlag(String partyFlag) {
		this.partyFlag = partyFlag;
	}
	
}