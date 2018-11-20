package com.thinkgem.fast.modules.hrmuser.entity;

import com.thinkgem.fast.modules.customer.entity.Customer;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 绑定客户信息Entity
 * @author 任硕
 * @version 2018-11-20
 */
public class HrmUserCustomer extends DataEntity<HrmUserCustomer> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUserId;		// hrm_user_id
	private String customerId;		// customer_id

	private Customer customer;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public HrmUserCustomer() {
		super();
	}

	public HrmUserCustomer(String id){
		super(id);
	}

	@Length(min=1, max=64, message="hrm_user_id长度必须介于 1 和 64 之间")
	public String getHrmUserId() {
		return hrmUserId;
	}

	public void setHrmUserId(String hrmUserId) {
		this.hrmUserId = hrmUserId;
	}
	
	@Length(min=1, max=64, message="customer_id长度必须介于 1 和 64 之间")
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
}