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
import com.thinkgem.fast.modules.supplier.entity.SupplierInvoiceInfo;
import com.thinkgem.fast.modules.supplier.service.SupplierInvoiceInfoService;

import java.util.HashMap;
import java.util.Map;

/**
 * 供应商开票信息Controller
 * @author 任硕
 * @version 2018-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/supplierInvoiceInfo")
public class SupplierInvoiceInfoController extends BaseController {

	@Autowired
	private SupplierInvoiceInfoService supplierInvoiceInfoService;
	
	@ModelAttribute
	public SupplierInvoiceInfo get(@RequestParam(required=false) String id) {
		SupplierInvoiceInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supplierInvoiceInfoService.get(id);
		}
		if (entity == null){
			entity = new SupplierInvoiceInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("supplier:supplierInvoiceInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupplierInvoiceInfo supplierInvoiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupplierInvoiceInfo> page = supplierInvoiceInfoService.findPage(new Page<SupplierInvoiceInfo>(request, response), supplierInvoiceInfo); 
		model.addAttribute("page", page);
		return "modules/supplier/supplierInvoiceInfoList";
	}

	@RequiresPermissions("supplier:supplierInvoiceInfo:view")
	@RequestMapping(value = "form")
	public String form(SupplierInvoiceInfo supplierInvoiceInfo, Model model) {
		model.addAttribute("supplierInvoiceInfo", supplierInvoiceInfo);
		return "modules/supplier/supplierInvoiceInfoForm";
	}

	@RequiresPermissions("supplier:supplierInvoiceInfo:edit")
	@RequestMapping(value = "save")
	public String save(SupplierInvoiceInfo supplierInvoiceInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supplierInvoiceInfo)){
			return form(supplierInvoiceInfo, model);
		}
		supplierInvoiceInfoService.save(supplierInvoiceInfo);
		addMessage(redirectAttributes, "保存供应商开票信息成功");
		return "redirect:"+Global.getAdminPath()+"/supplier/supplierInvoiceInfo/?repage";
	}

	@RequiresPermissions("supplier:supplier:edit")
	@ResponseBody
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(SupplierInvoiceInfo supplierInvoiceInfo, RedirectAttributes redirectAttributes) {
		supplierInvoiceInfoService.delete(supplierInvoiceInfo);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", 200);
		res.put("msg", "删除成功");
		return res;
	}

}