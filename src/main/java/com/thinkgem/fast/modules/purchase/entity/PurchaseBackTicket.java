package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

import java.util.List;

/**
 * 采购退款开票单Entity
 *
 * @author 刘海涛
 * @version 2019-01-08
 */
public class PurchaseBackTicket extends DataEntity<PurchaseBackTicket> {

    private static final long serialVersionUID = 1L;
    private String backTicketNumber;       // 采购退回单编号
    private Office office;        // 机构
    private PurchaseOrder purchaseOrder;        // 采购订单
    private PurchaseGoods purchaseGoods;        // 采购商品
    private String unitBackNumber;        // 单位退货数量
    private String backPriceTaxFree;        // 采购退回总不含税金额
    private String backPriceTotalTax;        // 采购退回总税额
    private String backPriceTaxAmount;        // 采购退回总含税金额
    private String returnReason;        // 退货原因

    private List<PurchaseBackTicketVo> purchaseBackTicketVoList;

    private List<PurchaseOrder> purchaseOrderList;        // 采购订单列表

    public PurchaseBackTicket() {
        super();
    }

    public PurchaseBackTicket(String id) {
        super(id);
    }

    // 通过Vo构造实体对象
    public PurchaseBackTicket(PurchaseBackTicketVo purchaseBackTicketVo){
		this.backPriceTaxFree = purchaseBackTicketVo.getBackPriceTaxFree();
		this.backPriceTotalTax = purchaseBackTicketVo.getBackPriceTotalTax();
		this.backPriceTaxAmount = purchaseBackTicketVo.getBackPriceTaxAmount();
		this.unitBackNumber = purchaseBackTicketVo.getUnitBackNumber();
		this.returnReason = purchaseBackTicketVo.getReturnReason();
		PurchaseGoods purchaseGoods1 = new PurchaseGoods();
		purchaseGoods1.setId(purchaseBackTicketVo.getPurchaseGoodsId());
		this.purchaseGoods = purchaseGoods1;
	}

    public String getBackTicketNumber() {
        return backTicketNumber;
    }

    public void setBackTicketNumber(String backTicketNumber) {
        this.backTicketNumber = backTicketNumber;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public PurchaseGoods getPurchaseGoods() {
        return purchaseGoods;
    }

    public void setPurchaseGoods(PurchaseGoods purchaseGoods) {
        this.purchaseGoods = purchaseGoods;
    }

    public String getUnitBackNumber() {
        return unitBackNumber;
    }

    public void setUnitBackNumber(String unitBackNumber) {
        this.unitBackNumber = unitBackNumber;
    }

    public String getBackPriceTaxFree() {
        return backPriceTaxFree;
    }

    public void setBackPriceTaxFree(String backPriceTaxFree) {
        this.backPriceTaxFree = backPriceTaxFree;
    }

    public String getBackPriceTotalTax() {
        return backPriceTotalTax;
    }

    public void setBackPriceTotalTax(String backPriceTotalTax) {
        this.backPriceTotalTax = backPriceTotalTax;
    }

    public String getBackPriceTaxAmount() {
        return backPriceTaxAmount;
    }

    public void setBackPriceTaxAmount(String backPriceTaxAmount) {
        this.backPriceTaxAmount = backPriceTaxAmount;
    }

    @Length(min = 0, max = 2, message = "退货原因长度必须介于 0 和 2 之间")
    public String getReturnReason() {
        return returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    public List<PurchaseBackTicketVo> getPurchaseBackTicketVoList() {
        return purchaseBackTicketVoList;
    }

    public void setPurchaseBackTicketVoList(List<PurchaseBackTicketVo> purchaseBackTicketVoList) {
        this.purchaseBackTicketVoList = purchaseBackTicketVoList;
    }

    public List<PurchaseOrder> getPurchaseOrderList() {
        return purchaseOrderList;
    }

    public void setPurchaseOrderList(List<PurchaseOrder> purchaseOrderList) {
        this.purchaseOrderList = purchaseOrderList;
    }
}