package com.thinkgem.fast.modules.sales.web;

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
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPrice;
import com.thinkgem.fast.modules.sales.service.SalesBackDiffPriceService;

/**
 * 销售退补差价单Controller
 * @author shiao
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesBackDiffPrice")
public class SalesBackDiffPriceController extends BaseController {

	@Autowired
	private SalesBackDiffPriceService salesBackDiffPriceService;
	
	@ModelAttribute
	public SalesBackDiffPrice get(@RequestParam(required=false) String id) {
		SalesBackDiffPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesBackDiffPriceService.get(id);
		}
		if (entity == null){
			entity = new SalesBackDiffPrice();
		}
		return entity;
	}
	
	@RequiresPermissions("sales:salesBackDiffPrice:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesBackDiffPrice salesBackDiffPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesBackDiffPrice> page = salesBackDiffPriceService.findPage(new Page<SalesBackDiffPrice>(request, response), salesBackDiffPrice); 
		model.addAttribute("page", page);
		return "modules/sales/salesBackDiffPriceList";
	}

	@RequiresPermissions("sales:salesBackDiffPrice:view")
	@RequestMapping(value = "form")
	public String form(SalesBackDiffPrice salesBackDiffPrice, Model model) {
		model.addAttribute("salesBackDiffPrice", salesBackDiffPrice);
		return "modules/sales/salesBackDiffPriceForm";
	}

	@RequiresPermissions("sales:salesBackDiffPrice:edit")
	@RequestMapping(value = "save")
	public String save(SalesBackDiffPrice salesBackDiffPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesBackDiffPrice)){
			return form(salesBackDiffPrice, model);
		}
		salesBackDiffPriceService.save(salesBackDiffPrice);
		addMessage(redirectAttributes, "保存销售退补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackDiffPrice/?repage";
	}
	
	@RequiresPermissions("sales:salesBackDiffPrice:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesBackDiffPrice salesBackDiffPrice, RedirectAttributes redirectAttributes) {
		salesBackDiffPriceService.delete(salesBackDiffPrice);
		addMessage(redirectAttributes, "删除销售退补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackDiffPrice/?repage";
	}

}