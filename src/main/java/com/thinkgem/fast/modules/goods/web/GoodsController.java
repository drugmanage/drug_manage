package com.thinkgem.fast.modules.goods.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.fast.common.service.BaseService;
import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.sys.entity.Office;
import com.thinkgem.fast.modules.sys.entity.User;
import com.thinkgem.fast.modules.sys.utils.UserUtils;
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
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;

import java.util.List;
import java.util.Map;

/**
 * 商品资料Controller
 * @author 刘海涛
 * @version 2019-01-04
 */
@Controller
@RequestMapping(value = "${adminPath}/goods/goods")
public class GoodsController extends BaseController {

	@Autowired
	private GoodsService goodsService;
	
	@ModelAttribute
	public Goods get(@RequestParam(required=false) String id) {
		Goods entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsService.get(id);
		}
		if (entity == null){
			entity = new Goods();
		}
		return entity;
	}
	
	@RequiresPermissions("goods:goods:view")
	@RequestMapping(value = {"list", ""})
	public String list(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods); 
		model.addAttribute("page", page);
		return "modules/goods/goodsList";
	}

	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param type	类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade 显示级别
	 * @param response
	 * @return
	 */
	@RequiresPermissions("goods:goods:view")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(Goods goods,@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
											  @RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) {
		User user = UserUtils.getUser();
		List<Map<String, Object>> mapList = Lists.newArrayList();
		goods.getSqlMap().put("dsf", BaseService.dataScopeFilter(user, "o2", "u"));
		List<Goods> list = goodsService.findList(goods);
		for (int i=0; i<list.size(); i++){
			Goods e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getId());
			map.put("pIds", "");
			map.put("name", e.getGoodsName());
			mapList.add(map);
		}
		return mapList;
	}

	@RequiresPermissions("goods:goods:view")
	@RequestMapping(value = "form")
	public String form(Goods goods, Model model) {
		if (StringUtils.isBlank(goods.getId())) {
			String yy = DateUtils.getLastYearYY();
			int total = goodsService.findCount();
			int sup = total + 1;
			String ss = StringUtils.frontCompWithZore(sup, 4);
			String fileNumber = yy + ss;
			goods.setFileNumber(fileNumber);
		}

		model.addAttribute("goods", goods);
		return "modules/goods/goodsForm";
	}

	@RequiresPermissions("goods:goods:edit")
	@RequestMapping(value = "save")
	public String save(Goods goods, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goods)){
			return form(goods, model);
		}
		goodsService.saveAndImg(goods);
		addMessage(redirectAttributes, "保存商品资料成功");
		return "redirect:"+Global.getAdminPath()+"/goods/goods/?repage";
	}
	
	@RequiresPermissions("goods:goods:edit")
	@RequestMapping(value = "delete")
	public String delete(Goods goods, RedirectAttributes redirectAttributes) {
		goodsService.delete(goods);
		addMessage(redirectAttributes, "删除商品资料成功");
		return "redirect:"+Global.getAdminPath()+"/goods/goods/?repage";
	}

}