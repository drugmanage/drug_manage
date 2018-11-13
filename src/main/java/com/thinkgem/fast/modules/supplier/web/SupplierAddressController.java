package com.thinkgem.fast.modules.supplier.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.supplier.entity.SupplierAddress;
import com.thinkgem.fast.modules.supplier.service.SupplierAddressService;

import java.util.HashMap;
import java.util.Map;

/**
 * 供应商收货地址Controller
 * @author 任硕
 * @version 2018-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/supplierAddress")
public class SupplierAddressController extends BaseController {

	@Autowired
	private SupplierAddressService supplierAddressService;
	
	@ModelAttribute
	public SupplierAddress get(@RequestParam(required=false) String id) {
		SupplierAddress entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supplierAddressService.get(id);
		}
		if (entity == null){
			entity = new SupplierAddress();
		}
		return entity;
	}
	
	@RequiresPermissions("supplier:supplierAddress:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupplierAddress supplierAddress, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupplierAddress> page = supplierAddressService.findPage(new Page<SupplierAddress>(request, response), supplierAddress); 
		model.addAttribute("page", page);
		return "modules/supplier/supplierAddressList";
	}

	@RequiresPermissions("supplier:supplierAddress:view")
	@RequestMapping(value = "form")
	public String form(SupplierAddress supplierAddress, Model model) {
		model.addAttribute("supplierAddress", supplierAddress);
		return "modules/supplier/supplierAddressForm";
	}

	@RequiresPermissions("supplier:supplierAddress:edit")
	@RequestMapping(value = "save")
	public String save(SupplierAddress supplierAddress, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supplierAddress)){
			return form(supplierAddress, model);
		}
		supplierAddressService.save(supplierAddress);
		addMessage(redirectAttributes, "保存供应商收货地址成功");
		return "redirect:"+Global.getAdminPath()+"/supplier/supplierAddress/?repage";
	}

	@RequiresPermissions("supplier:supplier:edit")
	@ResponseBody
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(SupplierAddress supplierAddress) {
		supplierAddressService.delete(supplierAddress);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", 200);
		res.put("msg", "删除成功");
		return res;
	}

}