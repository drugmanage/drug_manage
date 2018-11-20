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
import com.thinkgem.fast.modules.customer.entity.CustomerInvoiceInfo;
import com.thinkgem.fast.modules.customer.service.CustomerInvoiceInfoService;

/**
 * 开票信息Controller
 * @author 刘海涛
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerInvoiceInfo")
public class CustomerInvoiceInfoController extends BaseController {

	@Autowired
	private CustomerInvoiceInfoService customerInvoiceInfoService;
	
	@ModelAttribute
	public CustomerInvoiceInfo get(@RequestParam(required=false) String id) {
		CustomerInvoiceInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerInvoiceInfoService.get(id);
		}
		if (entity == null){
			entity = new CustomerInvoiceInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customerInvoiceInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(CustomerInvoiceInfo customerInvoiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerInvoiceInfo> page = customerInvoiceInfoService.findPage(new Page<CustomerInvoiceInfo>(request, response), customerInvoiceInfo); 
		model.addAttribute("page", page);
		return "modules/customer/customerInvoiceInfoList";
	}

	@RequiresPermissions("customer:customerInvoiceInfo:view")
	@RequestMapping(value = "form")
	public String form(CustomerInvoiceInfo customerInvoiceInfo, Model model) {
		model.addAttribute("customerInvoiceInfo", customerInvoiceInfo);
		return "modules/customer/customerInvoiceInfoForm";
	}

	@RequiresPermissions("customer:customerInvoiceInfo:edit")
	@RequestMapping(value = "save")
	public String save(CustomerInvoiceInfo customerInvoiceInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerInvoiceInfo)){
			return form(customerInvoiceInfo, model);
		}
		customerInvoiceInfoService.save(customerInvoiceInfo);
		addMessage(redirectAttributes, "保存开票信息成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerInvoiceInfo/?repage";
	}
	
	@RequiresPermissions("customer:customerInvoiceInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(CustomerInvoiceInfo customerInvoiceInfo, RedirectAttributes redirectAttributes) {
		customerInvoiceInfoService.delete(customerInvoiceInfo);
		addMessage(redirectAttributes, "删除开票信息成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerInvoiceInfo/?repage";
	}

}