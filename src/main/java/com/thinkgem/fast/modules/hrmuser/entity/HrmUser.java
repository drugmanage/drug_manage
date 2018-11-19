package com.thinkgem.fast.modules.hrmuser.entity;

import com.thinkgem.fast.modules.sys.entity.Area;
import com.thinkgem.fast.modules.sys.entity.Office;
import com.thinkgem.fast.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.fast.common.persistence.DataEntity;

/**
 * 内部员工信息操作Entity
 * @author 任硕
 * @version 2018-11-02
 */
public class HrmUser extends DataEntity<HrmUser> {
	
	private static final long serialVersionUID = 1L;
	private User sysUser;		// 用户表id
	private Office office;
	private String empNumber;		// 职员编号
	private String empName;		// 职员名称
	private String pinyin;		// 助记码
	private Date birth;		// 出生日期
	private String sex;		// 性别
	private String age;		// 年龄
	private String education;		// 学历
	private String nativePlace;		// 籍贯
	private String maritalStatus;		// 婚姻状况
	private String nation;		// 民族
	private String qqNumber;		// QQ号
	private String mobile;		// 手机号
	private String email;		// 邮箱
	private String zipCode;		// 邮编
	private String proCode;		// 省代码
	private String cityCode;		// 市代码
	private String countyCode;		// 县代码
	//省市县替换为地区id
	private Area area;
	private String contactAddress;		// 街道门牌号
	private String schoolName;		// 毕业院校
	private Date regTime;		// 应聘登记时间
	private String jobObjective;		// 应聘职务
	private String health;		// 健康状况
	private String politicalOutlook;		// 政治面貌
	private String telephone;		// 座机
	private String emergencyContactName;		// 紧急联系人姓名
	private String emergencyContactPhone;		// 紧急联系人电话
	private String personalDesc;		// 个人描述
	private Date applyTime;		// 申请时间
	private String userType;		// 用户类型
	private String certType;		// 证件类型
	private String certNumber;		// 证件号码
	private String companyType;		// 公司类型
	private Date beginRegTime;		// 开始 应聘登记时间
	private Date endRegTime;		// 结束 应聘登记时间

	private String userStatus;		// 用户类型

	private String settlementFlag;		//是否为结算对象

	//用户照片
	private String userPhoto;
	//证件照路径
	private String certPhoto;
	//对应的教育信息列表信息
	private List<HrmEducation> hrmEduList = new ArrayList<HrmEducation>();
	//对应的家庭人员信息列表信息
	private List<HrmFamilyContact> hrmFamilyList;
	//对应的工作经历列表信息
	private List<HrmWorkExper> hrmWorkExperList;
	//银行卡信息列表
	private List<HrmBank> hrmBanksList;

	private List<HrmAddress> hrmAddressList;

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public List<HrmAddress> getHrmAddressList() {
		return hrmAddressList;
	}

	public void setHrmAddressList(List<HrmAddress> hrmAddressList) {
		this.hrmAddressList = hrmAddressList;
	}

	public String getCertPhoto() {
		return certPhoto;
	}

	public void setCertPhoto(String certPhoto) {
		this.certPhoto = certPhoto;
	}

	public List<HrmEducation> getHrmEduList() {
		return hrmEduList;
	}

	public void setHrmEduList(List<HrmEducation> hrmEduList) {
		this.hrmEduList = hrmEduList;
	}

	public List<HrmFamilyContact> getHrmFamilyList() {
		return hrmFamilyList;
	}

	public void setHrmFamilyList(List<HrmFamilyContact> hrmFamilyList) {
		this.hrmFamilyList = hrmFamilyList;
	}

	public List<HrmWorkExper> getHrmWorkExperList() {
		return hrmWorkExperList;
	}

	public void setHrmWorkExperList(List<HrmWorkExper> hrmWorkExperList) {
		this.hrmWorkExperList = hrmWorkExperList;
	}

	public List<HrmBank> getHrmBanksList() {
		return hrmBanksList;
	}

	public void setHrmBanksList(List<HrmBank> hrmBanksList) {
		this.hrmBanksList = hrmBanksList;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getSettlementFlag() {
		return settlementFlag;
	}

	public void setSettlementFlag(String settlementFlag) {
		this.settlementFlag = settlementFlag;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public HrmUser() {
		super();
	}

	public HrmUser(String id){
		super(id);
	}

	public User getSysUser() {
		return sysUser;
	}

	public void setSysUser(User sysUser) {
		this.sysUser = sysUser;
	}
	
	@Length(min=1, max=32, message="职员编号长度必须介于 1 和 32 之间")
	public String getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	
	@Length(min=1, max=64, message="职员名称长度必须介于 1 和 64 之间")
	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	@Length(min=1, max=32, message="助记码长度必须介于 1 和 32 之间")
	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=11, message="年龄长度必须介于 0 和 11 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(min=0, max=20, message="学历长度必须介于 0 和 20 之间")
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	@Length(min=0, max=128, message="籍贯长度必须介于 0 和 128 之间")
	public String getNativePlace() {
		return nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	
	@Length(min=0, max=1, message="婚姻状况长度必须介于 0 和 1 之间")
	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	
	@Length(min=0, max=10, message="民族长度必须介于 0 和 10 之间")
	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}
	
	@Length(min=0, max=20, message="QQ号长度必须介于 0 和 20 之间")
	public String getQqNumber() {
		return qqNumber;
	}

	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}
	
	@Length(min=0, max=20, message="手机号长度必须介于 0 和 20 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=32, message="邮箱长度必须介于 0 和 32 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=20, message="邮编长度必须介于 0 和 20 之间")
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	@Length(min=0, max=10, message="省代码长度必须介于 0 和 10 之间")
	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	
	@Length(min=0, max=10, message="市代码长度必须介于 0 和 10 之间")
	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	@Length(min=0, max=10, message="县代码长度必须介于 0 和 10 之间")
	public String getCountyCode() {
		return countyCode;
	}

	public void setCountyCode(String countyCode) {
		this.countyCode = countyCode;
	}
	
	@Length(min=0, max=25, message="街道门牌号长度必须介于 0 和 25 之间")
	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}
	
	@Length(min=0, max=255, message="毕业院校长度必须介于 0 和 255 之间")
	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	
	@Length(min=0, max=32, message="应聘职务长度必须介于 0 和 32 之间")
	public String getJobObjective() {
		return jobObjective;
	}

	public void setJobObjective(String jobObjective) {
		this.jobObjective = jobObjective;
	}
	
	@Length(min=0, max=10, message="健康状况长度必须介于 0 和 10 之间")
	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}
	
	@Length(min=0, max=10, message="政治面貌长度必须介于 0 和 10 之间")
	public String getPoliticalOutlook() {
		return politicalOutlook;
	}

	public void setPoliticalOutlook(String politicalOutlook) {
		this.politicalOutlook = politicalOutlook;
	}
	
	@Length(min=0, max=20, message="座机长度必须介于 0 和 20 之间")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	@Length(min=0, max=32, message="紧急联系人姓名长度必须介于 0 和 32 之间")
	public String getEmergencyContactName() {
		return emergencyContactName;
	}

	public void setEmergencyContactName(String emergencyContactName) {
		this.emergencyContactName = emergencyContactName;
	}
	
	@Length(min=0, max=20, message="紧急联系人电话长度必须介于 0 和 20 之间")
	public String getEmergencyContactPhone() {
		return emergencyContactPhone;
	}

	public void setEmergencyContactPhone(String emergencyContactPhone) {
		this.emergencyContactPhone = emergencyContactPhone;
	}
	
	@Length(min=0, max=1000, message="个人描述长度必须介于 0 和 1000 之间")
	public String getPersonalDesc() {
		return personalDesc;
	}

	public void setPersonalDesc(String personalDesc) {
		this.personalDesc = personalDesc;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Length(min=0, max=1, message="用户类型长度必须介于 0 和 1 之间")
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	@Length(min=0, max=1, message="证件类型长度必须介于 0 和 1 之间")
	public String getCertType() {
		return certType;
	}

	public void setCertType(String certType) {
		this.certType = certType;
	}
	
	@Length(min=0, max=64, message="证件号码长度必须介于 0 和 64 之间")
	public String getCertNumber() {
		return certNumber;
	}

	public void setCertNumber(String certNumber) {
		this.certNumber = certNumber;
	}
	
	@Length(min=0, max=1, message="公司类型长度必须介于 0 和 1 之间")
	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	
	public Date getBeginRegTime() {
		return beginRegTime;
	}

	public void setBeginRegTime(Date beginRegTime) {
		this.beginRegTime = beginRegTime;
	}
	
	public Date getEndRegTime() {
		return endRegTime;
	}

	public void setEndRegTime(Date endRegTime) {
		this.endRegTime = endRegTime;
	}
		
}