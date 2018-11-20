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
import com.thinkgem.fast.modules.customer.entity.CustomerBank;
import com.thinkgem.fast.modules.customer.service.CustomerBankService;

/**
 * 客户银行卡信息Controller
 * @author 刘海涛
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerBank")
public class CustomerBankController extends BaseController {

	@Autowired
	private CustomerBankService customerBankService;
	
	@ModelAttribute
	public CustomerBank get(@RequestParam(required=false) String id) {
		CustomerBank entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerBankService.get(id);
		}
		if (entity == null){
			entity = new CustomerBank();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customerBank:view")
	@RequestMapping(value = {"list", ""})
	public String list(CustomerBank customerBank, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CustomerBank> page = customerBankService.findPage(new Page<CustomerBank>(request, response), customerBank); 
		model.addAttribute("page", page);
		return "modules/customer/customerBankList";
	}

	@RequiresPermissions("customer:customerBank:view")
	@RequestMapping(value = "form")
	public String form(CustomerBank customerBank, Model model) {
		model.addAttribute("customerBank", customerBank);
		return "modules/customer/customerBankForm";
	}

	@RequiresPermissions("customer:customerBank:edit")
	@RequestMapping(value = "save")
	public String save(CustomerBank customerBank, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customerBank)){
			return form(customerBank, model);
		}
		customerBankService.save(customerBank);
		addMessage(redirectAttributes, "保存客户银行卡信息成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerBank/?repage";
	}
	
	@RequiresPermissions("customer:customerBank:edit")
	@RequestMapping(value = "delete")
	public String delete(CustomerBank customerBank, RedirectAttributes redirectAttributes) {
		customerBankService.delete(customerBank);
		addMessage(redirectAttributes, "删除客户银行卡信息成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customerBank/?repage";
	}

}