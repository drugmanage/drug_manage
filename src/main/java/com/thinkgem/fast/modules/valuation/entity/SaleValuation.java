package com.thinkgem.fast.modules.valuation.entity;

import com.thinkgem.fast.modules.goods.entity.Goods;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 业务员定价Entity
 *
 * @author renshuo
 * @version 2019-01-16
 */
public class SaleValuation extends DataEntity<SaleValuation> {

    private static final long serialVersionUID = 1L;
    private String saleId;        // 业务员id
    private String goodsId;        // 商品id

    private Goods goods;

    private Double onePrice;        // 一类价格
    private String onePriceCustomerLkId;        // 设置客户一类价格关联id
    private Double twoPrice;        // 二类价格
    private String twoPriceCustomerLkId;        // 设置客户二类价格关联id
    private Double threePrice;        // 三类价格
    private String threePriceCustomerLkId;        // 设置客户三类价格关联id

    public SaleValuation() {
        super();
    }

    public SaleValuation(String id) {
        super(id);
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    @Length(min = 0, max = 64, message = "业务员id长度必须介于 0 和 64 之间")
    public String getSaleId() {
        return saleId;
    }

    public void setSaleId(String saleId) {
        this.saleId = saleId;
    }

    @Length(min = 0, max = 64, message = "商品id长度必须介于 0 和 64 之间")
    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Double getOnePrice() {
        return onePrice;
    }

    public void setOnePrice(Double onePrice) {
        this.onePrice = onePrice;
    }

    @Length(min = 0, max = 64, message = "设置客户一类价格关联id长度必须介于 0 和 64 之间")
    public String getOnePriceCustomerLkId() {
        return onePriceCustomerLkId;
    }

    public void setOnePriceCustomerLkId(String onePriceCustomerLkId) {
        this.onePriceCustomerLkId = onePriceCustomerLkId;
    }

    public Double getTwoPrice() {
        return twoPrice;
    }

    public void setTwoPrice(Double twoPrice) {
        this.twoPrice = twoPrice;
    }

    @Length(min = 0, max = 64, message = "设置客户二类价格关联id长度必须介于 0 和 64 之间")
    public String getTwoPriceCustomerLkId() {
        return twoPriceCustomerLkId;
    }

    public void setTwoPriceCustomerLkId(String twoPriceCustomerLkId) {
        this.twoPriceCustomerLkId = twoPriceCustomerLkId;
    }

    public Double getThreePrice() {
        return threePrice;
    }

    public void setThreePrice(Double threePrice) {
        this.threePrice = threePrice;
    }

    @Length(min = 0, max = 64, message = "设置客户三类价格关联id长度必须介于 0 和 64 之间")
    public String getThreePriceCustomerLkId() {
        return threePriceCustomerLkId;
    }

    public void setThreePriceCustomerLkId(String threePriceCustomerLkId) {
        this.threePriceCustomerLkId = threePriceCustomerLkId;
    }

}