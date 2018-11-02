package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 教育信息Entity
 * @author 任硕
 * @version 2018-11-03
 */
public class HrmEducation extends DataEntity<HrmEducation> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUser;		// 员工表ID
	private Date startDate;		// 开始时间
	private Date endDate;		// 结束时间
	private String stage;		// 阶段：初中、高中、大学、硕士、博士
	private String schoolName;		// 学校
	private String major;		// 专业
	private String witness;		// 证明人
	private String phone;		// 联系电话
	
	public HrmEducation() {
		super();
	}

	public HrmEducation(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工表ID长度必须介于 0 和 64 之间")
	public String getHrmUser() {
		return hrmUser;
	}

	public void setHrmUser(String hrmUser) {
		this.hrmUser = hrmUser;
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
	
	@Length(min=0, max=1, message="阶段：初中、高中、大学、硕士、博士长度必须介于 0 和 1 之间")
	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}
	
	@Length(min=0, max=255, message="学校长度必须介于 0 和 255 之间")
	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	@Length(min=0, max=128, message="专业长度必须介于 0 和 128 之间")
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	
	@Length(min=0, max=32, message="证明人长度必须介于 0 和 32 之间")
	public String getWitness() {
		return witness;
	}

	public void setWitness(String witness) {
		this.witness = witness;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}