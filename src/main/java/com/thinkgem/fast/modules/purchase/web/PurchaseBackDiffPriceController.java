package com.thinkgem.fast.modules.purchase.web;

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
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackDiffPrice;
import com.thinkgem.fast.modules.purchase.service.PurchaseBackDiffPriceService;

/**
 * 采购补差价单Controller
 * @author 刘海涛
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchaseBackDiffPrice")
public class PurchaseBackDiffPriceController extends BaseController {

	@Autowired
	private PurchaseBackDiffPriceService purchaseBackDiffPriceService;
	
	@ModelAttribute
	public PurchaseBackDiffPrice get(@RequestParam(required=false) String id) {
		PurchaseBackDiffPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = purchaseBackDiffPriceService.get(id);
		}
		if (entity == null){
			entity = new PurchaseBackDiffPrice();
		}
		return entity;
	}
	
	@RequiresPermissions("purchase:purchaseBackDiffPrice:view")
	@RequestMapping(value = {"list", ""})
	public String list(PurchaseBackDiffPrice purchaseBackDiffPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PurchaseBackDiffPrice> page = purchaseBackDiffPriceService.findPage(new Page<PurchaseBackDiffPrice>(request, response), purchaseBackDiffPrice); 
		model.addAttribute("page", page);
		return "modules/purchase/purchaseBackDiffPriceList";
	}

	@RequiresPermissions("purchase:purchaseBackDiffPrice:view")
	@RequestMapping(value = "form")
	public String form(PurchaseBackDiffPrice purchaseBackDiffPrice, Model model) {
		model.addAttribute("purchaseBackDiffPrice", purchaseBackDiffPrice);
		return "modules/purchase/purchaseBackDiffPriceForm";
	}

	@RequiresPermissions("purchase:purchaseBackDiffPrice:edit")
	@RequestMapping(value = "save")
	public String save(PurchaseBackDiffPrice purchaseBackDiffPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, purchaseBackDiffPrice)){
			return form(purchaseBackDiffPrice, model);
		}
		purchaseBackDiffPriceService.save(purchaseBackDiffPrice);
		addMessage(redirectAttributes, "保存采购补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseBackDiffPrice/?repage";
	}
	
	@RequiresPermissions("purchase:purchaseBackDiffPrice:edit")
	@RequestMapping(value = "delete")
	public String delete(PurchaseBackDiffPrice purchaseBackDiffPrice, RedirectAttributes redirectAttributes) {
		purchaseBackDiffPriceService.delete(purchaseBackDiffPrice);
		addMessage(redirectAttributes, "删除采购补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseBackDiffPrice/?repage";
	}

}