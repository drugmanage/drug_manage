package com.thinkgem.fast.modules.goods.entity;

import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 商品资料Entity
 *
 * @author 刘海涛
 * @version 2019-01-04
 */
public class Goods extends DataEntity<Goods> {

    private static final long serialVersionUID = 1L;
    private Office office;        // 商品所属机构
    private String goodsCategory;        // 商品分类
    private String fileNumber;        // 档案号
    private String goodsCode;        // 商品编码
    private String goodsName;        // 商品名
    private String logogram;        // 拼音简码
    private String goodsType;        // 商品剂型
    private String taxControlCode;        // 商品税控编码
    private String commonNameOne;        // 俗名一
    private String commonLogogramOne;        // 俗名一拼音简码
    private String commonNameTwo;        // 俗名二
    private String commonLogogramTwo;        // 俗名二拼音简码
    private String unit;        // 基本包装单位
    private String content;        // 装量
    private String goodsSpec;        // 规格
    private String goodsDesc;        // 商品描述
    private String entryTaxRate;        // 进项税率
    private String salesRate;        // 销项税率
    private String approvalNumber;        // 批准文号
    private Date approvalNumberDate;        // 批文批准日期
    private String approvalValidity;        // 批文有效期
    private String manufacturer;        // 生产厂家
    private String storageConditions;        // 存储条件
    private String certificateNo;        // 批件号
    private String maintenanceCycle;        // 养护周期
    private String maintenanceType;        // 养护类别
    private String qualityStandard;        // 质量标准
    private String coreType;        // 核心属性
    private String retailType;        // 零售属性
    private String retailNum;        // 零售属性数量
    private String validity;        // 有效期
    private String validUnit;        // 有效期单位
    private String defaultRepoId;        // 默认仓库id
    private String defaultPositionId;        // 默认货位id
    private String retailPrice;        // 零售价
    private String taxRetailPrice;        // 含税零售价
    private String barCode;        // 商品条形码编码
    private String supervisionCode;        // 商品电子监管码
    private String purchaseFlag;        // 是否停止采购
    private String saleFlag;        // 是否停止销售

    //商品图片
    private String pathGoodsImage;
    //商品条形码图片
    private String pathGoodsCodeImage;
    //电子监管码图片
    private String pathGoodsRegulatoryImage;

    public Goods() {
        super();
    }

    public Goods(String id) {
        super(id);
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public String getPathGoodsImage() {
        return pathGoodsImage;
    }

    public void setPathGoodsImage(String pathGoodsImage) {
        this.pathGoodsImage = pathGoodsImage;
    }

    public String getPathGoodsCodeImage() {
        return pathGoodsCodeImage;
    }

    public void setPathGoodsCodeImage(String pathGoodsCodeImage) {
        this.pathGoodsCodeImage = pathGoodsCodeImage;
    }

    public String getPathGoodsRegulatoryImage() {
        return pathGoodsRegulatoryImage;
    }

    public void setPathGoodsRegulatoryImage(String pathGoodsRegulatoryImage) {
        this.pathGoodsRegulatoryImage = pathGoodsRegulatoryImage;
    }

    @Length(min = 0, max = 2, message = "商品分类长度必须介于 0 和 2 之间")
    public String getGoodsCategory() {
        return goodsCategory;
    }

    public void setGoodsCategory(String goodsCategory) {
        this.goodsCategory = goodsCategory;
    }

    @Length(min = 0, max = 20, message = "档案号长度必须介于 0 和 20 之间")
    public String getFileNumber() {
        return fileNumber;
    }

    public void setFileNumber(String fileNumber) {
        this.fileNumber = fileNumber;
    }

    @Length(min = 0, max = 32, message = "商品编码长度必须介于 0 和 32 之间")
    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode;
    }

    @Length(min = 0, max = 64, message = "商品名长度必须介于 0 和 64 之间")
    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    @Length(min = 0, max = 128, message = "拼音简码长度必须介于 0 和 128 之间")
    public String getLogogram() {
        return logogram;
    }

    public void setLogogram(String logogram) {
        this.logogram = logogram;
    }

    @Length(min = 0, max = 5, message = "商品剂型长度必须介于 0 和 5 之间")
    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    @Length(min = 0, max = 64, message = "商品税控编码长度必须介于 0 和 64 之间")
    public String getTaxControlCode() {
        return taxControlCode;
    }

    public void setTaxControlCode(String taxControlCode) {
        this.taxControlCode = taxControlCode;
    }

    @Length(min = 0, max = 64, message = "俗名一长度必须介于 0 和 64 之间")
    public String getCommonNameOne() {
        return commonNameOne;
    }

    public void setCommonNameOne(String commonNameOne) {
        this.commonNameOne = commonNameOne;
    }

    @Length(min = 0, max = 32, message = "俗名一拼音简码长度必须介于 0 和 32 之间")
    public String getCommonLogogramOne() {
        return commonLogogramOne;
    }

    public void setCommonLogogramOne(String commonLogogramOne) {
        this.commonLogogramOne = commonLogogramOne;
    }

    @Length(min = 0, max = 64, message = "俗名二长度必须介于 0 和 64 之间")
    public String getCommonNameTwo() {
        return commonNameTwo;
    }

    public void setCommonNameTwo(String commonNameTwo) {
        this.commonNameTwo = commonNameTwo;
    }

    @Length(min = 0, max = 32, message = "俗名二拼音简码长度必须介于 0 和 32 之间")
    public String getCommonLogogramTwo() {
        return commonLogogramTwo;
    }

    public void setCommonLogogramTwo(String commonLogogramTwo) {
        this.commonLogogramTwo = commonLogogramTwo;
    }

    @Length(min = 0, max = 20, message = "基本包装单位长度必须介于 0 和 20 之间")
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Length(min = 0, max = 10, message = "装量长度必须介于 0 和 10 之间")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Length(min = 0, max = 128, message = "规格长度必须介于 0 和 128 之间")
    public String getGoodsSpec() {
        return goodsSpec;
    }

    public void setGoodsSpec(String goodsSpec) {
        this.goodsSpec = goodsSpec;
    }

    @Length(min = 0, max = 500, message = "商品描述长度必须介于 0 和 500 之间")
    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public String getEntryTaxRate() {
        return entryTaxRate;
    }

    public void setEntryTaxRate(String entryTaxRate) {
        this.entryTaxRate = entryTaxRate;
    }

    public String getSalesRate() {
        return salesRate;
    }

    public void setSalesRate(String salesRate) {
        this.salesRate = salesRate;
    }

    @Length(min = 0, max = 128, message = "批准文号长度必须介于 0 和 128 之间")
    public String getApprovalNumber() {
        return approvalNumber;
    }

    public void setApprovalNumber(String approvalNumber) {
        this.approvalNumber = approvalNumber;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getApprovalNumberDate() {
        return approvalNumberDate;
    }

    public void setApprovalNumberDate(Date approvalNumberDate) {
        this.approvalNumberDate = approvalNumberDate;
    }

    @Length(min = 0, max = 11, message = "批文有效期长度必须介于 0 和 11 之间")
    public String getApprovalValidity() {
        return approvalValidity;
    }

    public void setApprovalValidity(String approvalValidity) {
        this.approvalValidity = approvalValidity;
    }

    @Length(min = 0, max = 128, message = "生产厂家长度必须介于 0 和 128 之间")
    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    @Length(min = 0, max = 2, message = "存储条件长度必须介于 0 和 2 之间")
    public String getStorageConditions() {
        return storageConditions;
    }

    public void setStorageConditions(String storageConditions) {
        this.storageConditions = storageConditions;
    }

    @Length(min = 0, max = 128, message = "批件号长度必须介于 0 和 128 之间")
    public String getCertificateNo() {
        return certificateNo;
    }

    public void setCertificateNo(String certificateNo) {
        this.certificateNo = certificateNo;
    }

    @Length(min = 0, max = 20, message = "养护周期长度必须介于 0 和 20 之间")
    public String getMaintenanceCycle() {
        return maintenanceCycle;
    }

    public void setMaintenanceCycle(String maintenanceCycle) {
        this.maintenanceCycle = maintenanceCycle;
    }

    @Length(min = 0, max = 2, message = "养护类别长度必须介于 0 和 2 之间")
    public String getMaintenanceType() {
        return maintenanceType;
    }

    public void setMaintenanceType(String maintenanceType) {
        this.maintenanceType = maintenanceType;
    }

    @Length(min = 0, max = 128, message = "质量标准长度必须介于 0 和 128 之间")
    public String getQualityStandard() {
        return qualityStandard;
    }

    public void setQualityStandard(String qualityStandard) {
        this.qualityStandard = qualityStandard;
    }

    @Length(min = 0, max = 2, message = "核心属性长度必须介于 0 和 2 之间")
    public String getCoreType() {
        return coreType;
    }

    public void setCoreType(String coreType) {
        this.coreType = coreType;
    }

    @Length(min = 0, max = 2, message = "零售属性长度必须介于 0 和 2 之间")
    public String getRetailType() {
        return retailType;
    }

    public void setRetailType(String retailType) {
        this.retailType = retailType;
    }

    @Length(min = 0, max = 11, message = "零售属性数量长度必须介于 0 和 11 之间")
    public String getRetailNum() {
        return retailNum;
    }

    public void setRetailNum(String retailNum) {
        this.retailNum = retailNum;
    }

    @Length(min = 0, max = 11, message = "有效期长度必须介于 0 和 11 之间")
    public String getValidity() {
        return validity;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    @Length(min = 0, max = 2, message = "有效期单位长度必须介于 0 和 2 之间")
    public String getValidUnit() {
        return validUnit;
    }

    public void setValidUnit(String validUnit) {
        this.validUnit = validUnit;
    }

    @Length(min = 0, max = 64, message = "默认仓库id长度必须介于 0 和 64 之间")
    public String getDefaultRepoId() {
        return defaultRepoId;
    }

    public void setDefaultRepoId(String defaultRepoId) {
        this.defaultRepoId = defaultRepoId;
    }

    @Length(min = 0, max = 64, message = "默认货位id长度必须介于 0 和 64 之间")
    public String getDefaultPositionId() {
        return defaultPositionId;
    }

    public void setDefaultPositionId(String defaultPositionId) {
        this.defaultPositionId = defaultPositionId;
    }

    public String getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(String retailPrice) {
        this.retailPrice = retailPrice;
    }

    public String getTaxRetailPrice() {
        return taxRetailPrice;
    }

    public void setTaxRetailPrice(String taxRetailPrice) {
        this.taxRetailPrice = taxRetailPrice;
    }

    @Length(min = 0, max = 64, message = "商品条形码编码长度必须介于 0 和 64 之间")
    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    @Length(min = 0, max = 128, message = "商品电子监管码长度必须介于 0 和 128 之间")
    public String getSupervisionCode() {
        return supervisionCode;
    }

    public void setSupervisionCode(String supervisionCode) {
        this.supervisionCode = supervisionCode;
    }

    @Length(min = 0, max = 1, message = "是否停止采购长度必须介于 0 和 1 之间")
    public String getPurchaseFlag() {
        return purchaseFlag;
    }

    public void setPurchaseFlag(String purchaseFlag) {
        this.purchaseFlag = purchaseFlag;
    }

    @Length(min = 0, max = 1, message = "是否停止销售长度必须介于 0 和 1 之间")
    public String getSaleFlag() {
        return saleFlag;
    }

    public void setSaleFlag(String saleFlag) {
        this.saleFlag = saleFlag;
    }

}