package com.thinkgem.fast.modules.oa.entity;

import com.thinkgem.fast.common.persistence.ActEntity;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.fast.modules.sys.entity.User;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 转正申请Entity
 * @author 任硕
 * @version 2018-11-07
 */
public class HrmRegularApply extends ActEntity<HrmRegularApply> {
	
	private static final long serialVersionUID = 1L;
	private User hrmUser;		// 员工表ID
	private Date applyTime;		// 申请时间
	private Date estimateTime;		// 预计转正时间
	private String estimatePost;		// 预计转正岗位
	private String content;				//转正原因
	private String hrManageView;		// 人事部主管意见
	private String hrMinisterView;		// 人事部部长意见
	private String ceoView;		// 总经理意见
	
	public HrmRegularApply() {
		super();
	}

	public HrmRegularApply(String id){
		super(id);
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getHrmUser() {
		return hrmUser;
	}

	public void setHrmUser(User hrmUser) {
		this.hrmUser = hrmUser;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEstimateTime() {
		return estimateTime;
	}

	public void setEstimateTime(Date estimateTime) {
		this.estimateTime = estimateTime;
	}
	
	@Length(min=0, max=32, message="预计转正岗位长度必须介于 0 和 32 之间")
	public String getEstimatePost() {
		return estimatePost;
	}

	public void setEstimatePost(String estimatePost) {
		this.estimatePost = estimatePost;
	}
	
	@Length(min=0, max=500, message="人事部主管意见长度必须介于 0 和 500 之间")
	public String getHrManageView() {
		return hrManageView;
	}

	public void setHrManageView(String hrManageView) {
		this.hrManageView = hrManageView;
	}
	
	@Length(min=0, max=500, message="人事部部长意见长度必须介于 0 和 500 之间")
	public String getHrMinisterView() {
		return hrMinisterView;
	}

	public void setHrMinisterView(String hrMinisterView) {
		this.hrMinisterView = hrMinisterView;
	}
	
	@Length(min=0, max=500, message="总经理意见长度必须介于 0 和 500 之间")
	public String getCeoView() {
		return ceoView;
	}

	public void setCeoView(String ceoView) {
		this.ceoView = ceoView;
	}
	
}