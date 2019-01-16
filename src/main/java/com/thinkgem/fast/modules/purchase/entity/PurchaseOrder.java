package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.hrmuser.entity.HrmUser;
import com.thinkgem.fast.modules.supplier.entity.Supplier;
import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 采购订单Entity
 *
 * @author 刘海涛
 * @version 2018-12-18
 */
public class PurchaseOrder extends DataEntity<PurchaseOrder> {

    private static final long serialVersionUID = 1L;
    private Office office;        // 机构id,从当前登录用户获取
    private String purchaseNumber;        // 单据编号
    private Supplier supplier;        // 供应商
    private HrmUser hrmUser;        // 采购员id 内部员工的id（hrm_user的id）
    private Date orderTime;        // 订单日期
    private String summary;        // 摘要
    private String salespersonId;        // 对方业务员id
    private String storehouse;        // 入库仓库
    private String bizGroup;        // 业务组

    private List<PurchaseGoodsVo> goodsList;        // 采购商品列表

    private List<Supplier> suppliers;       // 供应商列表
    private List<HrmUser> purchases;
    // Todo 仓库列表、对方业务员、业务组选择

    public PurchaseOrder() {
        super();
    }

    public PurchaseOrder(String id) {
        super(id);
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    @Length(min = 0, max = 11, message = "单据编号长度必须介于 0 和 10 之间")
    public String getPurchaseNumber() {
        return purchaseNumber;
    }

    public void setPurchaseNumber(String purchaseNumber) {
        this.purchaseNumber = purchaseNumber;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public HrmUser getHrmUser() {
        return hrmUser;
    }

    public void setHrmUser(HrmUser hrmUser) {
        this.hrmUser = hrmUser;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    @Length(min = 0, max = 500, message = "摘要长度必须介于 0 和 500 之间")
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Length(min = 0, max = 64, message = "对方业务员id长度必须介于 0 和 64 之间")
    public String getSalespersonId() {
        return salespersonId;
    }

    public void setSalespersonId(String salespersonId) {
        this.salespersonId = salespersonId;
    }

    @Length(min = 0, max = 3, message = "入库仓库长度必须介于 0 和 3 之间")
    public String getStorehouse() {
        return storehouse;
    }

    public void setStorehouse(String storehouse) {
        this.storehouse = storehouse;
    }

    @Length(min = 0, max = 32, message = "业务组长度必须介于 0 和 32 之间")
    public String getBizGroup() {
        return bizGroup;
    }

    public void setBizGroup(String bizGroup) {
        this.bizGroup = bizGroup;
    }

    public List<PurchaseGoodsVo> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<PurchaseGoodsVo> goodsList) {
        this.goodsList = goodsList;
    }

    public List<Supplier> getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(List<Supplier> suppliers) {
        this.suppliers = suppliers;
    }

    public List<HrmUser> getPurchases() {
        return purchases;
    }

    public void setPurchases(List<HrmUser> purchases) {
        this.purchases = purchases;
    }
}