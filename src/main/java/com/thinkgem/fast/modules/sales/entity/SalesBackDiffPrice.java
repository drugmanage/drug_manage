package com.thinkgem.fast.modules.sales.entity;

import java.util.List;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 销售退补差价单Entity
 * @author shiao
 * @version 2019-01-08
 */
public class SalesBackDiffPrice extends DataEntity<SalesBackDiffPrice> {
	
	private static final long serialVersionUID = 1L;
	private String backDiffPriceNumber;       // 销售退补差价单编号
	private SalesOrder salesOrder;		// 销售单
	private SalesGoods salesGoods;		// 商品
	private Double backPriceUnit;		// 单位退补差价
	private Double backPriceTaxFree;		// 总不含税金额
	private Double backPriceTotalTax;		// 总税额
	private Double backPriceTaxAmount;		// 总含税金额
	
	private List<SalesBackDiffPriceVo> salesBackDiffPriceVoList;

    private List<SalesOrder> salesOrderList;
    
	public SalesBackDiffPrice() {
		super();
	}
	
	public SalesBackDiffPrice(String id){
		super(id);
	}
	// 通过Vo构造实体对象
    public SalesBackDiffPrice(SalesBackDiffPriceVo salesBackDiffPriceVo){
		this.backPriceTaxFree = salesBackDiffPriceVo.getBackPriceTaxFree();
		this.backPriceTotalTax = salesBackDiffPriceVo.getBackPriceTotalTax();
		this.backPriceTaxAmount = salesBackDiffPriceVo.getBackPriceTaxAmount();
		this.backPriceUnit = salesBackDiffPriceVo.getBackPriceUnit();
		SalesGoods salesGoods1 = new SalesGoods();
		salesGoods1.setId(salesBackDiffPriceVo.getSalesGoodsId());
		this.salesGoods = salesGoods1;
	}
    
	public String getBackDiffPriceNumber() {
		return backDiffPriceNumber;
	}

	public void setBackDiffPriceNumber(String backDiffPriceNumber) {
		this.backDiffPriceNumber = backDiffPriceNumber;
	}

	public SalesOrder getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrder salesOrder) {
		this.salesOrder = salesOrder;
	}

	public SalesGoods getSalesGoods() {
		return salesGoods;
	}

	public void setSalesGoods(SalesGoods salesGoods) {
		this.salesGoods = salesGoods;
	}

	public List<SalesBackDiffPriceVo> getSalesBackDiffPriceVoList() {
		return salesBackDiffPriceVoList;
	}

	public void setSalesBackDiffPriceVoList(List<SalesBackDiffPriceVo> salesBackDiffPriceVoList) {
		this.salesBackDiffPriceVoList = salesBackDiffPriceVoList;
	}

	public List<SalesOrder> getSalesOrderList() {
		return salesOrderList;
	}

	public void setSalesOrderList(List<SalesOrder> salesOrderList) {
		this.salesOrderList = salesOrderList;
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