package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 工作经历Entity
 * @author 任硕
 * @version 2018-11-03
 */
public class HrmWorkExper extends DataEntity<HrmWorkExper> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUserId;		// 员工表id
	private Date startDate;		// 开始时间
	private Date endDate;		// 结束时间
	private String companyName;		// 公司名称
	private String companyAddress;		// 工作地点
	private String post;		// 职务
	private String phone;		// 证明人电话
	
	public HrmWorkExper() {
		super();
	}

	public HrmWorkExper(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工表id长度必须介于 0 和 64 之间")
	public String getHrmUserId() {
		return hrmUserId;
	}

	public void setHrmUserId(String hrmUserId) {
		this.hrmUserId = hrmUserId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Length(min=0, max=128, message="公司名称长度必须介于 0 和 128 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=0, max=255, message="工作地点长度必须介于 0 和 255 之间")
	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	
	@Length(min=0, max=32, message="职务长度必须介于 0 和 32 之间")
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	@Length(min=0, max=20, message="证明人电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}