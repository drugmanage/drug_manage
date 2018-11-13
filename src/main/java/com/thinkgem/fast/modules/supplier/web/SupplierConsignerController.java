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
import com.thinkgem.fast.modules.supplier.entity.SupplierConsigner;
import com.thinkgem.fast.modules.supplier.service.SupplierConsignerService;

import java.util.HashMap;
import java.util.Map;

/**
 * 供应商委托人Controller
 * @author 任硕
 * @version 2018-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/supplierConsigner")
public class SupplierConsignerController extends BaseController {

	@Autowired
	private SupplierConsignerService supplierConsignerService;
	
	@ModelAttribute
	public SupplierConsigner get(@RequestParam(required=false) String id) {
		SupplierConsigner entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supplierConsignerService.get(id);
		}
		if (entity == null){
			entity = new SupplierConsigner();
		}
		return entity;
	}
	
	@RequiresPermissions("supplier:supplierConsigner:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupplierConsigner supplierConsigner, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupplierConsigner> page = supplierConsignerService.findPage(new Page<SupplierConsigner>(request, response), supplierConsigner); 
		model.addAttribute("page", page);
		return "modules/supplier/supplierConsignerList";
	}

	@RequiresPermissions("supplier:supplierConsigner:view")
	@RequestMapping(value = "form")
	public String form(SupplierConsigner supplierConsigner, Model model) {
		model.addAttribute("supplierConsigner", supplierConsigner);
		return "modules/supplier/supplierConsignerForm";
	}

	@RequiresPermissions("supplier:supplierConsigner:edit")
	@RequestMapping(value = "save")
	public String save(SupplierConsigner supplierConsigner, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supplierConsigner)){
			return form(supplierConsigner, model);
		}
		supplierConsignerService.save(supplierConsigner);
		addMessage(redirectAttributes, "保存供应商委托人成功");
		return "redirect:"+Global.getAdminPath()+"/supplier/supplierConsigner/?repage";
	}

	@RequiresPermissions("supplier:supplier:edit")
	@ResponseBody
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(SupplierConsigner supplierConsigner) {
		supplierConsignerService.delete(supplierConsigner);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", 200);
		res.put("msg", "删除成功");
		return res;
	}

}