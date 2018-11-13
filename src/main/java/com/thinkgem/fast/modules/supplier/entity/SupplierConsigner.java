package com.thinkgem.fast.modules.supplier.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

import java.util.Date;

/**
 * 供应商委托人Entity
 * @author 任硕
 * @version 2018-11-13
 */
public class SupplierConsigner extends DataEntity<SupplierConsigner> {
	
	private static final long serialVersionUID = 1L;
	private String contactsName;		// 联系人
	private String supplierId;		// 供应商id
	private String sex;		// 性别
	private String phone;		// 电话
	private String certNumber;		// 证件号
	private Date consignerVali;		// 委托人有效期
	private String proxyBook;		// 委托书
	private Date proxyBookVali;		// 委托书有效期
	private String stopFlag;		// 是否停用            0、未停用            1、停用

	private String proxyBookImgPath;		// 委托书图片路径
	private String idCardImgPath;		// 身份证图片路径

	public String getProxyBookImgPath() {
		return proxyBookImgPath;
	}

	public void setProxyBookImgPath(String proxyBookImgPath) {
		this.proxyBookImgPath = proxyBookImgPath;
	}

	public String getIdCardImgPath() {
		return idCardImgPath;
	}

	public void setIdCardImgPath(String idCardImgPath) {
		this.idCardImgPath = idCardImgPath;
	}

	public SupplierConsigner() {
		super();
	}

	public SupplierConsigner(String id){
		super(id);
	}

	@Length(min=0, max=32, message="联系人长度必须介于 0 和 32 之间")
	public String getContactsName() {
		return contactsName;
	}

	public void setContactsName(String contactsName) {
		this.contactsName = contactsName;
	}
	
	@Length(min=0, max=64, message="供应商id长度必须介于 0 和 64 之间")
	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=32, message="证件号长度必须介于 0 和 32 之间")
	public String getCertNumber() {
		return certNumber;
	}

	public void setCertNumber(String certNumber) {
		this.certNumber = certNumber;
	}
	
	public Date getConsignerVali() {
		return consignerVali;
	}

	public void setConsignerVali(Date consignerVali) {
		this.consignerVali = consignerVali;
	}
	
	@Length(min=0, max=64, message="委托书长度必须介于 0 和 64 之间")
	public String getProxyBook() {
		return proxyBook;
	}

	public void setProxyBook(String proxyBook) {
		this.proxyBook = proxyBook;
	}
	
	public Date getProxyBookVali() {
		return proxyBookVali;
	}

	public void setProxyBookVali(Date proxyBookVali) {
		this.proxyBookVali = proxyBookVali;
	}
	
	@Length(min=0, max=1, message="是否停用            0、未停用            1、停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
}