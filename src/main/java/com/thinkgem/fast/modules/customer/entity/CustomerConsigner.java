package com.thinkgem.fast.modules.customer.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 委托人Entity
 * @author 刘海涛
 * @version 2018-11-20
 */
public class CustomerConsigner extends DataEntity<CustomerConsigner> {
	
	private static final long serialVersionUID = 1L;
	private String contactsName;		// 联系人
	private String sex;		// 性别
	private String phone;		// 电话
	private String certNumber;		// 证件号
	private String consignerVali;		// 委托人有效期
	private String proxyBook;		// 委托书
	private String proxyBookVali;		// 委托书有效期
	private String proxyBookImgBook;		// 委托书图片路径
	private String idCardImgBook;		// 身份证图片路径
	private String stopFlag;		// 是否停用
	
	public CustomerConsigner() {
		super();
	}

	public CustomerConsigner(String id){
		super(id);
	}

	@Length(min=0, max=32, message="联系人长度必须介于 0 和 32 之间")
	public String getContactsName() {
		return contactsName;
	}

	public void setContactsName(String contactsName) {
		this.contactsName = contactsName;
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
	
	@Length(min=0, max=4, message="未投入有效期长度必须介于 0 和 4 之间")
	public String getConsignerVali() {
		return consignerVali;
	}

	public void setConsignerVali(String consignerVali) {
		this.consignerVali = consignerVali;
	}
	
	@Length(min=0, max=64, message="委托书长度必须介于 0 和 64 之间")
	public String getProxyBook() {
		return proxyBook;
	}

	public void setProxyBook(String proxyBook) {
		this.proxyBook = proxyBook;
	}
	
	@Length(min=0, max=4, message="委托书有效期长度必须介于 0 和 4 之间")
	public String getProxyBookVali() {
		return proxyBookVali;
	}

	public void setProxyBookVali(String proxyBookVali) {
		this.proxyBookVali = proxyBookVali;
	}
	
	@Length(min=0, max=128, message="委托书图片路径长度必须介于 0 和 128 之间")
	public String getProxyBookImgBook() {
		return proxyBookImgBook;
	}

	public void setProxyBookImgBook(String proxyBookImgBook) {
		this.proxyBookImgBook = proxyBookImgBook;
	}
	
	@Length(min=0, max=128, message="身份证图片路径长度必须介于 0 和 128 之间")
	public String getIdCardImgBook() {
		return idCardImgBook;
	}

	public void setIdCardImgBook(String idCardImgBook) {
		this.idCardImgBook = idCardImgBook;
	}
	
	@Length(min=0, max=1, message="是否停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
}