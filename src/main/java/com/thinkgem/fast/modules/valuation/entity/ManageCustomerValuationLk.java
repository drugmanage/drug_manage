package com.thinkgem.fast.modules.valuation.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 区域经理客户定价关联表Entity
 * @author renshuo
 * @version 2019-01-15
 */
public class ManageCustomerValuationLk extends DataEntity<ManageCustomerValuationLk> {
	
	private static final long serialVersionUID = 1L;
	private String priceLkId;		// 区域经理定价价格类型id
	private String customerId;		// 客户id
	
	public ManageCustomerValuationLk() {
		super();
	}

	public ManageCustomerValuationLk(String id){
		super(id);
	}

	@Length(min=0, max=64, message="区域经理定价价格类型id长度必须介于 0 和 64 之间")
	public String getPriceLkId() {
		return priceLkId;
	}

	public void setPriceLkId(String priceLkId) {
		this.priceLkId = priceLkId;
	}
	
	@Length(min=0, max=64, message="客户id长度必须介于 0 和 64 之间")
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
}