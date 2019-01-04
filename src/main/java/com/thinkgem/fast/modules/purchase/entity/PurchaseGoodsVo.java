package com.thinkgem.fast.modules.purchase.entity;

import com.thinkgem.fast.modules.goods.entity.Goods;

/**
 * 采购商品Entity
 * @author 刘海涛
 * @version 2019-1-4
 */
public class PurchaseGoodsVo {

    private String goodsId;		// 商品Id
    private String goodsCode;		// 商品编码
    private String goodsName;		// 商品名
    private String goodsSpec;		// 规格
    private String goodsType;		// 商品剂型
    private String manufacturer;		// 生产厂家
    private String unit;		// 基本包装单位
    private String content;		// 装量
    private String retailPrice;		// 零售价
    private String number;		// 数量
    private String tax;		// 含税金额
    private String stock;   // 库存
    private String arrivalNum;       // 已到货数

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

    public String getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(String retailPrice) {
        this.retailPrice = retailPrice;
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
}
