package com.thinkgem.fast.modules.customer.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.Office;
import com.thinkgem.fast.modules.sys.entity.User;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 客户资料Entity
 *
 * @author 任硕
 * @version 2018-11-17
 */
public class Customer extends DataEntity<Customer> {

    private static final long serialVersionUID = 1L;
    private String name;        // 姓名
    private Office office;        // 机构id
    private String pinyin;        // 助记码
    private String customerNumber;        // 客户档案号
    private String legalRepresentative;        // 法人代表
    private String enterpriseAddress;        // 企业地址
    private String enterpriseManage;        // 企业负责人
    private String creditCode;        // 社会统一信用代码
    private String customerType;        // 客户类别
    private String fax;        // 传真
    private String zipcode;        // 邮编
    private String taxableCategory;        // 纳税类别
    private String provideHome;        // 送货上门
    private String bizScope;        // 经营范围
    private String stopFlag;        // 是否停用
    private String stopReason;        // 停用原因
    private User stopUser;        // 停用人
    private Date stopTime;        // 停用时间
    private String distributionRoute;        // 配送路线
    private String internalSerialNumber;        // 线路内部序号
    private String unitFlag;        // 是否为单位账客户
    private String settlementFlag;        // 是否为结算对象

    // 对应的客户收货地址列表
    private List<CustomerAddress> customerAddressList;
    // 对应的客户银行卡信息列表
    private List<CustomerBank> customerBankList;
    // 对应的开票信息列表
    private List<CustomerInvoiceInfo> customerInvoiceInfoList;
    // 证件模板列表
    private List<CustomerDocumentTemplate> customerDocumentTemplateList;
    // 委托人列表
    private List<CustomerConsigner> customerConsignerList;

    public Customer() {
        super();
    }

    public Customer(String id) {
        super(id);
    }

    @Length(min = 1, max = 32, message = "姓名长度必须介于 1 和 32 之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    @Length(min = 0, max = 64, message = "助记码长度必须介于 0 和 64 之间")
    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    @Length(min = 0, max = 32, message = "客户档案号长度必须介于 0 和 32 之间")
    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    @Length(min = 0, max = 32, message = "法人代表长度必须介于 0 和 32 之间")
    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    @Length(min = 0, max = 255, message = "企业地址长度必须介于 0 和 255 之间")
    public String getEnterpriseAddress() {
        return enterpriseAddress;
    }

    public void setEnterpriseAddress(String enterpriseAddress) {
        this.enterpriseAddress = enterpriseAddress;
    }

    @Length(min = 0, max = 32, message = "企业负责人长度必须介于 0 和 32 之间")
    public String getEnterpriseManage() {
        return enterpriseManage;
    }

    public void setEnterpriseManage(String enterpriseManage) {
        this.enterpriseManage = enterpriseManage;
    }

    @Length(min = 0, max = 32, message = "社会统一信用代码长度必须介于 0 和 32 之间")
    public String getCreditCode() {
        return creditCode;
    }

    public void setCreditCode(String creditCode) {
        this.creditCode = creditCode;
    }

    @Length(min = 0, max = 2, message = "客户类别长度必须介于 0 和 2 之间")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Length(min = 0, max = 20, message = "传真长度必须介于 0 和 20 之间")
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Length(min = 0, max = 10, message = "邮编长度必须介于 0 和 10 之间")
    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    @Length(min = 0, max = 1, message = "纳税类别长度必须介于 0 和 1 之间")
    public String getTaxableCategory() {
        return taxableCategory;
    }

    public void setTaxableCategory(String taxableCategory) {
        this.taxableCategory = taxableCategory;
    }

    @Length(min = 0, max = 64, message = "送货上门长度必须介于 0 和 64 之间")
    public String getProvideHome() {
        return provideHome;
    }

    public void setProvideHome(String provideHome) {
        this.provideHome = provideHome;
    }

    @Length(min = 0, max = 2, message = "经营范围长度必须介于 0 和 2 之间")
    public String getBizScope() {
        return bizScope;
    }

    public void setBizScope(String bizScope) {
        this.bizScope = bizScope;
    }

    @Length(min = 0, max = 1, message = "是否停用长度必须介于 0 和 1 之间")
    public String getStopFlag() {
        return stopFlag;
    }

    public void setStopFlag(String stopFlag) {
        this.stopFlag = stopFlag;
    }

    @Length(min = 0, max = 255, message = "停用原因长度必须介于 0 和 255 之间")
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

    @Length(min = 0, max = 255, message = "配送路线长度必须介于 0 和 255 之间")
    public String getDistributionRoute() {
        return distributionRoute;
    }

    public void setDistributionRoute(String distributionRoute) {
        this.distributionRoute = distributionRoute;
    }

    @Length(min = 0, max = 255, message = "线路内部序号长度必须介于 0 和 255 之间")
    public String getInternalSerialNumber() {
        return internalSerialNumber;
    }

    public void setInternalSerialNumber(String internalSerialNumber) {
        this.internalSerialNumber = internalSerialNumber;
    }

    @Length(min = 0, max = 1, message = "是否为单位账客户长度必须介于 0 和 1 之间")
    public String getUnitFlag() {
        return unitFlag;
    }

    public void setUnitFlag(String unitFlag) {
        this.unitFlag = unitFlag;
    }

    @Length(min = 0, max = 1, message = "是否为结算对象长度必须介于 0 和 1 之间")
    public String getSettlementFlag() {
        return settlementFlag;
    }

    public void setSettlementFlag(String settlementFlag) {
        this.settlementFlag = settlementFlag;
    }

    public List<CustomerBank> getCustomerBankList() {
        return customerBankList;
    }

    public void setCustomerBankList(List<CustomerBank> customerBankList) {
        this.customerBankList = customerBankList;
    }

    public List<CustomerAddress> getCustomerAddressList() {
        return customerAddressList;
    }

    public void setCustomerAddressList(List<CustomerAddress> customerAddressList) {
        this.customerAddressList = customerAddressList;
    }

    public List<CustomerInvoiceInfo> getCustomerInvoiceInfoList() {
        return customerInvoiceInfoList;
    }

    public void setCustomerInvoiceInfoList(List<CustomerInvoiceInfo> customerInvoiceInfoList) {
        this.customerInvoiceInfoList = customerInvoiceInfoList;
    }

    public List<CustomerDocumentTemplate> getCustomerDocumentTemplateList() {
        return customerDocumentTemplateList;
    }

    public void setCustomerDocumentTemplateList(List<CustomerDocumentTemplate> customerDocumentTemplateList) {
        this.customerDocumentTemplateList = customerDocumentTemplateList;
    }

    public List<CustomerConsigner> getCustomerConsignerList() {
        return customerConsignerList;
    }

    public void setCustomerConsignerList(List<CustomerConsigner> customerConsignerList) {
        this.customerConsignerList = customerConsignerList;
    }
}