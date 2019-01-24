package com.thinkgem.fast.modules.purchase.entity;

import java.util.List;

/**
 * 采购退回开单列表展示Entity
 *
 * @author 刘海涛
 * @version 2019-1-22
 */
public class PurchaseBackTicketVo {

    private String purchaseGoodsId;     // 采购商品ID
    private String goodsCode;
    private String goodsName;
    private String goodsSpec;
    private String goodsType;
    private String manufacturer;
    private String unit;
    private String content;
    private String stock;
    private String backPriceTaxFree;
    private String backPriceTotalTax;
    private String backPriceTaxAmount;
    private String unitBackNumber;
    private String returnReason;

    public PurchaseBackTicketVo() {
    }

    public PurchaseBackTicketVo(PurchaseBackTicket purchaseBackTicket, PurchaseGoodsVo purchaseGoodsVo) {
        this.purchaseGoodsId = purchaseGoodsVo.getId();
        this.goodsCode = purchaseGoodsVo.getGoodsCode();
        this.goodsName = purchaseGoodsVo.getGoodsName();
        this.goodsSpec = purchaseGoodsVo.getGoodsSpec();
        this.goodsType = purchaseGoodsVo.getGoodsType();
        this.manufacturer = purchaseGoodsVo.getManufacturer();
        this.unit = purchaseGoodsVo.getUnit();
        this.content = purchaseGoodsVo.getContent();
        this.stock = purchaseGoodsVo.getStock();
        this.backPriceTaxFree = purchaseBackTicket.getBackPriceTaxFree();
        this.backPriceTotalTax = purchaseBackTicket.getBackPriceTotalTax();
        this.backPriceTaxAmount = purchaseBackTicket.getBackPriceTaxAmount();
        this.unitBackNumber = purchaseBackTicket.getUnitBackNumber();
        this.returnReason = purchaseBackTicket.getReturnReason();
    }

    public String getPurchaseGoodsId() {
        return purchaseGoodsId;
    }

    public void setPurchaseGoodsId(String purchaseGoodsId) {
        this.purchaseGoodsId = purchaseGoodsId;
    }

    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsSpec() {
        return goodsSpec;
    }

    public void setGoodsSpec(String goodsSpec) {
        this.goodsSpec = goodsSpec;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
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

    public String getUnitBackNumber() {
        return unitBackNumber;
    }

    public void setUnitBackNumber(String unitBackNumber) {
        this.unitBackNumber = unitBackNumber;
    }

    public String getReturnReason() {
        return returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }
}
