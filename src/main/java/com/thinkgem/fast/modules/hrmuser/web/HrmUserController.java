package com.thinkgem.fast.modules.hrmuser.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.hrmuser.entity.*;
import com.thinkgem.fast.modules.hrmuser.service.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;

import java.util.*;

/**
 * 内部员工信息操作Controller
 *
 * @author 任硕
 * @version 2018-11-02
 */
@Controller
@RequestMapping(value = "${adminPath}/hrmuser/hrmUser")
public class HrmUserController extends BaseController {

    @Autowired
    private HrmUserService hrmUserService;
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

    @ModelAttribute
    public HrmUser get(@RequestParam(required = false) String id) {
        HrmUser entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = hrmUserService.get(id);
        }
        if (entity == null) {
            entity = new HrmUser();
        }
        return entity;
    }

    @RequiresPermissions("hrmuser:hrmUser:view")
    @RequestMapping(value = {"list", ""})
    public String list(HrmUser hrmUser, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<HrmUser> page = hrmUserService.findPage(new Page<HrmUser>(request, response), hrmUser);
        model.addAttribute("page", page);
        return "modules/hrmuser/hrmUserList";
    }

    @RequiresPermissions("hrmuser:hrmUser:view")
    @RequestMapping(value = "form")
    public String form(HrmUser hrmUser, Model model) {
        if (StringUtils.isBlank(hrmUser.getId())) {
            String yy = DateUtils.getLastYearYY();
            int total = hrmUserService.findCount();
            int emps = total + 1;
            String ss = StringUtils.frontCompWithZore(emps, 4);
            String empNumber = yy + ss;
            hrmUser.setEmpNumber(empNumber);
        }
        model.addAttribute("hrmUser", hrmUser);
        return "modules/hrmuser/hrmUserForm";
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @RequestMapping(value = "save")
    public String save(HrmUser hrmUser, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, hrmUser)) {
            return form(hrmUser, model);
        }
        //TODO 页面删除后下标还在原来位置映射后list中的下标对应所以需要判断改list集合中对象的属性是否不为空在进行保存
        this.filterParam(hrmUser);
        hrmUserService.save(hrmUser);
        addMessage(redirectAttributes, "保存内部员工成功");
        return "redirect:" + Global.getAdminPath() + "/hrmuser/hrmUser/?repage";
    }

    /**
     * 过滤user中的参数
     *
     * @param hrmUser
     */
    private void filterParam(HrmUser hrmUser) {

        List<HrmAddress> addressList = hrmUser.getHrmAddressList();
        if (CollectionUtils.isNotEmpty(addressList) && "2".equals(hrmUser.getCompanyType())) {
            Iterator<HrmAddress> it = addressList.iterator();
            while (it.hasNext()) {
                HrmAddress hrmAddress = it.next();
                if (hrmAddress == null) {
                    it.remove();
                } else {
                    if (hrmAddress.getArea() == null ||
                            StringUtils.isBlank(hrmAddress.getArea().getId()) ||
                            StringUtils.isBlank(hrmAddress.getContactPhone()) ||
                            StringUtils.isBlank(hrmAddress.getReceivingAddress()) ||
                            StringUtils.isBlank(hrmAddress.getReceivingName())) {
                        it.remove();
                    }
                }
            }
        } else {
            if (CollectionUtils.isNotEmpty(addressList)) {
                addressList.clear();
            }
        }

        List<HrmBank> hrmBanksList = hrmUser.getHrmBanksList();
        if (CollectionUtils.isNotEmpty(hrmBanksList)) {
            Iterator<HrmBank> it = hrmBanksList.iterator();
            while (it.hasNext()) {
                HrmBank hrmBank = it.next();
                if (hrmBank == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(hrmBank.getBank()) ||
                            StringUtils.isBlank(hrmBank.getBankNumber()) ||
                            //StringUtils.isBlank(hrmBank.getStatus()) ||
                            StringUtils.isBlank(hrmBank.getPositivePhoto())) {
                        it.remove();
                    }
                }
            }
        }
        List<HrmEducation> hrmEduList = hrmUser.getHrmEduList();
        if (CollectionUtils.isNotEmpty(hrmEduList)) {
            Iterator<HrmEducation> it = hrmEduList.iterator();
            while (it.hasNext()) {
                HrmEducation hrmEducation = it.next();
                if (hrmEducation == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(hrmEducation.getMajor()) ||
                            StringUtils.isBlank(hrmEducation.getSchoolName()) ||
                            hrmEducation.getStartDate() == null ||
                            hrmEducation.getEndDate() == null) {
                        it.remove();
                    }
                }
            }
        }
        List<HrmFamilyContact> hrmFamilyList = hrmUser.getHrmFamilyList();
        if (CollectionUtils.isNotEmpty(hrmFamilyList)) {
            Iterator<HrmFamilyContact> it = hrmFamilyList.iterator();
            while (it.hasNext()) {
                HrmFamilyContact hrmFamilyContact = it.next();
                if (hrmFamilyContact == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(hrmFamilyContact.getName()) ||
                            StringUtils.isBlank(hrmFamilyContact.getRelationship())) {
                        it.remove();
                    }
                }
            }
        }
        List<HrmWorkExper> hrmWorkExperList = hrmUser.getHrmWorkExperList();
        if (CollectionUtils.isNotEmpty(hrmWorkExperList)) {
            Iterator<HrmWorkExper> it = hrmWorkExperList.iterator();
            while (it.hasNext()) {
                HrmWorkExper hrmWorkExper = it.next();
                if (hrmWorkExper == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(hrmWorkExper.getCompanyName()) ||
                            StringUtils.isBlank(hrmWorkExper.getCompanyAddress())) {
                        it.remove();
                    }
                }
            }
        }
    }


    @RequiresPermissions("hrmuser:hrmUser:edit")
    @RequestMapping(value = "delete")
    public String delete(HrmUser hrmUser, RedirectAttributes redirectAttributes) {
        hrmUserService.delete(hrmUser);
        addMessage(redirectAttributes, "删除内部员工成功");
        return "redirect:" + Global.getAdminPath() + "/hrmuser/hrmUser/?repage";
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "deleteBank")
    public Map<String, Object> deleteBank(HrmBank bank) {
        Map<String, Object> res= new HashMap<String, Object>();
        hrmBankService.delete(bank);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }
    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "deleteAddress")
    public Map<String, Object> deleteAddress(HrmAddress Address) {
        Map<String, Object> res= new HashMap<String, Object>();
        hrmAddressService.delete(Address);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "deleteFamily")
    public Map<String, Object> deleteFamily(HrmFamilyContact  hrmFamilyContact) {
        Map<String, Object> res= new HashMap<String, Object>();

        hrmFamilyContactService.delete(hrmFamilyContact);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "deleteEdu")
    public Map<String, Object> deleteEdu(HrmEducation edu) {
        Map<String, Object> res= new HashMap<String, Object>();

        hrmEducationService.delete(edu);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "deleteWork")
    public Map<String, Object> deleteWork(HrmWorkExper work) {
        Map<String, Object> res= new HashMap<String, Object>();

        hrmWorkExperService.delete(work);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }



}