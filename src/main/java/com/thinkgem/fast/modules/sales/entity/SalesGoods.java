package com.thinkgem.fast.modules.sales.entity;

import java.util.Date;

import com.thinkgem.fast.common.persistence.DataEntity;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.repo.entity.Repo;

/**
 * 销售商品Entity
 * @author shiao
 * @version 2019-01-16
 */
public class SalesGoods extends DataEntity<SalesGoods> {
	
	private static final long serialVersionUID = 1L;
	private SalesOrder salesOrder;		// 销售订单
	private Goods goods;		// 商品
	private Repo repo;		// 库房
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
	
	public SalesGoods() {
		super();
	}

	public SalesGoods(String id){
		super(id);
	}
	
	public SalesGoods(SalesGoodsVo salesGoodsVo) {
        this.cargoNumber = salesGoodsVo.getCargoNumber();
        this.lotNumber = salesGoodsVo.getLotNumber();
        this.validDateUntil = salesGoodsVo.getValidDateUntil();
        this.number = salesGoodsVo.getNumber();
        this.billingPrice = salesGoodsVo.getBillingPrice();
        this.settlementPrice = salesGoodsVo.getSettlementPrice();
        this.highPrice = salesGoodsVo.getHighPrice();
        this.tax = salesGoodsVo.getTax();
        this.taxFree = salesGoodsVo.getTaxFree();
        this.taxAmount = salesGoodsVo.getTaxAmount();
        this.taxRate = salesGoodsVo.getTaxRate();
    }
	
	public SalesOrder getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrder salesOrder) {
		this.salesOrder = salesOrder;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Repo getRepo() {
		return repo;
	}

	public void setRepo(Repo repo) {
		this.repo = repo;
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