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
import com.thinkgem.fast.modules.valuation.entity.GoodsValuation;
import com.thinkgem.fast.modules.valuation.service.GoodsValuationService;

/**
 * 商品定价Controller
 * @author renshuo
 * @version 2019-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/valuation/goodsValuation")
public class GoodsValuationController extends BaseController {

	@Autowired
	private GoodsValuationService goodsValuationService;
	
	@ModelAttribute
	public GoodsValuation get(@RequestParam(required=false) String id) {
		GoodsValuation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsValuationService.get(id);
		}
		if (entity == null){
			entity = new GoodsValuation();
		}
		return entity;
	}
	
	@RequiresPermissions("valuation:goodsValuation:view")
	@RequestMapping(value = {"list", ""})
	public String list(GoodsValuation goodsValuation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GoodsValuation> page = goodsValuationService.findPage(new Page<GoodsValuation>(request, response), goodsValuation); 
		model.addAttribute("page", page);
		return "modules/valuation/goodsValuationList";
	}

	@RequiresPermissions("valuation:goodsValuation:view")
	@RequestMapping(value = "form")
	public String form(GoodsValuation goodsValuation, Model model) {
		model.addAttribute("goodsValuation", goodsValuation);
		return "modules/valuation/goodsValuationForm";
	}

	@RequiresPermissions("valuation:goodsValuation:edit")
	@RequestMapping(value = "save")
	public String save(GoodsValuation goodsValuation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goodsValuation)){
			return form(goodsValuation, model);
		}
		goodsValuationService.save(goodsValuation);
		addMessage(redirectAttributes, "保存商品定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/goodsValuation/?repage";
	}
	
	@RequiresPermissions("valuation:goodsValuation:edit")
	@RequestMapping(value = "delete")
	public String delete(GoodsValuation goodsValuation, RedirectAttributes redirectAttributes) {
		goodsValuationService.delete(goodsValuation);
		addMessage(redirectAttributes, "删除商品定价成功");
		return "redirect:"+Global.getAdminPath()+"/valuation/goodsValuation/?repage";
	}

}