package com.thinkgem.fast.modules.valuation.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 业务员客户定价关联表Entity
 * @author renshuo
 * @version 2019-01-15
 */
public class SaleCustomerValuationLk extends DataEntity<SaleCustomerValuationLk> {
	
	private static final long serialVersionUID = 1L;
	private String salePriceLkId;		// 业务员定价价格类型id
	private String customerId;		// 客户id
	
	public SaleCustomerValuationLk() {
		super();
	}

	public SaleCustomerValuationLk(String id){
		super(id);
	}

	@Length(min=0, max=64, message="业务员定价价格类型id长度必须介于 0 和 64 之间")
	public String getSalePriceLkId() {
		return salePriceLkId;
	}

	public void setSalePriceLkId(String salePriceLkId) {
		this.salePriceLkId = salePriceLkId;
	}
	
	@Length(min=0, max=64, message="客户id长度必须介于 0 和 64 之间")
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
}