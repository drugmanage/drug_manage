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
import com.thinkgem.fast.modules.repo.entity.Inventory;
import com.thinkgem.fast.modules.repo.service.InventoryService;

/**
 * 盘点表Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/inventory")
public class InventoryController extends BaseController {

	@Autowired
	private InventoryService inventoryService;
	
	@ModelAttribute
	public Inventory get(@RequestParam(required=false) String id) {
		Inventory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = inventoryService.get(id);
		}
		if (entity == null){
			entity = new Inventory();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:inventory:view")
	@RequestMapping(value = {"list", ""})
	public String list(Inventory inventory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Inventory> page = inventoryService.findPage(new Page<Inventory>(request, response), inventory); 
		model.addAttribute("page", page);
		return "modules/repo/inventoryList";
	}

	@RequiresPermissions("repo:inventory:view")
	@RequestMapping(value = "form")
	public String form(Inventory inventory, Model model) {
		model.addAttribute("inventory", inventory);
		return "modules/repo/inventoryForm";
	}

	@RequiresPermissions("repo:inventory:edit")
	@RequestMapping(value = "save")
	public String save(Inventory inventory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, inventory)){
			return form(inventory, model);
		}
		inventoryService.save(inventory);
		addMessage(redirectAttributes, "保存盘点表成功");
		return "redirect:"+Global.getAdminPath()+"/repo/inventory/?repage";
	}
	
	@RequiresPermissions("repo:inventory:edit")
	@RequestMapping(value = "delete")
	public String delete(Inventory inventory, RedirectAttributes redirectAttributes) {
		inventoryService.delete(inventory);
		addMessage(redirectAttributes, "删除盘点表成功");
		return "redirect:"+Global.getAdminPath()+"/repo/inventory/?repage";
	}

}