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
import com.thinkgem.fast.modules.repo.entity.Repo;
import com.thinkgem.fast.modules.repo.service.RepoService;

/**
 * 仓库Controller
 * @author shiao
 * @version 2019-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/repo/repo")
public class RepoController extends BaseController {

	@Autowired
	private RepoService repoService;
	
	@ModelAttribute
	public Repo get(@RequestParam(required=false) String id) {
		Repo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = repoService.get(id);
		}
		if (entity == null){
			entity = new Repo();
		}
		return entity;
	}
	
	@RequiresPermissions("repo:repo:view")
	@RequestMapping(value = {"list", ""})
	public String list(Repo repo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Repo> page = repoService.findPage(new Page<Repo>(request, response), repo); 
		model.addAttribute("page", page);
		return "modules/repo/repoList";
	}

	@RequiresPermissions("repo:repo:view")
	@RequestMapping(value = "form")
	public String form(Repo repo, Model model) {
		model.addAttribute("repo", repo);
		return "modules/repo/repoForm";
	}

	@RequiresPermissions("repo:repo:edit")
	@RequestMapping(value = "save")
	public String save(Repo repo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, repo)){
			return form(repo, model);
		}
		repoService.save(repo);
		addMessage(redirectAttributes, "保存仓库成功");
		return "redirect:"+Global.getAdminPath()+"/repo/repo/?repage";
	}
	
	@RequiresPermissions("repo:repo:edit")
	@RequestMapping(value = "delete")
	public String delete(Repo repo, RedirectAttributes redirectAttributes) {
		repoService.delete(repo);
		addMessage(redirectAttributes, "删除仓库成功");
		return "redirect:"+Global.getAdminPath()+"/repo/repo/?repage";
	}

}