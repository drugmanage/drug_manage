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
import com.thinkgem.fast.modules.repo.entity.Stock;
import com.thinkgem.fast.modules.repo.service.StockService;

/**
 * 库存查询Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/stock")
public class StockController extends BaseController {

	@Autowired
	private StockService stockService;
	
	@ModelAttribute
	public Stock get(@RequestParam(required=false) String id) {
		Stock entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = stockService.get(id);
		}
		if (entity == null){
			entity = new Stock();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:stock:view")
	@RequestMapping(value = {"list", ""})
	public String list(Stock stock, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Stock> page = stockService.findPage(new Page<Stock>(request, response), stock); 
		model.addAttribute("page", page);
		return "modules/repo/stockList";
	}

	@RequiresPermissions("repo:stock:view")
	@RequestMapping(value = "form")
	public String form(Stock stock, Model model) {
		model.addAttribute("stock", stock);
		return "modules/repo/stockForm";
	}

	@RequiresPermissions("repo:stock:edit")
	@RequestMapping(value = "save")
	public String save(Stock stock, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, stock)){
			return form(stock, model);
		}
		stockService.save(stock);
		addMessage(redirectAttributes, "保存库存查询成功");
		return "redirect:"+Global.getAdminPath()+"/repo/stock/?repage";
	}
	
	@RequiresPermissions("repo:stock:edit")
	@RequestMapping(value = "delete")
	public String delete(Stock stock, RedirectAttributes redirectAttributes) {
		stockService.delete(stock);
		addMessage(redirectAttributes, "删除库存查询成功");
		return "redirect:"+Global.getAdminPath()+"/repo/stock/?repage";
	}

}