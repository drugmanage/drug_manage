package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.goods.entity.Goods;

/**
 * 采购商品展示Entity
 *
 * @author 刘海涛
 * @version 2019-1-4
 */
public class PurchaseGoodsVo {

    private String id;      // 订单商品的ID
    private String goodsId;        // 商品Id
    private String goodsCode;        // 商品编码
    private String goodsName;        // 商品名
    private String goodsSpec;        // 规格
    private String goodsType;        // 商品剂型
    private String manufacturer;        // 生产厂家
    private String unit;        // 基本包装单位
    private String content;        // 装量
    private String purchasePrice;        // 采购价格
    private String number;        // 数量
    private String wholeNumber;        // 整件件数
    private String piecesNumber;        // 零散件数
    private String tax;        // 含税金额
    private String taxFree;        // 不含税金额
    private String taxAmount;        // 税额
    private String taxRate;        // 税率
    private String stock;   // 库存
    private String arrivalNum;       // 已到货数

    public PurchaseGoodsVo() {
        // do nothing
    }

    /**
     * 构造方法用于构造显示的订单商品列表内容
     *
     * @param purchaseGoods
     */
    public PurchaseGoodsVo(PurchaseGoods purchaseGoods, Goods goods) {
        this.id = purchaseGoods.getId();
        this.goodsId = goods.getId();
        this.goodsCode = goods.getGoodsCode();
        this.goodsName = goods.getGoodsName();
        this.goodsSpec = goods.getGoodsSpec();
        this.goodsType = goods.getGoodsType();
        this.manufacturer = goods.getManufacturer();
        this.unit = goods.getUnit();
        this.content = goods.getContent();
        this.purchasePrice = purchaseGoods.getPurchasePrice();
        this.number = purchaseGoods.getNumber();
        this.wholeNumber = purchaseGoods.getWholeNumber();
        this.piecesNumber = purchaseGoods.getPiecesNumber();
        this.tax = purchaseGoods.getTax();
        this.taxFree = purchaseGoods.getTaxFree();
        this.taxAmount = purchaseGoods.getTaxAmount();
        this.taxRate = purchaseGoods.getTaxRate();
        // Todo 库存跟已到货数暂时置空等库存表做完再回头补充
        this.stock = "";
        this.arrivalNum = "";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
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

    public String getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getArrivalNum() {
        return arrivalNum;
    }

    public void setArrivalNum(String arrivalNum) {
        this.arrivalNum = arrivalNum;
    }

    public String getWholeNumber() {
        return wholeNumber;
    }

    public void setWholeNumber(String wholeNumber) {
        this.wholeNumber = wholeNumber;
    }

    public String getPiecesNumber() {
        return piecesNumber;
    }

    public void setPiecesNumber(String piecesNumber) {
        this.piecesNumber = piecesNumber;
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
}
