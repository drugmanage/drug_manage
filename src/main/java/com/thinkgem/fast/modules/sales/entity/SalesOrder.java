package com.thinkgem.fast.modules.sales.entity;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 销售开票单Entity
 * @author shiao
 * @version 2019-01-09
 */
public class SalesOrder extends DataEntity<SalesOrder> {
	
	private static final long serialVersionUID = 1L;
	private String documentNum;		// 单据编号
	private String status;		// 单据状态
	private String orderNum;		// 订单号
	private Date orderTime;		// 制单日期
	private String repoId;		// 出货仓库
	private String customerName;		// 客户名称
	private String invoiceType;		// 发票类型
	private String freightType;		// 货运类型
	private String settlementObjectId;		// 结算对象
	private String manageId;		// 区域经理
	private String salemanId;		// 业务员
	private String documentAttr;		// 单据属性
	private String unitFlag;		// 是否单位账客户
	private String customerAttr;		// 客户属性
	private String receivingAddress;		// 收货地址
	private String paymentMethod;		// 付款方式
	private String freightUnderwriter;		// 运费承担方
	private String allocationFlag;		// 是否调拨
	
	private List<SalesGoodsVo> goodsList;        // 销售商品列表
	
	public SalesOrder() {
		super();
	}

	public SalesOrder(String id){
		super(id);
	}

	@Length(min=0, max=32, message="单据编号长度必须介于 0 和 32 之间")
	public String getDocumentNum() {
		return documentNum;
	}

	public void setDocumentNum(String documentNum) {
		this.documentNum = documentNum;
	}
	
	@Length(min=0, max=2, message="单据状态长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=32, message="订单号长度必须介于 0 和 32 之间")
	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	@Length(min=0, max=64, message="出货仓库长度必须介于 0 和 64 之间")
	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}
	
	@Length(min=0, max=32, message="客户名称长度必须介于 0 和 32 之间")
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	@Length(min=0, max=2, message="发票类型长度必须介于 0 和 2 之间")
	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}
	
	@Length(min=0, max=2, message="货运类型长度必须介于 0 和 2 之间")
	public String getFreightType() {
		return freightType;
	}

	public void setFreightType(String freightType) {
		this.freightType = freightType;
	}
	
	@Length(min=0, max=64, message="结算对象长度必须介于 0 和 64 之间")
	public String getSettlementObjectId() {
		return settlementObjectId;
	}

	public void setSettlementObjectId(String settlementObjectId) {
		this.settlementObjectId = settlementObjectId;
	}
	
	@Length(min=0, max=64, message="区域经理长度必须介于 0 和 64 之间")
	public String getManageId() {
		return manageId;
	}

	public void setManageId(String manageId) {
		this.manageId = manageId;
	}
	
	@Length(min=0, max=64, message="业务员长度必须介于 0 和 64 之间")
	public String getSalemanId() {
		return salemanId;
	}

	public void setSalemanId(String salemanId) {
		this.salemanId = salemanId;
	}
	
	@Length(min=0, max=2, message="单据属性长度必须介于 0 和 2 之间")
	public String getDocumentAttr() {
		return documentAttr;
	}

	public void setDocumentAttr(String documentAttr) {
		this.documentAttr = documentAttr;
	}
	
	@Length(min=0, max=1, message="是否单位账客户长度必须介于 0 和 1 之间")
	public String getUnitFlag() {
		return unitFlag;
	}

	public void setUnitFlag(String unitFlag) {
		this.unitFlag = unitFlag;
	}
	
	@Length(min=0, max=1, message="客户属性长度必须介于 0 和 1 之间")
	public String getCustomerAttr() {
		return customerAttr;
	}

	public void setCustomerAttr(String customerAttr) {
		this.customerAttr = customerAttr;
	}
	
	@Length(min=0, max=128, message="收货地址长度必须介于 0 和 128 之间")
	public String getReceivingAddress() {
		return receivingAddress;
	}

	public void setReceivingAddress(String receivingAddress) {
		this.receivingAddress = receivingAddress;
	}
	
	@Length(min=0, max=1, message="付款方式长度必须介于 0 和 1 之间")
	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	@Length(min=0, max=1, message="运费承担方长度必须介于 0 和 1 之间")
	public String getFreightUnderwriter() {
		return freightUnderwriter;
	}

	public void setFreightUnderwriter(String freightUnderwriter) {
		this.freightUnderwriter = freightUnderwriter;
	}
	
	@Length(min=0, max=1, message="是否调拨长度必须介于 0 和 1 之间")
	public String getAllocationFlag() {
		return allocationFlag;
	}

	public void setAllocationFlag(String allocationFlag) {
		this.allocationFlag = allocationFlag;
	}

	public List<SalesGoodsVo> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<SalesGoodsVo> goodsList) {
		this.goodsList = goodsList;
	}
	
}