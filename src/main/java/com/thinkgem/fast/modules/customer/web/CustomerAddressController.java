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
import com.thinkgem.fast.modules.customer.entity.CustomerAddress;
import com.thinkgem.fast.modules.customer.service.CustomerAddressService;

/**
 * 客户收货地址Controller
 * @author 刘海涛
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerAddress")
public class CustomerAddressController extends BaseController {

	@Autowired
	private CustomerAddressService customerAddressService;
	
	@ModelAttribute
	public CustomerAddress get(@RequestParam(required=false) String id) {
		CustomerAddress entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerAddressService.get(id);
		}
		if (entity == null){
			entity = new CustomerAddress();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customerAddress:view")
	@RequestMapping(value = {"list", ""})
	public String list(CustomerAddress customerAddress, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerAddress> page = customerAddressService.findPage(new Page<CustomerAddress>(request, response), customerAddress); 
		model.addAttribute("page", page);
		return "modules/customer/customerAddressList";
	}

	@RequiresPermissions("customer:customerAddress:view")
	@RequestMapping(value = "form")
	public String form(CustomerAddress customerAddress, Model model) {
		model.addAttribute("customerAddress", customerAddress);
		return "modules/customer/customerAddressForm";
	}

	@RequiresPermissions("customer:customerAddress:edit")
	@RequestMapping(value = "save")
	public String save(CustomerAddress customerAddress, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerAddress)){
			return form(customerAddress, model);
		}
		customerAddressService.save(customerAddress);
		addMessage(redirectAttributes, "保存客户收货地址成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerAddress/?repage";
	}
	
	@RequiresPermissions("customer:customerAddress:edit")
	@RequestMapping(value = "delete")
	public String delete(CustomerAddress customerAddress, RedirectAttributes redirectAttributes) {
		customerAddressService.delete(customerAddress);
		addMessage(redirectAttributes, "删除客户收货地址成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerAddress/?repage";
	}

}