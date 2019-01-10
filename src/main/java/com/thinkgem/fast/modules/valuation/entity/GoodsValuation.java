package com.thinkgem.fast.modules.valuation.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 商品定价Entity
 * @author renshuo
 * @version 2019-01-10
 */
public class GoodsValuation extends DataEntity<GoodsValuation> {
	
	private static final long serialVersionUID = 1L;
	private Office office;		// 机构id
	private String goodsId;		// 商品id
	private String thirdQueryPriceFlag;		// 第三方查看价格标识            1、可以查看            0、不可以查看
	private String notThirdQueryPriceFlag;		// 除第三方外客户标识            1、可以查看            0、不可以查看
	private String onePrice;		// 一类价格
	private String twoPrice;		// 二类价格
	private String threePrice;		// 三类价格
	private String fourPrice;		// 四类价格
	private String fivePrice;		// 五类价格
	private String publicPrice;		// 公营价
	
	public GoodsValuation() {
		super();
	}

	public GoodsValuation(String id){
		super(id);
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=64, message="商品id长度必须介于 0 和 64 之间")
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	@Length(min=0, max=1, message="第三方查看价格标识            1、可以查看            0、不可以查看长度必须介于 0 和 1 之间")
	public String getThirdQueryPriceFlag() {
		return thirdQueryPriceFlag;
	}

	public void setThirdQueryPriceFlag(String thirdQueryPriceFlag) {
		this.thirdQueryPriceFlag = thirdQueryPriceFlag;
	}
	
	@Length(min=0, max=1, message="除第三方外客户标识            1、可以查看            0、不可以查看长度必须介于 0 和 1 之间")
	public String getNotThirdQueryPriceFlag() {
		return notThirdQueryPriceFlag;
	}

	public void setNotThirdQueryPriceFlag(String notThirdQueryPriceFlag) {
		this.notThirdQueryPriceFlag = notThirdQueryPriceFlag;
	}
	
	public String getOnePrice() {
		return onePrice;
	}

	public void setOnePrice(String onePrice) {
		this.onePrice = onePrice;
	}
	
	public String getTwoPrice() {
		return twoPrice;
	}

	public void setTwoPrice(String twoPrice) {
		this.twoPrice = twoPrice;
	}
	
	public String getThreePrice() {
		return threePrice;
	}

	public void setThreePrice(String threePrice) {
		this.threePrice = threePrice;
	}
	
	public String getFourPrice() {
		return fourPrice;
	}

	public void setFourPrice(String fourPrice) {
		this.fourPrice = fourPrice;
	}
	
	public String getFivePrice() {
		return fivePrice;
	}

	public void setFivePrice(String fivePrice) {
		this.fivePrice = fivePrice;
	}
	
	public String getPublicPrice() {
		return publicPrice;
	}

	public void setPublicPrice(String publicPrice) {
		this.publicPrice = publicPrice;
	}
	
}