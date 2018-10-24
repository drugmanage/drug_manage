package com.thinkgem.fast.modules.attachment.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.fast.common.persistence.DataEntity;
import com.thinkgem.fast.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;


/**
 * 附件管理Entity
 *
 * @author renshuo
 * @version 2018-10-24
 */
public class MeisAttachment extends DataEntity<MeisAttachment> {

    private static final long serialVersionUID = 1L;
    private Office office;        // office_id
    private String title;        // title
    private String bizType;        // 业务类型            01设备            02设备申报            03设备维修
    private String bizId;        // biz_id
    private String path;        // path
    private String mimeType;        // mime_type
    private String suffix;        // suffix
    private String type;        // 类型img图片;video视频;audio音频;doc文档
    private String orderNumber;        // order_number
    private String virtualPath;        // virtual_path
    private Date createDate2;        // 创建时间
    private String officeId;
    private Long size;

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public String getOfficeId() {
        return officeId;
    }

    public void setOfficeId(String officeId) {
        this.officeId = officeId;
    }

    public MeisAttachment() {
        super();
    }

    public MeisAttachment(String id) {
        super(id);
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    @Length(min = 0, max = 255, message = "title长度必须介于 0 和 255 之间")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Length(min = 0, max = 20, message = "业务类型长度必须介于 0 和 20 之间")
    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    @Length(min = 0, max = 64, message = "biz_id长度必须介于 0 和 64 之间")
    public String getBizId() {
        return bizId;
    }

    public void setBizId(String bizId) {
        this.bizId = bizId;
    }

    @Length(min = 0, max = 512, message = "path长度必须介于 0 和 512 之间")
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Length(min = 0, max = 128, message = "mime_type长度必须介于 0 和 128 之间")
    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    @Length(min = 0, max = 32, message = "suffix长度必须介于 0 和 32 之间")
    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    @Length(min = 0, max = 20, message = "类型img图片;video视频;audio音频;doc文档长度必须介于 0 和 20 之间")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Length(min = 0, max = 11, message = "order_number长度必须介于 0 和 11 之间")
    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    @Length(min = 0, max = 50, message = "virtual_path长度必须介于 0 和 50 之间")
    public String getVirtualPath() {
        return virtualPath;
    }

    public void setVirtualPath(String virtualPath) {
        this.virtualPath = virtualPath;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message = "创建时间不能为空")
    public Date getCreateDate2() {
        return createDate2;
    }

    public void setCreateDate2(Date createDate2) {
        this.createDate2 = createDate2;
    }

}