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
import com.thinkgem.fast.modules.sales.entity.SalesOrder;
import com.thinkgem.fast.modules.sales.service.SalesOrderService;

/**
 * 销售开票单Controller
 * @author shiao
 * @version 2019-01-09
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesOrder")
public class SalesOrderController extends BaseController {

	@Autowired
	private SalesOrderService salesOrderService;
	
	@ModelAttribute
	public SalesOrder get(@RequestParam(required=false) String id) {
		SalesOrder entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesOrderService.get(id);
		}
		if (entity == null){
			entity = new SalesOrder();
		}
		return entity;
	}
	
	@RequiresPermissions("sales:salesOrder:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesOrder salesOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesOrder> page = salesOrderService.findPage(new Page<SalesOrder>(request, response), salesOrder); 
		model.addAttribute("page", page);
		return "modules/sales/salesOrderList";
	}

	@RequiresPermissions("sales:salesOrder:view")
	@RequestMapping(value = "form")
	public String form(SalesOrder salesOrder, Model model) {
		model.addAttribute("salesOrder", salesOrder);
		return "modules/sales/salesOrderForm";
	}

	@RequiresPermissions("sales:salesOrder:edit")
	@RequestMapping(value = "save")
	public String save(SalesOrder salesOrder, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesOrder)){
			return form(salesOrder, model);
		}
		salesOrderService.save(salesOrder);
		addMessage(redirectAttributes, "保存销售开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesOrder/?repage";
	}
	
	@RequiresPermissions("sales:salesOrder:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesOrder salesOrder, RedirectAttributes redirectAttributes) {
		salesOrderService.delete(salesOrder);
		addMessage(redirectAttributes, "删除销售开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesOrder/?repage";
	}

}