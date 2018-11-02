package com.thinkgem.fast.modules.hrmuser.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 家庭成员信息Entity
 * @author 任硕
 * @version 2018-11-03
 */
public class HrmFamilyContact extends DataEntity<HrmFamilyContact> {
	
	private static final long serialVersionUID = 1L;
	private String hrmUserId;		// 员工表ID
	private String name;		// 姓名
	private String relationship;		// 亲属关系
	private String workUnit;		// 工作单位
	private String post;		// 职务
	private String phone;		// 联系电话
	
	public HrmFamilyContact() {
		super();
	}

	public HrmFamilyContact(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工表ID长度必须介于 0 和 64 之间")
	public String getHrmUserId() {
		return hrmUserId;
	}

	public void setHrmUserId(String hrmUserId) {
		this.hrmUserId = hrmUserId;
	}
	
	@Length(min=0, max=32, message="姓名长度必须介于 0 和 32 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=32, message="亲属关系长度必须介于 0 和 32 之间")
	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	
	@Length(min=0, max=128, message="工作单位长度必须介于 0 和 128 之间")
	public String getWorkUnit() {
		return workUnit;
	}

	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}
	
	@Length(min=0, max=32, message="职务长度必须介于 0 和 32 之间")
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}