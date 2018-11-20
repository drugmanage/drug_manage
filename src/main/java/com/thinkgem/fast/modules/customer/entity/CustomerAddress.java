package com.thinkgem.fast.modules.customer.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.Area;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 客户收货地址Entity
 * @author 刘海涛
 * @version 2018-11-20
 */
public class CustomerAddress extends DataEntity<CustomerAddress> {
	
	private static final long serialVersionUID = 1L;
	private String customerId;		// 客户表ID
	private String receivingName;		// 收货人
	private Area area;		// 区域id
	private String receivingAddress;		// 收货地址:街道门牌号
	private String contactPhone;		// 联系人电话
	
	public CustomerAddress() {
		super();
	}

	public CustomerAddress(String id){
		super(id);
	}

	@Length(min=0, max=64, message="客户表ID长度必须介于 0 和 64 之间")
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	@Length(min=0, max=32, message="收货人长度必须介于 0 和 32 之间")
	public String getReceivingName() {
		return receivingName;
	}

	public void setReceivingName(String receivingName) {
		this.receivingName = receivingName;
	}
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=255, message="收货地址:街道门牌号长度必须介于 0 和 255 之间")
	public String getReceivingAddress() {
		return receivingAddress;
	}

	public void setReceivingAddress(String receivingAddress) {
		this.receivingAddress = receivingAddress;
	}
	
	@Length(min=0, max=20, message="联系人电话长度必须介于 0 和 20 之间")
	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	
}