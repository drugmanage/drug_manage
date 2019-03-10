package com.thinkgem.fast.modules.repo.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 库存查询Entity
 * @author shiao
 * @version 2019-03-10
 */
public class Stock extends DataEntity<Stock> {
	
	private static final long serialVersionUID = 1L;
	private String repoId;		// 仓库
	private String goodsId;		// 商品
	private String stockNum;		// 商品数量
	private String salemanId;		// 采购员
	private Date goodsFirstRepoTime;		// 入库时间
	private String wholeNumber;		// 整件件数
	private String taxFree;		// 不含税金额
	private String occupyNum;		// 占用数量
	private String piecesNumber;		// 散件件数
	private String tax;		// 含税金额
	private String taxAmount;		// 税额
	
	public Stock() {
		super();
	}

	public Stock(String id){
		super(id);
	}

	@Length(min=0, max=64, message="仓库长度必须介于 0 和 64 之间")
	public String getRepoId() {
		return repoId;
	}

	public void setRepoId(String repoId) {
		this.repoId = repoId;
	}
	
	@Length(min=0, max=64, message="商品长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	@Length(min=0, max=11, message="商品数量长度必须介于 0 和 11 之间")
	public String getStockNum() {
		return stockNum;
	}

	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}
	
	@Length(min=0, max=64, message="采购员长度必须介于 0 和 64 之间")
	public String getSalemanId() {
		return salemanId;
	}

	public void setSalemanId(String salemanId) {
		this.salemanId = salemanId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getGoodsFirstRepoTime() {
		return goodsFirstRepoTime;
	}

	public void setGoodsFirstRepoTime(Date goodsFirstRepoTime) {
		this.goodsFirstRepoTime = goodsFirstRepoTime;
	}
	
	@Length(min=0, max=11, message="整件件数长度必须介于 0 和 11 之间")
	public String getWholeNumber() {
		return wholeNumber;
	}

	public void setWholeNumber(String wholeNumber) {
		this.wholeNumber = wholeNumber;
	}
	
	public String getTaxFree() {
		return taxFree;
	}

	public void setTaxFree(String taxFree) {
		this.taxFree = taxFree;
	}
	
	@Length(min=0, max=11, message="占用数量长度必须介于 0 和 11 之间")
	public String getOccupyNum() {
		return occupyNum;
	}

	public void setOccupyNum(String occupyNum) {
		this.occupyNum = occupyNum;
	}
	
	@Length(min=0, max=11, message="散件件数长度必须介于 0 和 11 之间")
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
	
	public String getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(String taxAmount) {
		this.taxAmount = taxAmount;
	}
	
}