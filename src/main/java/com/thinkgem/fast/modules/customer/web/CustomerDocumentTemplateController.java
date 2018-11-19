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
import com.thinkgem.fast.modules.customer.entity.CustomerDocumentTemplate;
import com.thinkgem.fast.modules.customer.service.CustomerDocumentTemplateService;

/**
 * 证件模板Controller
 * @author 刘海涛
 * @version 2018-11-19
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerDocumentTemplate")
public class CustomerDocumentTemplateController extends BaseController {

	@Autowired
	private CustomerDocumentTemplateService customerDocumentTemplateService;
	
	@ModelAttribute
	public CustomerDocumentTemplate get(@RequestParam(required=false) String id) {
		CustomerDocumentTemplate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerDocumentTemplateService.get(id);
		}
		if (entity == null){
			entity = new CustomerDocumentTemplate();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customerDocumentTemplate:view")
	@RequestMapping(value = {"list", ""})
	public String list(CustomerDocumentTemplate customerDocumentTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerDocumentTemplate> page = customerDocumentTemplateService.findPage(new Page<CustomerDocumentTemplate>(request, response), customerDocumentTemplate); 
		model.addAttribute("page", page);
		return "modules/customer/customerDocumentTemplateList";
	}

	@RequiresPermissions("customer:customerDocumentTemplate:view")
	@RequestMapping(value = "form")
	public String form(CustomerDocumentTemplate customerDocumentTemplate, Model model) {
		model.addAttribute("customerDocumentTemplate", customerDocumentTemplate);
		return "modules/customer/customerDocumentTemplateForm";
	}

	@RequiresPermissions("customer:customerDocumentTemplate:edit")
	@RequestMapping(value = "save")
	public String save(CustomerDocumentTemplate customerDocumentTemplate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerDocumentTemplate)){
			return form(customerDocumentTemplate, model);
		}
		customerDocumentTemplateService.save(customerDocumentTemplate);
		addMessage(redirectAttributes, "保存证件模板成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerDocumentTemplate/?repage";
	}
	
	@RequiresPermissions("customer:customerDocumentTemplate:edit")
	@RequestMapping(value = "delete")
	public String delete(CustomerDocumentTemplate customerDocumentTemplate, RedirectAttributes redirectAttributes) {
		customerDocumentTemplateService.delete(customerDocumentTemplate);
		addMessage(redirectAttributes, "删除证件模板成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerDocumentTemplate/?repage";
	}

}