package com.thinkgem.fast.modules.repo.web;

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
import com.thinkgem.fast.modules.repo.entity.Acceptance;
import com.thinkgem.fast.modules.repo.service.AcceptanceService;

/**
 * 验收单Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/acceptance")
public class AcceptanceController extends BaseController {

	@Autowired
	private AcceptanceService acceptanceService;
	
	@ModelAttribute
	public Acceptance get(@RequestParam(required=false) String id) {
		Acceptance entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = acceptanceService.get(id);
		}
		if (entity == null){
			entity = new Acceptance();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:acceptance:view")
	@RequestMapping(value = {"list", ""})
	public String list(Acceptance acceptance, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Acceptance> page = acceptanceService.findPage(new Page<Acceptance>(request, response), acceptance); 
		model.addAttribute("page", page);
		return "modules/repo/acceptanceList";
	}

	@RequiresPermissions("repo:acceptance:view")
	@RequestMapping(value = "form")
	public String form(Acceptance acceptance, Model model) {
		model.addAttribute("acceptance", acceptance);
		return "modules/repo/acceptanceForm";
	}

	@RequiresPermissions("repo:acceptance:edit")
	@RequestMapping(value = "save")
	public String save(Acceptance acceptance, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, acceptance)){
			return form(acceptance, model);
		}
		acceptanceService.save(acceptance);
		addMessage(redirectAttributes, "保存验收单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/acceptance/?repage";
	}
	
	@RequiresPermissions("repo:acceptance:edit")
	@RequestMapping(value = "delete")
	public String delete(Acceptance acceptance, RedirectAttributes redirectAttributes) {
		acceptanceService.delete(acceptance);
		addMessage(redirectAttributes, "删除验收单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/acceptance/?repage";
	}

}