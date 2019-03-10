package com.thinkgem.fast.modules.repo.web;

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
import com.thinkgem.fast.modules.repo.entity.Receipt;
import com.thinkgem.fast.modules.repo.service.ReceiptService;

/**
 * 收货单Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/receipt")
public class ReceiptController extends BaseController {

	@Autowired
	private ReceiptService receiptService;
	
	@ModelAttribute
	public Receipt get(@RequestParam(required=false) String id) {
		Receipt entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = receiptService.get(id);
		}
		if (entity == null){
			entity = new Receipt();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:receipt:view")
	@RequestMapping(value = {"list", ""})
	public String list(Receipt receipt, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Receipt> page = receiptService.findPage(new Page<Receipt>(request, response), receipt); 
		model.addAttribute("page", page);
		return "modules/repo/receiptList";
	}

	@RequiresPermissions("repo:receipt:view")
	@RequestMapping(value = "form")
	public String form(Receipt receipt, Model model) {
		model.addAttribute("receipt", receipt);
		return "modules/repo/receiptForm";
	}

	@RequiresPermissions("repo:receipt:edit")
	@RequestMapping(value = "save")
	public String save(Receipt receipt, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, receipt)){
			return form(receipt, model);
		}
		receiptService.save(receipt);
		addMessage(redirectAttributes, "保存收货单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/receipt/?repage";
	}
	
	@RequiresPermissions("repo:receipt:edit")
	@RequestMapping(value = "delete")
	public String delete(Receipt receipt, RedirectAttributes redirectAttributes) {
		receiptService.delete(receipt);
		addMessage(redirectAttributes, "删除收货单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/receipt/?repage";
	}

}