package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.service.GoodsService;
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
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
import com.thinkgem.fast.modules.purchase.service.PurchaseGoodsService;

/**
 * 采购商品Controller
 *
 * @author 刘海涛
 * @version 2018-12-24
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchaseGoods")
public class PurchaseGoodsController extends BaseController {

    @Autowired
    private PurchaseGoodsService purchaseGoodsService;

    @Autowired
    private GoodsService goodsService;

    @ModelAttribute
    public PurchaseGoods get(@RequestParam(required = false) String id) {
        PurchaseGoods entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = purchaseGoodsService.get(id);
        }
        if (entity == null) {
            entity = new PurchaseGoods();
        }
        return entity;
    }

    @RequiresPermissions("purchase:purchaseGoods:view")
    @RequestMapping(value = {"list", ""})
    public String list(PurchaseGoods purchaseGoods, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PurchaseGoods> page = purchaseGoodsService.findPage(new Page<PurchaseGoods>(request, response), purchaseGoods);
        model.addAttribute("page", page);
        return "modules/purchase/purchaseGoodsList";
    }

    @RequiresPermissions("purchase:purchaseGoods:view")
    @RequestMapping(value = "form")
    public String form(PurchaseGoods purchaseGoods, Model model) {
        model.addAttribute("purchaseGoods", purchaseGoods);
        return "modules/purchase/purchaseGoodsForm";
    }

    @RequiresPermissions("purchase:purchaseGoods:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseGoods purchaseGoods, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, purchaseGoods)) {
            return form(purchaseGoods, model);
        }
        purchaseGoodsService.save(purchaseGoods);
        addMessage(redirectAttributes, "保存采购商品成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseGoods/?repage";
    }

    @RequiresPermissions("purchase:purchaseGoods:edit")
    @RequestMapping(value = "delete")
    public String delete(PurchaseGoods purchaseGoods, RedirectAttributes redirectAttributes) {
        purchaseGoodsService.delete(purchaseGoods);
        addMessage(redirectAttributes, "删除采购商品成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseGoods/?repage";
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
        return "modules/purchase/goodsList";
    }

}