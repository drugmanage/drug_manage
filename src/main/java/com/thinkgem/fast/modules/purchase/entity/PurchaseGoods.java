package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.goods.entity.Goods;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 采购商品Entity
 *
 * @author 刘海涛
 * @version 2018-12-24
 */
public class PurchaseGoods extends DataEntity<PurchaseGoods> {

    private static final long serialVersionUID = 1L;
    private PurchaseOrder purchaseOrder;        // 采购订单
    private Goods goods;        // 商品
    private String storeroomName;        // 库房名称
    private String purchasePrice;        // 采购价格
    private String number;        // 数量
    private String wholeNumber;        // 整件件数
    private String piecesNumber;        // 零散件数
    private String tax;        // 含税金额
    private String taxFree;        // 不含税金额
    private String taxAmount;        // 税额
    private String taxRate;        // 税率

    public PurchaseGoods() {
        super();
    }

    public PurchaseGoods(String id) {
        super(id);
    }

    public PurchaseGoods(PurchaseGoodsVo purchaseGoodsVo) {
        // ToDo 整件散件的计算未完成

        this.purchasePrice = purchaseGoodsVo.getPurchasePrice();
        this.number = purchaseGoodsVo.getNumber();
        this.wholeNumber = purchaseGoodsVo.getWholeNumber();
        this.piecesNumber = purchaseGoodsVo.getPiecesNumber();
        this.tax = purchaseGoodsVo.getTax();
        this.taxFree = purchaseGoodsVo.getTaxFree();
        this.taxAmount = purchaseGoodsVo.getTaxAmount();
        this.taxRate = purchaseGoodsVo.getTaxRate();
    }

    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    @Length(min = 0, max = 64, message = "库房名称长度必须介于 0 和 64 之间")
    public String getStoreroomName() {
        return storeroomName;
    }

    public void setStoreroomName(String storeroomName) {
        this.storeroomName = storeroomName;
    }

    @Length(min = 0, max = 11, message = "数量长度必须介于 0 和 11 之间")
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Length(min = 0, max = 11, message = "整件件数长度必须介于 0 和 11 之间")
    public String getWholeNumber() {
        return wholeNumber;
    }

    public void setWholeNumber(String wholeNumber) {
        this.wholeNumber = wholeNumber;
    }

    @Length(min = 0, max = 11, message = "零散件数长度必须介于 0 和 11 之间")
    public String getPiecesNumber() {
        return piecesNumber;
    }

    public void setPiecesNumber(String piecesNumber) {
        this.piecesNumber = piecesNumber;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getTaxFree() {
        return taxFree;
    }

    public void setTaxFree(String taxFree) {
        this.taxFree = taxFree;
    }

    public String getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(String taxAmount) {
        this.taxAmount = taxAmount;
    }

    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }

    public String getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) {
        this.purchasePrice = purchasePrice;
    }
}