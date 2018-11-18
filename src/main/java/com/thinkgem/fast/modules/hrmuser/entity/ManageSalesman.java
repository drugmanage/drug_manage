package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 区域经理绑定业务员Entity
 * @author 任硕
 * @version 2018-11-19
 */
public class ManageSalesman extends DataEntity<ManageSalesman> {
	
	private static final long serialVersionUID = 1L;
	private String manageUserId;		// 区域经理id
	private String salesmanUserId;		// 业务员id

	private HrmUser salemanHrmUser;

	public HrmUser getSalemanHrmUser() {
		return salemanHrmUser;
	}

	public void setSalemanHrmUser(HrmUser salemanHrmUser) {
		this.salemanHrmUser = salemanHrmUser;
	}

	public ManageSalesman() {
		super();
	}

	public ManageSalesman(String id){
		super(id);
	}

	@Length(min=1, max=64, message="区域经理id长度必须介于 1 和 64 之间")
	public String getManageUserId() {
		return manageUserId;
	}

	public void setManageUserId(String manageUserId) {
		this.manageUserId = manageUserId;
	}
	
	@Length(min=1, max=64, message="业务员id长度必须介于 1 和 64 之间")
	public String getSalesmanUserId() {
		return salesmanUserId;
	}

	public void setSalesmanUserId(String salesmanUserId) {
		this.salesmanUserId = salesmanUserId;
	}
	
}