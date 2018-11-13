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
import com.thinkgem.fast.modules.supplier.entity.SupplierDocumentTemplate;
import com.thinkgem.fast.modules.supplier.service.SupplierDocumentTemplateService;

import java.util.HashMap;
import java.util.Map;

/**
 * 供应商证件模板Controller
 * @author 任硕
 * @version 2018-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/supplierDocumentTemplate")
public class SupplierDocumentTemplateController extends BaseController {

	@Autowired
	private SupplierDocumentTemplateService supplierDocumentTemplateService;
	
	@ModelAttribute
	public SupplierDocumentTemplate get(@RequestParam(required=false) String id) {
		SupplierDocumentTemplate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supplierDocumentTemplateService.get(id);
		}
		if (entity == null){
			entity = new SupplierDocumentTemplate();
		}
		return entity;
	}
	
	@RequiresPermissions("supplier:supplierDocumentTemplate:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupplierDocumentTemplate supplierDocumentTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupplierDocumentTemplate> page = supplierDocumentTemplateService.findPage(new Page<SupplierDocumentTemplate>(request, response), supplierDocumentTemplate); 
		model.addAttribute("page", page);
		return "modules/supplier/supplierDocumentTemplateList";
	}

	@RequiresPermissions("supplier:supplierDocumentTemplate:view")
	@RequestMapping(value = "form")
	public String form(SupplierDocumentTemplate supplierDocumentTemplate, Model model) {
		model.addAttribute("supplierDocumentTemplate", supplierDocumentTemplate);
		return "modules/supplier/supplierDocumentTemplateForm";
	}

	@RequiresPermissions("supplier:supplierDocumentTemplate:edit")
	@RequestMapping(value = "save")
	public String save(SupplierDocumentTemplate supplierDocumentTemplate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supplierDocumentTemplate)){
			return form(supplierDocumentTemplate, model);
		}
		supplierDocumentTemplateService.save(supplierDocumentTemplate);
		addMessage(redirectAttributes, "保存供应商证件模板成功");
		return "redirect:"+Global.getAdminPath()+"/supplier/supplierDocumentTemplate/?repage";
	}

	@RequiresPermissions("supplier:supplier:edit")
	@ResponseBody
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(SupplierDocumentTemplate supplierDocumentTemplate, RedirectAttributes redirectAttributes) {
		supplierDocumentTemplateService.delete(supplierDocumentTemplate);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", 200);
		res.put("msg", "删除成功");
		return res;
	}

}