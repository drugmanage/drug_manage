package com.thinkgem.fast.modules.sales.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicketVo;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;

/**
 * 销售退回开票单Entity
 * @author shiao
 * @version 2019-01-08
 */
public class SalesBackTicket extends DataEntity<SalesBackTicket> {
	
	private static final long serialVersionUID = 1L;
	private String backTicketNumber;       // 销售退回单编号
	private SalesOrder salesOrder;		// 销售单
	private SalesGoods salesGoods;		// 商品
	private String unitBackNumber;		// 单位退货数量
	private String backPriceTaxFree;		// 总不含税金额
	private String backPriceTotalTax;		// 总税额
	private String backPriceTaxAmount;		// 总含税金额
	private String returnReason;		// 退货原因
	
	private List<SalesBackTicketVo> salesBackTicketVoList;

    private List<SalesOrder> salesOrderList;
    
	public SalesBackTicket() {
		super();
	}
	
	public SalesBackTicket(String id){
		super(id);
	}
	
	// 通过Vo构造实体对象
    public SalesBackTicket(SalesBackTicketVo salesBackTicketVo){
		this.backPriceTaxFree = salesBackTicketVo.getBackPriceTaxFree();
		this.backPriceTotalTax = salesBackTicketVo.getBackPriceTotalTax();
		this.backPriceTaxAmount = salesBackTicketVo.getBackPriceTaxAmount();
		this.unitBackNumber = salesBackTicketVo.getUnitBackNumber();
		this.returnReason = salesBackTicketVo.getReturnReason();
		SalesGoods salesGoods1 = new SalesGoods();
		salesGoods1.setId(salesBackTicketVo.getSalesGoodsId());
		this.salesGoods = salesGoods1;
	}
	public List<SalesBackTicketVo> getSalesBackTicketVoList() {
		return salesBackTicketVoList;
	}

	public void setSalesBackTicketVoList(List<SalesBackTicketVo> salesBackTicketVoList) {
		this.salesBackTicketVoList = salesBackTicketVoList;
	}

	public List<SalesOrder> getSalesOrderList() {
		return salesOrderList;
	}

	public void setSalesOrderList(List<SalesOrder> salesOrderList) {
		this.salesOrderList = salesOrderList;
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
	
	@Length(min=0, max=2, message="退货原因长度必须介于 0 和 2 之间")
	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public String getBackTicketNumber() {
		return backTicketNumber;
	}

	public void setBackTicketNumber(String backTicketNumber) {
		this.backTicketNumber = backTicketNumber;
	}
	
}