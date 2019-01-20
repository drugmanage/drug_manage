package com.thinkgem.fast.modules.sales.web;

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
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
import com.thinkgem.fast.modules.sales.entity.SalesGoods;
import com.thinkgem.fast.modules.sales.service.SalesGoodsService;

/**
 * 销售商品Controller
 * @author shiao
 * @version 2019-01-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesGoods")
public class SalesGoodsController extends BaseController {

	@Autowired
	private SalesGoodsService salesGoodsService;
	
	@Autowired
    private GoodsService goodsService;
	
	@ModelAttribute
	public SalesGoods get(@RequestParam(required=false) String id) {
		SalesGoods entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesGoodsService.get(id);
		}
		if (entity == null){
			entity = new SalesGoods();
		}
		return entity;
	}
	
	@RequiresPermissions("sales:salesGoods:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesGoods salesGoods, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesGoods> page = salesGoodsService.findPage(new Page<SalesGoods>(request, response), salesGoods); 
		model.addAttribute("page", page);
		return "modules/sales/salesGoodsList";
	}

	@RequiresPermissions("sales:salesGoods:view")
	@RequestMapping(value = "form")
	public String form(SalesGoods salesGoods, Model model) {
		model.addAttribute("salesGoods", salesGoods);
		return "modules/sales/salesGoodsForm";
	}

	@RequiresPermissions("sales:salesGoods:edit")
	@RequestMapping(value = "save")
	public String save(SalesGoods salesGoods, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesGoods)){
			return form(salesGoods, model);
		}
		salesGoodsService.save(salesGoods);
		addMessage(redirectAttributes, "保存销售商品成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesGoods/?repage";
	}
	
	@RequiresPermissions("sales:salesGoods:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesGoods salesGoods, RedirectAttributes redirectAttributes) {
		salesGoodsService.delete(salesGoods);
		addMessage(redirectAttributes, "删除销售商品成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesGoods/?repage";
	}
	
	/**
     * 新增订单商品时展示商品列表
     *
     * @param goods
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequiresPermissions("goods:goods:view")
    @RequestMapping(value = {"getGoodsList"})
    public String getGoodsList(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods);
        model.addAttribute("page", page);
        return "modules/sales/goodsList";
    }

}