package com.thinkgem.fast.modules.valuation.entity;

import com.thinkgem.fast.modules.goods.entity.Goods;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 商品定价Entity
 * @author renshuo
 * @version 2019-01-16
 */
public class GoodsValuation extends DataEntity<GoodsValuation> {
	
	private static final long serialVersionUID = 1L;
	private String goodsId;		// 商品id

	private Goods goods;

	private String thirdQueryPriceFlag;		// 第三方查看价格标识
	private String notThirdQueryPriceFlag;		// 除第三方外客户标识
	private Double onePrice;		// 一类价格
	private Double twoPrice;		// 二类价格
	private Double threePrice;		// 三类价格
	private Double fourPrice;		// 四类价格
	private Double fivePrice;		// 五类价格
	private Double publicPrice;		// 公营价
	
	public GoodsValuation() {
		super();
	}

	public GoodsValuation(String id){
		super(id);
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Length(min=0, max=64, message="商品id长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	@Length(min=0, max=1, message="第三方查看价格标识长度必须介于 0 和 1 之间")
	public String getThirdQueryPriceFlag() {
		return thirdQueryPriceFlag;
	}

	public void setThirdQueryPriceFlag(String thirdQueryPriceFlag) {
		this.thirdQueryPriceFlag = thirdQueryPriceFlag;
	}
	
	@Length(min=0, max=1, message="除第三方外客户标识长度必须介于 0 和 1 之间")
	public String getNotThirdQueryPriceFlag() {
		return notThirdQueryPriceFlag;
	}

	public void setNotThirdQueryPriceFlag(String notThirdQueryPriceFlag) {
		this.notThirdQueryPriceFlag = notThirdQueryPriceFlag;
	}
	
	public Double getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(Double onePrice) {
		this.onePrice = onePrice;
	}
	
	public Double getTwoPrice() {
		return twoPrice;
	}

	public void setTwoPrice(Double twoPrice) {
		this.twoPrice = twoPrice;
	}
	
	public Double getThreePrice() {
		return threePrice;
	}

	public void setThreePrice(Double threePrice) {
		this.threePrice = threePrice;
	}
	
	public Double getFourPrice() {
		return fourPrice;
	}

	public void setFourPrice(Double fourPrice) {
		this.fourPrice = fourPrice;
	}
	
	public Double getFivePrice() {
		return fivePrice;
	}

	public void setFivePrice(Double fivePrice) {
		this.fivePrice = fivePrice;
	}
	
	public Double getPublicPrice() {
		return publicPrice;
	}

	public void setPublicPrice(Double publicPrice) {
		this.publicPrice = publicPrice;
	}
	
}