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
import com.thinkgem.fast.modules.supplier.entity.SupplierBank;
import com.thinkgem.fast.modules.supplier.service.SupplierBankService;

import java.util.HashMap;
import java.util.Map;

/**
 * 供应商银行信息Controller
 * @author 任硕
 * @version 2018-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/supplier/supplierBank")
public class SupplierBankController extends BaseController {

	@Autowired
	private SupplierBankService supplierBankService;
	
	@ModelAttribute
	public SupplierBank get(@RequestParam(required=false) String id) {
		SupplierBank entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supplierBankService.get(id);
		}
		if (entity == null){
			entity = new SupplierBank();
		}
		return entity;
	}
	
	@RequiresPermissions("supplier:supplierBank:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupplierBank supplierBank, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupplierBank> page = supplierBankService.findPage(new Page<SupplierBank>(request, response), supplierBank); 
		model.addAttribute("page", page);
		return "modules/supplier/supplierBankList";
	}

	@RequiresPermissions("supplier:supplierBank:view")
	@RequestMapping(value = "form")
	public String form(SupplierBank supplierBank, Model model) {
		model.addAttribute("supplierBank", supplierBank);
		return "modules/supplier/supplierBankForm";
	}

	@RequiresPermissions("supplier:supplierBank:edit")
	@RequestMapping(value = "save")
	public String save(SupplierBank supplierBank, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supplierBank)){
			return form(supplierBank, model);
		}
		supplierBankService.save(supplierBank);
		addMessage(redirectAttributes, "保存供应商银行信息成功");
		return "redirect:"+Global.getAdminPath()+"/supplier/supplierBank/?repage";
	}

	@RequiresPermissions("supplier:supplier:edit")
	@ResponseBody
	@RequestMapping(value = "delete")
	public Map<String, Object> delete(SupplierBank supplierBank) {
		supplierBankService.delete(supplierBank);
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", 200);
		res.put("msg", "删除成功");
		return res;
	}

}