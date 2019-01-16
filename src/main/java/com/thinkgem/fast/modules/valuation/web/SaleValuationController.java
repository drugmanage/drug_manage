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
import com.thinkgem.fast.modules.valuation.entity.SaleValuation;
import com.thinkgem.fast.modules.valuation.service.SaleValuationService;

/**
 * 业务员定价Controller
 * @author renshuo
 * @version 2019-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/valuation/saleValuation")
public class SaleValuationController extends BaseController {

	@Autowired
	private SaleValuationService saleValuationService;
	
	@ModelAttribute
	public SaleValuation get(@RequestParam(required=false) String id) {
		SaleValuation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = saleValuationService.get(id);
		}
		if (entity == null){
			entity = new SaleValuation();
		}
		return entity;
	}
	
	@RequiresPermissions("valuation:saleValuation:view")
	@RequestMapping(value = {"list", ""})
	public String list(SaleValuation saleValuation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SaleValuation> page = saleValuationService.findPage(new Page<SaleValuation>(request, response), saleValuation); 
		model.addAttribute("page", page);
		return "modules/valuation/saleValuationList";
	}

	@RequiresPermissions("valuation:saleValuation:view")
	@RequestMapping(value = "form")
	public String form(SaleValuation saleValuation, Model model) {
		model.addAttribute("saleValuation", saleValuation);
		return "modules/valuation/saleValuationForm";
	}

	@RequiresPermissions("valuation:saleValuation:edit")
	@RequestMapping(value = "save")
	public String save(SaleValuation saleValuation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, saleValuation)){
			return form(saleValuation, model);
		}
		saleValuationService.save(saleValuation);
		addMessage(redirectAttributes, "保存业务员定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/saleValuation/?repage";
	}
	
	@RequiresPermissions("valuation:saleValuation:edit")
	@RequestMapping(value = "delete")
	public String delete(SaleValuation saleValuation, RedirectAttributes redirectAttributes) {
		saleValuationService.delete(saleValuation);
		addMessage(redirectAttributes, "删除业务员定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/saleValuation/?repage";
	}

}