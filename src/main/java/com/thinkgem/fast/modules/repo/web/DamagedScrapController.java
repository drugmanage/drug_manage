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
import com.thinkgem.fast.modules.repo.entity.DamagedScrap;
import com.thinkgem.fast.modules.repo.service.DamagedScrapService;

/**
 * 破损/报废单Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/damagedScrap")
public class DamagedScrapController extends BaseController {

	@Autowired
	private DamagedScrapService damagedScrapService;
	
	@ModelAttribute
	public DamagedScrap get(@RequestParam(required=false) String id) {
		DamagedScrap entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = damagedScrapService.get(id);
		}
		if (entity == null){
			entity = new DamagedScrap();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:damagedScrap:view")
	@RequestMapping(value = {"list", ""})
	public String list(DamagedScrap damagedScrap, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<DamagedScrap> page = damagedScrapService.findPage(new Page<DamagedScrap>(request, response), damagedScrap); 
		model.addAttribute("page", page);
		return "modules/repo/damagedScrapList";
	}

	@RequiresPermissions("repo:damagedScrap:view")
	@RequestMapping(value = "form")
	public String form(DamagedScrap damagedScrap, Model model) {
		model.addAttribute("damagedScrap", damagedScrap);
		return "modules/repo/damagedScrapForm";
	}

	@RequiresPermissions("repo:damagedScrap:edit")
	@RequestMapping(value = "save")
	public String save(DamagedScrap damagedScrap, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, damagedScrap)){
			return form(damagedScrap, model);
		}
		damagedScrapService.save(damagedScrap);
		addMessage(redirectAttributes, "保存破损/报废单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/damagedScrap/?repage";
	}
	
	@RequiresPermissions("repo:damagedScrap:edit")
	@RequestMapping(value = "delete")
	public String delete(DamagedScrap damagedScrap, RedirectAttributes redirectAttributes) {
		damagedScrapService.delete(damagedScrap);
		addMessage(redirectAttributes, "删除破损/报废单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/damagedScrap/?repage";
	}

}