package com.thinkgem.fast.modules.valuation.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 区域经理定价Entity
 * @author renshuo
 * @version 2019-01-10
 */
public class ManageValuation extends DataEntity<ManageValuation> {
	
	private static final long serialVersionUID = 1L;
	private String manageId;		// 区域经理id
	private String valuationId;		// 定价表id
	private Double markupPrice;		// 加价价格
	
	public ManageValuation() {
		super();
	}

	public ManageValuation(String id){
		super(id);
	}

	@Length(min=0, max=64, message="区域经理id长度必须介于 0 和 64 之间")
	public String getManageId() {
		return manageId;
	}

	public void setManageId(String manageId) {
		this.manageId = manageId;
	}
	
	@Length(min=0, max=64, message="定价表id长度必须介于 0 和 64 之间")
	public String getValuationId() {
		return valuationId;
	}

	public void setValuationId(String valuationId) {
		this.valuationId = valuationId;
	}
	
	public Double getMarkupPrice() {
		return markupPrice;
	}

	public void setMarkupPrice(Double markupPrice) {
		this.markupPrice = markupPrice;
	}
	
}