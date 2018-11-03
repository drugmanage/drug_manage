package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 银行卡信息Entity
 * @author 任硕
 * @version 2018-11-04
 */
public class HrmBank extends DataEntity<HrmBank> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUserId;		// hrm_user_id
	private String bank;		// bank
	private String bankNumber;		// bank_number
	private String status;		// status
	//正面照片
	private String positivePhoto;
	//反面照片
	private String backPhoto;

	public String getPositivePhoto() {
		return positivePhoto;
	}

	public void setPositivePhoto(String positivePhoto) {
		this.positivePhoto = positivePhoto;
	}

	public String getBackPhoto() {
		return backPhoto;
	}

	public void setBackPhoto(String backPhoto) {
		this.backPhoto = backPhoto;
	}

	public HrmBank() {
		super();
	}

	public HrmBank(String id){
		super(id);
	}

	@Length(min=0, max=64, message="hrm_user_id长度必须介于 0 和 64 之间")
	public String getHrmUserId() {
		return hrmUserId;
	}

	public void setHrmUserId(String hrmUserId) {
		this.hrmUserId = hrmUserId;
	}
	
	@Length(min=0, max=3, message="bank长度必须介于 0 和 3 之间")
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
	@Length(min=0, max=128, message="bank_number长度必须介于 0 和 128 之间")
	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	
	@Length(min=0, max=1, message="status长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}