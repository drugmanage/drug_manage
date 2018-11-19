package com.thinkgem.fast.modules.hrmuser.service;

import java.util.List;

import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import com.thinkgem.fast.modules.attachment.service.MeisAttachmentService;
import com.thinkgem.fast.modules.hrmuser.entity.*;
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;
import com.thinkgem.fast.modules.settlement.service.SettlementObjectService;
import com.thinkgem.fast.modules.sys.entity.User;
import com.thinkgem.fast.modules.sys.utils.UserUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.hrmuser.dao.HrmUserDao;

/**
 * 内部员工信息操作Service
 *
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
    @Autowired
    private MeisAttachmentService meisAttachmentService;
    @Autowired
    private SettlementObjectService settlementObjectService;

    public HrmUser get(String id) {
        HrmUser hrmUser = super.get(id);
        MeisAttachment meisAttachment = new MeisAttachment();
        meisAttachment.setBizId(hrmUser.getId());
        List<MeisAttachment> attchList = meisAttachmentService.findAttchList(meisAttachment);
        for (MeisAttachment attachment : attchList) {
            if ("certPhoto".equals(attachment.getBizType())) {
                hrmUser.setCertPhoto(attachment.getPath());
            }
            if ("userPhoto".equals(attachment.getBizType())) {
                hrmUser.setUserPhoto(attachment.getPath());
            }
        }
        String userId = hrmUser.getId();
        HrmAddress hrmAddress = new HrmAddress();
        hrmAddress.setHrmUserId(userId);
        List<HrmAddress> hrmAddressList = hrmAddressService.findList(hrmAddress);

        HrmEducation hrmEducation = new HrmEducation();
        hrmEducation.setHrmUser(userId);
        List<HrmEducation> hrmEduList = hrmEducationService.findList(hrmEducation);

        HrmFamilyContact familyContact = new HrmFamilyContact();
        familyContact.setHrmUserId(userId);
        List<HrmFamilyContact> hrmFamilyList = hrmFamilyContactService.findList(familyContact);

        HrmBank hrmBank = new HrmBank();
        hrmBank.setHrmUserId(userId);
        List<HrmBank> hrmBanksList = hrmBankService.findList(hrmBank);
        for (HrmBank bank : hrmBanksList) {
            MeisAttachment bankAttachment = new MeisAttachment();
            bankAttachment.setBizId(bank.getId());
            List<MeisAttachment> bankAttchList = meisAttachmentService.findAttchList(bankAttachment);
            for (MeisAttachment attachment : bankAttchList) {
                if ("positivePhoto".equals(attachment.getBizType())) {
                    bank.setPositivePhoto(attachment.getPath());
                }
                if ("backPhoto".equals(attachment.getBizType())) {
                    bank.setBackPhoto(attachment.getPath());
                }
            }
        }
        HrmWorkExper hrmWorkExper = new HrmWorkExper();
        hrmWorkExper.setHrmUserId(userId);
        List<HrmWorkExper> hrmWorkExperList = hrmWorkExperService.findList(hrmWorkExper);
        hrmUser.setHrmAddressList(hrmAddressList);
        hrmUser.setHrmEduList(hrmEduList);
        hrmUser.setHrmBanksList(hrmBanksList);
        hrmUser.setHrmFamilyList(hrmFamilyList);
        hrmUser.setHrmWorkExperList(hrmWorkExperList);
        return hrmUser;
    }

    public List<HrmUser> findList(HrmUser hrmUser) {
        User user = UserUtils.getUser();
        //增加数据权限
        hrmUser.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "u2"));
        return super.findList(hrmUser);
    }

    public Page<HrmUser> findPage(Page<HrmUser> page, HrmUser hrmUser) {
        return super.findPage(page, hrmUser);
    }

    @Override
    @Transactional
    public void save(HrmUser hrmUser) {
        super.save(hrmUser);
        if ("1".equals(hrmUser.getSettlementFlag())) {
            SettlementObject settlementObject = new SettlementObject();
            settlementObject.setOuterId(hrmUser.getId());
            //1区域经理2业务员3内部员工
            String ut = hrmUser.getUserType();
            if ("1".equals(ut)) {
                /**
                 * 结算对象类型
                 1-客户资料
                 2-业务组
                 3-供应商业务组
                 4-区域经理
                 5-业务员
                 */
                settlementObject.setSettlementType("4");
            } else if ("2".equals(ut)) {
                settlementObject.setSettlementType("5");
            }
            settlementObjectService.save(settlementObject);
        }
        //保存照片信息
        meisAttachmentService.saveAttachment(hrmUser.getUserPhoto(), hrmUser.getId(), "userPhoto", "img");
        meisAttachmentService.saveAttachment(hrmUser.getCertPhoto(), hrmUser.getId(), "certPhoto", "img");
        //设置多个集合信息
        setCollInfo(hrmUser);
    }

    public void setCollInfo(HrmUser hrmUser) {
        List<HrmAddress> hrmAddressList = hrmUser.getHrmAddressList();
        List<HrmEducation> hrmEduList = hrmUser.getHrmEduList();
        List<HrmFamilyContact> hrmFamilyList = hrmUser.getHrmFamilyList();
        List<HrmBank> hrmBanksList = hrmUser.getHrmBanksList();
        List<HrmWorkExper> hrmWorkExperList = hrmUser.getHrmWorkExperList();

        String userId = hrmUser.getId();
        if (CollectionUtils.isNotEmpty(hrmAddressList)) {
            for (HrmAddress hrmAddress : hrmAddressList) {
                hrmAddress.setHrmUserId(hrmUser.getId());
                hrmAddressService.save(hrmAddress);
            }
        }
        if (CollectionUtils.isNotEmpty(hrmEduList)) {
            for (HrmEducation hrmEducation : hrmEduList) {
                hrmEducation.setHrmUser(hrmUser.getId());
                hrmEducationService.save(hrmEducation);
            }
        }
        if (CollectionUtils.isNotEmpty(hrmFamilyList)) {
            for (HrmFamilyContact hrmFamilyContact : hrmFamilyList) {
                hrmFamilyContact.setHrmUserId(hrmUser.getId());
                hrmFamilyContactService.save(hrmFamilyContact);
            }
        }

        if (CollectionUtils.isNotEmpty(hrmBanksList)) {
            for (HrmBank hrmBank : hrmBanksList) {
                hrmBank.setHrmUserId(hrmUser.getId());
                hrmBankService.save(hrmBank);
                meisAttachmentService.saveAttachment(hrmBank.getPositivePhoto(), hrmBank.getId(), "positivePhoto", "img");
                meisAttachmentService.saveAttachment(hrmBank.getBackPhoto(), hrmBank.getId(), "backPhoto", "img");
            }
        }

        if (CollectionUtils.isNotEmpty(hrmWorkExperList)) {
            for (HrmWorkExper hrmWorkExper : hrmWorkExperList) {
                hrmWorkExper.setHrmUserId(hrmUser.getId());
                hrmWorkExperService.save(hrmWorkExper);
            }
        }
    }

    @Override
    @Transactional(readOnly = false)
    public void delete(HrmUser hrmUser) {
        super.delete(hrmUser);
    }

    public int findCount() {
        return hrmUserDao.findCount();
    }

    public void updateUserUpdate(HrmUser hrmUser) {
        hrmUserDao.updateUserUpdate(hrmUser);
    }
}