package com.thinkgem.fast.modules.sales.entity;

import java.util.Date;

import com.thinkgem.fast.modules.goods.entity.Goods;

/**
 *销售商品展示Entity
 * @author shiao
 * @version 2019-1-4
 */
public class SalesGoodsVo {
	private String id;
    private String goodsId;		// 商品Id
    private String goodsCode;		// 商品编码
    private String goodsName;		// 商品名
    private String goodsSpec;		// 规格
    private String goodsType;		// 商品剂型
    private String manufacturer;		// 生产厂家
    private String unit;		// 基本包装单位
    private String content;		// 装量
    private String repoId;		// 库房
	private String cargoNumber;		// 货位号
	private String lotNumber;		// 批号
	private Date validDateUntil;		// 有效期至
	private String number;		// 数量
	private String billingPrice;		// 开票价格
	private String settlementPrice;		// 结算价
	private String highPrice;		// 高开价
	private String tax;		// 含税金额
	private String taxFree;		// 不含税金额
	private String taxRate;		// 税率
	private String taxAmount;		// 税额

	public SalesGoodsVo() {
    }
	
    public SalesGoodsVo(SalesGoods salesGoods, Goods goods){
    	this.setId(salesGoods.getId());
    	this.goodsId = goods.getId();
        this.goodsCode = goods.getGoodsCode();
        this.goodsName = goods.getGoodsName();
        this.goodsSpec = goods.getGoodsSpec();
        this.goodsType = goods.getGoodsType();
        this.manufacturer = goods.getManufacturer();
        this.unit = goods.getUnit();
        this.content = goods.getContent();
        if(salesGoods.getRepo()!=null) {
        	this.repoId = salesGoods.getRepo().getId();
        }
        this.cargoNumber = salesGoods.getCargoNumber();
        this.lotNumber = salesGoods.getLotNumber();
        this.validDateUntil = salesGoods.getValidDateUntil();
        this.number = salesGoods.getNumber();
        this.billingPrice = salesGoods.getBillingPrice();
        this.settlementPrice = salesGoods.getSettlementPrice();
        this.highPrice = salesGoods.getHighPrice();
        this.tax = salesGoods.getTax();
        this.taxFree = salesGoods.getTaxFree();
        this.taxAmount = salesGoods.getTaxAmount();
        this.taxRate = salesGoods.getTaxRate();
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

	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}

	public String getCargoNumber() {
		return cargoNumber;
	}

	public void setCargoNumber(String cargoNumber) {
		this.cargoNumber = cargoNumber;
	}

	public String getLotNumber() {
		return lotNumber;
	}

	public void setLotNumber(String lotNumber) {
		this.lotNumber = lotNumber;
	}

	public Date getValidDateUntil() {
		return validDateUntil;
	}

	public void setValidDateUntil(Date validDateUntil) {
		this.validDateUntil = validDateUntil;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getBillingPrice() {
		return billingPrice;
	}

	public void setBillingPrice(String billingPrice) {
		this.billingPrice = billingPrice;
	}

	public String getSettlementPrice() {
		return settlementPrice;
	}

	public void setSettlementPrice(String settlementPrice) {
		this.settlementPrice = settlementPrice;
	}

	public String getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(String highPrice) {
		this.highPrice = highPrice;
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

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public String getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(String taxAmount) {
		this.taxAmount = taxAmount;
	}
}
