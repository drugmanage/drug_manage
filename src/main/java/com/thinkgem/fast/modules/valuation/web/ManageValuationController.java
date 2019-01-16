package com.thinkgem.fast.modules.valuation.web;

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
import com.thinkgem.fast.modules.valuation.entity.ManageValuation;
import com.thinkgem.fast.modules.valuation.service.ManageValuationService;

/**
 * 区域经理定价Controller
 * @author renshuo
 * @version 2019-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/valuation/manageValuation")
public class ManageValuationController extends BaseController {

	@Autowired
	private ManageValuationService manageValuationService;
	
	@ModelAttribute
	public ManageValuation get(@RequestParam(required=false) String id) {
		ManageValuation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manageValuationService.get(id);
		}
		if (entity == null){
			entity = new ManageValuation();
		}
		return entity;
	}
	
	@RequiresPermissions("valuation:manageValuation:view")
	@RequestMapping(value = {"list", ""})
	public String list(ManageValuation manageValuation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManageValuation> page = manageValuationService.findPage(new Page<ManageValuation>(request, response), manageValuation); 
		model.addAttribute("page", page);
		return "modules/valuation/manageValuationList";
	}

	@RequiresPermissions("valuation:manageValuation:view")
	@RequestMapping(value = "form")
	public String form(ManageValuation manageValuation, Model model) {
		model.addAttribute("manageValuation", manageValuation);
		return "modules/valuation/manageValuationForm";
	}

	@RequiresPermissions("valuation:manageValuation:edit")
	@RequestMapping(value = "save")
	public String save(ManageValuation manageValuation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, manageValuation)){
			return form(manageValuation, model);
		}
		manageValuationService.save(manageValuation);
		addMessage(redirectAttributes, "保存区域经理定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/manageValuation/?repage";
	}
	
	@RequiresPermissions("valuation:manageValuation:edit")
	@RequestMapping(value = "delete")
	public String delete(ManageValuation manageValuation, RedirectAttributes redirectAttributes) {
		manageValuationService.delete(manageValuation);
		addMessage(redirectAttributes, "删除区域经理定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/manageValuation/?repage";
	}

}