package com.thinkgem.fast.modules.customer.web;

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
import com.thinkgem.fast.modules.customer.entity.CustomerConsigner;
import com.thinkgem.fast.modules.customer.service.CustomerConsignerService;

/**
 * 委托人Controller
 * @author 刘海涛
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerConsigner")
public class CustomerConsignerController extends BaseController {

	@Autowired
	private CustomerConsignerService customerConsignerService;
	
	@ModelAttribute
	public CustomerConsigner get(@RequestParam(required=false) String id) {
		CustomerConsigner entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerConsignerService.get(id);
		}
		if (entity == null){
			entity = new CustomerConsigner();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customerConsigner:view")
	@RequestMapping(value = {"list", ""})
	public String list(CustomerConsigner customerConsigner, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerConsigner> page = customerConsignerService.findPage(new Page<CustomerConsigner>(request, response), customerConsigner); 
		model.addAttribute("page", page);
		return "modules/customer/customerConsignerList";
	}

	@RequiresPermissions("customer:customerConsigner:view")
	@RequestMapping(value = "form")
	public String form(CustomerConsigner customerConsigner, Model model) {
		model.addAttribute("customerConsigner", customerConsigner);
		return "modules/customer/customerConsignerForm";
	}

	@RequiresPermissions("customer:customerConsigner:edit")
	@RequestMapping(value = "save")
	public String save(CustomerConsigner customerConsigner, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerConsigner)){
			return form(customerConsigner, model);
		}
		customerConsignerService.save(customerConsigner);
		addMessage(redirectAttributes, "保存委托人成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerConsigner/?repage";
	}
	
	@RequiresPermissions("customer:customerConsigner:edit")
	@RequestMapping(value = "delete")
	public String delete(CustomerConsigner customerConsigner, RedirectAttributes redirectAttributes) {
		customerConsignerService.delete(customerConsigner);
		addMessage(redirectAttributes, "删除委托人成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerConsigner/?repage";
	}

}