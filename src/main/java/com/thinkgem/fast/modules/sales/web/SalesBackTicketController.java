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
import com.thinkgem.fast.modules.sales.entity.SalesBackTicket;
import com.thinkgem.fast.modules.sales.service.SalesBackTicketService;

/**
 * 销售退回开票单Controller
 * @author shiao
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesBackTicket")
public class SalesBackTicketController extends BaseController {

	@Autowired
	private SalesBackTicketService salesBackTicketService;
	
	@ModelAttribute
	public SalesBackTicket get(@RequestParam(required=false) String id) {
		SalesBackTicket entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesBackTicketService.get(id);
		}
		if (entity == null){
			entity = new SalesBackTicket();
		}
		return entity;
	}
	
	@RequiresPermissions("sales:salesBackTicket:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesBackTicket salesBackTicket, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesBackTicket> page = salesBackTicketService.findPage(new Page<SalesBackTicket>(request, response), salesBackTicket); 
		model.addAttribute("page", page);
		return "modules/sales/salesBackTicketList";
	}

	@RequiresPermissions("sales:salesBackTicket:view")
	@RequestMapping(value = "form")
	public String form(SalesBackTicket salesBackTicket, Model model) {
		model.addAttribute("salesBackTicket", salesBackTicket);
		return "modules/sales/salesBackTicketForm";
	}

	@RequiresPermissions("sales:salesBackTicket:edit")
	@RequestMapping(value = "save")
	public String save(SalesBackTicket salesBackTicket, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesBackTicket)){
			return form(salesBackTicket, model);
		}
		salesBackTicketService.save(salesBackTicket);
		addMessage(redirectAttributes, "保存销售退回开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackTicket/?repage";
	}
	
	@RequiresPermissions("sales:salesBackTicket:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesBackTicket salesBackTicket, RedirectAttributes redirectAttributes) {
		salesBackTicketService.delete(salesBackTicket);
		addMessage(redirectAttributes, "删除销售退回开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackTicket/?repage";
	}

}