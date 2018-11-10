package com.thinkgem.fast.modules.supplier.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.Area;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 供应商收货地址Entity
 * @author 任硕
 * @version 2018-11-10
 */
public class SupplierAddress extends DataEntity<SupplierAddress> {
	
	private static final long serialVersionUID = 1L;
	private String supplierId;		// 供应商
	private String receivingName;		// 收货人
	private Area area;		// 区域
	private String receivingAddress;		// 收货地址
	private String contactPhone;		// 联系人电话
	private String stopFlag;		// 是否停用            0、未停用            1、停用
	
	public SupplierAddress() {
		super();
	}

	public SupplierAddress(String id){
		super(id);
	}

	@Length(min=0, max=64, message="供应商长度必须介于 0 和 64 之间")
	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
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
	
	@Length(min=0, max=255, message="收货地址长度必须介于 0 和 255 之间")
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
	
	@Length(min=0, max=1, message="是否停用            0、未停用            1、停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
}