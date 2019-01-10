package com.thinkgem.fast.modules.valuation.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 业务员定价Entity
 * @author renshuo
 * @version 2019-01-10
 */
public class SaleValuation extends DataEntity<SaleValuation> {
	
	private static final long serialVersionUID = 1L;
	private String saleId;		// 业务员id
	private String manageValuationId;		// 区域经理加价表id
	private Double markupPrice;		// 加价价格
	
	public SaleValuation() {
		super();
	}

	public SaleValuation(String id){
		super(id);
	}

	@Length(min=0, max=64, message="业务员id长度必须介于 0 和 64 之间")
	public String getSaleId() {
		return saleId;
	}

	public void setSaleId(String saleId) {
		this.saleId = saleId;
	}
	
	@Length(min=0, max=64, message="区域经理加价表id长度必须介于 0 和 64 之间")
	public String getManageValuationId() {
		return manageValuationId;
	}

	public void setManageValuationId(String manageValuationId) {
		this.manageValuationId = manageValuationId;
	}
	
	public Double getMarkupPrice() {
		return markupPrice;
	}

	public void setMarkupPrice(Double markupPrice) {
		this.markupPrice = markupPrice;
	}
	
}