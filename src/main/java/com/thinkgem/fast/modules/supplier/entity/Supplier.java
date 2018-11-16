package com.thinkgem.fast.modules.supplier.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.User;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 供应商信息Entity
 * @author 任硕
 * @version 2018-11-10
 */
public class Supplier extends DataEntity<Supplier> {
	
	private static final long serialVersionUID = 1L;
	private Office office;
	private String name;		// 姓名
	private String pinyin;		// 助记码
	private String supplierNumber;		// 供应商档案号
	private String legalRepresentative;		// 法人代表
	private String enterpriseAddress;		// 企业地址
	private String enterpriseManage;		// 企业负责人
	private String creditCode;		// 社会统一信用代码
	private String bank;		// 开户银行
	private String bankNumber;		// 银行账号
	private String openAccountName;		// 开户户名
	private String supplierType;		// 供应商类别
	private String phone;		// 电话
	private String fax;		// 传真
	private String zipcode;		// 邮编
	private String taxableCategory;		// 纳税类别
	private String bizScope;		// 经营范围
	private String stopFlag;		// 是否停用
	private String stopReason;		// 停用原因
	private User stopUser;		// 停用人
	private Date stopTime;		// 停用时间
	private String settlementFlag;		// 是否设置为结算对象

	private List<SupplierAddress> supplierAddressList;

	private List<SupplierBank> supplierBankList;

	private List<SupplierConsigner> supplierConsignerList;

	private List<SupplierDocumentTemplate> supplierDocumentTemplateList;

	private List<SupplierInvoiceInfo> supplierInvoiceInfoList;

	public List<SupplierAddress> getSupplierAddressList() {
		return supplierAddressList;
	}

	public void setSupplierAddressList(List<SupplierAddress> supplierAddressList) {
		this.supplierAddressList = supplierAddressList;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public List<SupplierBank> getSupplierBankList() {
		return supplierBankList;
	}

	public void setSupplierBankList(List<SupplierBank> supplierBankList) {
		this.supplierBankList = supplierBankList;
	}

	public List<SupplierConsigner> getSupplierConsignerList() {
		return supplierConsignerList;
	}

	public void setSupplierConsignerList(List<SupplierConsigner> supplierConsignerList) {
		this.supplierConsignerList = supplierConsignerList;
	}

	public List<SupplierDocumentTemplate> getSupplierDocumentTemplateList() {
		return supplierDocumentTemplateList;
	}

	public void setSupplierDocumentTemplateList(List<SupplierDocumentTemplate> supplierDocumentTemplateList) {
		this.supplierDocumentTemplateList = supplierDocumentTemplateList;
	}

	public List<SupplierInvoiceInfo> getSupplierInvoiceInfoList() {
		return supplierInvoiceInfoList;
	}

	public void setSupplierInvoiceInfoList(List<SupplierInvoiceInfo> supplierInvoiceInfoList) {
		this.supplierInvoiceInfoList = supplierInvoiceInfoList;
	}

	public Supplier() {
		super();
	}

	public Supplier(String id){
		super(id);
	}

	@Length(min=1, max=32, message="姓名长度必须介于 1 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="助记码长度必须介于 0 和 64 之间")
	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	
	@Length(min=0, max=32, message="供应商档案号长度必须介于 0 和 32 之间")
	public String getSupplierNumber() {
		return supplierNumber;
	}

	public void setSupplierNumber(String supplierNumber) {
		this.supplierNumber = supplierNumber;
	}
	
	@Length(min=0, max=32, message="法人代表长度必须介于 0 和 32 之间")
	public String getLegalRepresentative() {
		return legalRepresentative;
	}

	public void setLegalRepresentative(String legalRepresentative) {
		this.legalRepresentative = legalRepresentative;
	}
	
	@Length(min=0, max=255, message="企业地址长度必须介于 0 和 255 之间")
	public String getEnterpriseAddress() {
		return enterpriseAddress;
	}

	public void setEnterpriseAddress(String enterpriseAddress) {
		this.enterpriseAddress = enterpriseAddress;
	}
	
	@Length(min=0, max=32, message="企业负责人长度必须介于 0 和 32 之间")
	public String getEnterpriseManage() {
		return enterpriseManage;
	}

	public void setEnterpriseManage(String enterpriseManage) {
		this.enterpriseManage = enterpriseManage;
	}
	
	@Length(min=0, max=32, message="社会统一信用代码长度必须介于 0 和 32 之间")
	public String getCreditCode() {
		return creditCode;
	}

	public void setCreditCode(String creditCode) {
		this.creditCode = creditCode;
	}
	
	@Length(min=0, max=3, message="开户银行长度必须介于 0 和 3 之间")
	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
	@Length(min=0, max=128, message="银行账号长度必须介于 0 和 128 之间")
	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	
	@Length(min=0, max=128, message="开户户名长度必须介于 0 和 128 之间")
	public String getOpenAccountName() {
		return openAccountName;
	}

	public void setOpenAccountName(String openAccountName) {
		this.openAccountName = openAccountName;
	}
	
	@Length(min=0, max=2, message="供应商类别长度必须介于 0 和 2 之间")
	public String getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(String supplierType) {
		this.supplierType = supplierType;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=20, message="传真长度必须介于 0 和 20 之间")
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}
	
	@Length(min=0, max=10, message="邮编长度必须介于 0 和 10 之间")
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	@Length(min=0, max=1, message="纳税类别长度必须介于 0 和 1 之间")
	public String getTaxableCategory() {
		return taxableCategory;
	}

	public void setTaxableCategory(String taxableCategory) {
		this.taxableCategory = taxableCategory;
	}
	
	@Length(min=0, max=2, message="经营范围长度必须介于 0 和 2 之间")
	public String getBizScope() {
		return bizScope;
	}

	public void setBizScope(String bizScope) {
		this.bizScope = bizScope;
	}
	
	@Length(min=0, max=1, message="是否停用长度必须介于 0 和 1 之间")
	public String getStopFlag() {
		return stopFlag;
	}

	public void setStopFlag(String stopFlag) {
		this.stopFlag = stopFlag;
	}
	
	@Length(min=0, max=255, message="停用原因长度必须介于 0 和 255 之间")
	public String getStopReason() {
		return stopReason;
	}

	public void setStopReason(String stopReason) {
		this.stopReason = stopReason;
	}
	
	public User getStopUser() {
		return stopUser;
	}

	public void setStopUser(User stopUser) {
		this.stopUser = stopUser;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStopTime() {
		return stopTime;
	}

	public void setStopTime(Date stopTime) {
		this.stopTime = stopTime;
	}
	
	@Length(min=0, max=1, message="是否设置为结算对象长度必须介于 0 和 1 之间")
	public String getSettlementFlag() {
		return settlementFlag;
	}

	public void setSettlementFlag(String settlementFlag) {
		this.settlementFlag = settlementFlag;
	}
	
}