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
import com.thinkgem.fast.modules.repo.entity.RepoTransfer;
import com.thinkgem.fast.modules.repo.service.RepoTransferService;

/**
 * 移库单Controller
 * @author shiao
 * @version 2019-03-10
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/repoTransfer")
public class RepoTransferController extends BaseController {

	@Autowired
	private RepoTransferService repoTransferService;
	
	@ModelAttribute
	public RepoTransfer get(@RequestParam(required=false) String id) {
		RepoTransfer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = repoTransferService.get(id);
		}
		if (entity == null){
			entity = new RepoTransfer();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:repoTransfer:view")
	@RequestMapping(value = {"list", ""})
	public String list(RepoTransfer repoTransfer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RepoTransfer> page = repoTransferService.findPage(new Page<RepoTransfer>(request, response), repoTransfer); 
		model.addAttribute("page", page);
		return "modules/repo/repoTransferList";
	}

	@RequiresPermissions("repo:repoTransfer:view")
	@RequestMapping(value = "form")
	public String form(RepoTransfer repoTransfer, Model model) {
		model.addAttribute("repoTransfer", repoTransfer);
		return "modules/repo/repoTransferForm";
	}

	@RequiresPermissions("repo:repoTransfer:edit")
	@RequestMapping(value = "save")
	public String save(RepoTransfer repoTransfer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, repoTransfer)){
			return form(repoTransfer, model);
		}
		repoTransferService.save(repoTransfer);
		addMessage(redirectAttributes, "保存移库单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/repoTransfer/?repage";
	}
	
	@RequiresPermissions("repo:repoTransfer:edit")
	@RequestMapping(value = "delete")
	public String delete(RepoTransfer repoTransfer, RedirectAttributes redirectAttributes) {
		repoTransferService.delete(repoTransfer);
		addMessage(redirectAttributes, "删除移库单成功");
		return "redirect:"+Global.getAdminPath()+"/repo/repoTransfer/?repage";
	}

}