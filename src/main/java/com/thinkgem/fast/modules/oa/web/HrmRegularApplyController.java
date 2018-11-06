package com.thinkgem.fast.modules.oa.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.fast.modules.oa.entity.HrmRegularApply;
import com.thinkgem.fast.modules.oa.service.HrmRegularApplyService;

/**
 * 转正申请Controller
 * @author 任硕
 * @version 2018-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/hrmRegularApply")
public class HrmRegularApplyController extends BaseController {

	@Autowired
	private HrmRegularApplyService hrmRegularApplyService;
	
	@ModelAttribute
	public HrmRegularApply get(@RequestParam(required=false) String id) {
		HrmRegularApply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hrmRegularApplyService.get(id);
		}
		if (entity == null){
			entity = new HrmRegularApply();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:hrmRegularApply:view")
	@RequestMapping(value = {"list", ""})
	public String list(HrmRegularApply hrmRegularApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HrmRegularApply> page = hrmRegularApplyService.findPage(new Page<HrmRegularApply>(request, response), hrmRegularApply); 
		model.addAttribute("page", page);
		return "modules/oa/hrmRegularApplyList";
	}

	@RequiresPermissions("oa:hrmRegularApply:view")
	@RequestMapping(value = "form")
	public String form(HrmRegularApply hrmRegularApply, Model model) {
		model.addAttribute("hrmRegularApply", hrmRegularApply);
		return "modules/oa/hrmRegularApplyForm";
	}

	@RequiresPermissions("oa:hrmRegularApply:edit")
	@RequestMapping(value = "save")
	public String save(HrmRegularApply hrmRegularApply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hrmRegularApply)){
			return form(hrmRegularApply, model);
		}
		hrmRegularApplyService.save(hrmRegularApply);
		addMessage(redirectAttributes, "保存转正申请成功");
		return "redirect:"+Global.getAdminPath()+"/oa/hrmRegularApply/?repage";
	}
	
	@RequiresPermissions("oa:hrmRegularApply:edit")
	@RequestMapping(value = "delete")
	public String delete(HrmRegularApply hrmRegularApply, RedirectAttributes redirectAttributes) {
		hrmRegularApplyService.delete(hrmRegularApply);
		addMessage(redirectAttributes, "删除转正申请成功");
		return "redirect:"+Global.getAdminPath()+"/oa/hrmRegularApply/?repage";
	}

}