package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.hrmuser.entity.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.dao.HrmUserDao;

/**
 * 内部员工信息操作Service
 * @author 任硕
 * @version 2018-11-02
 */
@Service
@Transactional(readOnly = true)
public class HrmUserService extends CrudService<HrmUserDao, HrmUser> {

	@Autowired
	private HrmUserDao hrmUserDao;
	@Autowired
	private HrmAddressService hrmAddressService;
	@Autowired
	private HrmFamilyContactService hrmFamilyContactService;
	@Autowired
	private HrmBankService hrmBankService;
	@Autowired
	private HrmEducationService hrmEducationService;
	@Autowired
	private HrmWorkExperService hrmWorkExperService;


	public HrmUser get(String id) {
		return super.get(id);
	}
	
	public List<HrmUser> findList(HrmUser hrmUser) {
		return super.findList(hrmUser);
	}
	
	public Page<HrmUser> findPage(Page<HrmUser> page, HrmUser hrmUser) {
		return super.findPage(page, hrmUser);
	}
	
	@Override
	@Transactional
	public void save(HrmUser hrmUser) {
		super.save(hrmUser);

		List<HrmAddress> hrmAddressList = hrmUser.getHrmAddressList();
		List<HrmEducation> hrmEduList = hrmUser.getHrmEduList();
		List<HrmFamilyContact> hrmFamilyList = hrmUser.getHrmFamilyList();
		List<HrmBank> hrmBanksList = hrmUser.getHrmBanksList();
		List<HrmWorkExper> hrmWorkExperList = hrmUser.getHrmWorkExperList();

		if(CollectionUtils.isNotEmpty(hrmAddressList)){
			for (HrmAddress hrmAddress : hrmAddressList) {
				hrmAddress.setHrmUserId(hrmUser.getId());
				hrmAddressService.save(hrmAddress);
			}

		}
		if(CollectionUtils.isNotEmpty(hrmEduList)){
			for (HrmEducation hrmEducation : hrmEduList) {
				hrmEducation.setHrmUser(hrmUser.getId());
				hrmEducationService.save(hrmEducation);
			}

		}
		if(CollectionUtils.isNotEmpty(hrmFamilyList)){
			for (HrmFamilyContact hrmFamilyContact : hrmFamilyList) {
				hrmFamilyContact.setHrmUserId(hrmUser.getId());
				hrmFamilyContactService.save(hrmFamilyContact);
			}

		}
		if(CollectionUtils.isNotEmpty(hrmBanksList)){
			for (HrmBank hrmBank : hrmBanksList) {
				hrmBank.setHrmUserId(hrmUser.getId());
				hrmBankService.save(hrmBank);
			}

		}
		if(CollectionUtils.isNotEmpty(hrmWorkExperList)){
			for (HrmWorkExper hrmWorkExper : hrmWorkExperList) {
				hrmWorkExper.setHrmUserId(hrmUser.getId());
				hrmWorkExperService.save(hrmWorkExper);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(HrmUser hrmUser) {
		super.delete(hrmUser);
	}

	public int findCount(){
		return hrmUserDao.findCount();
	}
}