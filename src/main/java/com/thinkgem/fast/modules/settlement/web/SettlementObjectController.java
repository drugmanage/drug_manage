package com.thinkgem.fast.modules.settlement.web;

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
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;
import com.thinkgem.fast.modules.settlement.service.SettlementObjectService;

/**
 * 结算对象信息Controller
 * @author 任硕
 * @version 2018-11-18
 */
@Controller
@RequestMapping(value = "${adminPath}/settlement/settlementObject")
public class SettlementObjectController extends BaseController {

	@Autowired
	private SettlementObjectService settlementObjectService;
	
	@ModelAttribute
	public SettlementObject get(@RequestParam(required=false) String id) {
		SettlementObject entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = settlementObjectService.get(id);
		}
		if (entity == null){
			entity = new SettlementObject();
		}
		return entity;
	}
	
	@RequiresPermissions("settlement:settlementObject:view")
	@RequestMapping(value = {"list", ""})
	public String list(SettlementObject settlementObject, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SettlementObject> page = settlementObjectService.findPage(new Page<SettlementObject>(request, response), settlementObject); 
		model.addAttribute("page", page);
		return "modules/settlement/settlementObjectList";
	}

	@RequiresPermissions("settlement:settlementObject:view")
	@RequestMapping(value = "form")
	public String form(SettlementObject settlementObject, Model model) {
		model.addAttribute("settlementObject", settlementObject);
		return "modules/settlement/settlementObjectForm";
	}

	@RequiresPermissions("settlement:settlementObject:edit")
	@RequestMapping(value = "save")
	public String save(SettlementObject settlementObject, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, settlementObject)){
			return form(settlementObject, model);
		}
		settlementObjectService.save(settlementObject);
		addMessage(redirectAttributes, "保存结算对象信息成功");
		return "redirect:"+Global.getAdminPath()+"/settlement/settlementObject/?repage";
	}
	
	@RequiresPermissions("settlement:settlementObject:edit")
	@RequestMapping(value = "delete")
	public String delete(SettlementObject settlementObject, RedirectAttributes redirectAttributes) {
		settlementObjectService.delete(settlementObject);
		addMessage(redirectAttributes, "删除结算对象信息成功");
		return "redirect:"+Global.getAdminPath()+"/settlement/settlementObject/?repage";
	}

}