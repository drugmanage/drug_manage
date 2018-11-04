package com.thinkgem.fast.modules.hrmuser.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.hrmuser.entity.HrmEducation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUser;
import com.thinkgem.fast.modules.hrmuser.service.HrmUserService;

import java.util.ArrayList;
import java.util.List;

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
        String empNumber = "";
        if (StringUtils.isBlank(hrmUser.getId())) {
            String yy = DateUtils.getLastYearYY();
            int total = hrmUserService.findCount();
            int emps =total == 0 ? 1 : total;
            String ss = StringUtils.frontCompWithZore(emps, 4);
            empNumber = yy + ss;
        }
        hrmUser.setEmpNumber(empNumber);
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
//		hrmUser.getHrmEduList()
//		hrmUserService.save(hrmUser);
        addMessage(redirectAttributes, "保存内部员工成功");
        return "redirect:" + Global.getAdminPath() + "/hrmuser/hrmUser/?repage";
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @RequestMapping(value = "delete")
    public String delete(HrmUser hrmUser, RedirectAttributes redirectAttributes) {
        hrmUserService.delete(hrmUser);
        addMessage(redirectAttributes, "删除内部员工成功");
        return "redirect:" + Global.getAdminPath() + "/hrmuser/hrmUser/?repage";
    }

}