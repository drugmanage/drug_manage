package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.Area;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 第三方收货地址Entity
 * @author 任硕
 * @version 2018-11-04
 */
public class HrmAddress extends DataEntity<HrmAddress> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUserId;		// 员工表ID
	private String receivingName;		// 收货人
	private Area area;		// 区域id
	private String receivingAddress;		// 街道门牌号
	private String contactPhone;		// 联系人电话
	
	public HrmAddress() {
		super();
	}

	public HrmAddress(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工表ID长度必须介于 0 和 64 之间")
	public String getHrmUserId() {
		return hrmUserId;
	}

	public void setHrmUserId(String hrmUserId) {
		this.hrmUserId = hrmUserId;
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
	
	@Length(min=0, max=255, message="街道门牌号长度必须介于 0 和 255 之间")
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