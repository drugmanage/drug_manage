package com.thinkgem.fast.modules.sales.entity;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 销售退回开票单列表展示Entity
 * @author shiao
 * @version 2019-01-08
 */
public class SalesBackDiffPriceVo extends DataEntity<SalesBackDiffPriceVo> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 231621827727823615L;
	private String salesGoodsId;     // 销售商品ID
    private String goodsCode;
    private String goodsName;
    private String goodsSpec;
    private String goodsType;
    private String manufacturer;
    private String unit;
    private String content;
	private Double backPriceUnit;		// 单位退货单价
	private Double backPriceTaxFree;		// 总不含税金额
	private Double backPriceTotalTax;		// 总税额
	private Double backPriceTaxAmount;		// 总含税金额
	
	public SalesBackDiffPriceVo() {
		super();
	}
	
	public SalesBackDiffPriceVo(SalesBackDiffPrice salesBackDiffPrice, SalesGoodsVo salesGoodsVo){
        this.salesGoodsId = salesGoodsVo.getId();
        this.goodsCode = salesGoodsVo.getGoodsCode();
        this.goodsName = salesGoodsVo.getGoodsName();
        this.goodsSpec = salesGoodsVo.getGoodsSpec();
        this.goodsType = salesGoodsVo.getGoodsType();
        this.manufacturer = salesGoodsVo.getManufacturer();
        this.unit = salesGoodsVo.getUnit();
        this.content = salesGoodsVo.getContent();
        this.backPriceTaxFree = salesBackDiffPrice.getBackPriceTaxFree();
        this.backPriceTotalTax = salesBackDiffPrice.getBackPriceTotalTax();
        this.backPriceTaxAmount = salesBackDiffPrice.getBackPriceTaxAmount();
        this.backPriceUnit = salesBackDiffPrice.getBackPriceUnit();
    }

	public String getSalesGoodsId() {
		return salesGoodsId;
	}

	public void setSalesGoodsId(String salesGoodsId) {
		this.salesGoodsId = salesGoodsId;
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

	public Double getBackPriceUnit() {
		return backPriceUnit;
	}

	public void setBackPriceUnit(Double backPriceUnit) {
		this.backPriceUnit = backPriceUnit;
	}

	public Double getBackPriceTaxFree() {
		return backPriceTaxFree;
	}

	public void setBackPriceTaxFree(Double backPriceTaxFree) {
		this.backPriceTaxFree = backPriceTaxFree;
	}

	public Double getBackPriceTotalTax() {
		return backPriceTotalTax;
	}

	public void setBackPriceTotalTax(Double backPriceTotalTax) {
		this.backPriceTotalTax = backPriceTotalTax;
	}

	public Double getBackPriceTaxAmount() {
		return backPriceTaxAmount;
	}

	public void setBackPriceTaxAmount(Double backPriceTaxAmount) {
		this.backPriceTaxAmount = backPriceTaxAmount;
	}
}