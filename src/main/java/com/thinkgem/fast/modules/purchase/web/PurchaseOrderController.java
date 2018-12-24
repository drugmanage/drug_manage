package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
import com.thinkgem.fast.modules.purchase.service.PurchaseGoodsService;
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
import com.thinkgem.fast.modules.purchase.entity.PurchaseOrder;
import com.thinkgem.fast.modules.purchase.service.PurchaseOrderService;

import java.util.Date;

/**
 * 采购订单Controller
 *
 * @author 刘海涛
 * @version 2018-12-18
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchaseOrder")
public class PurchaseOrderController extends BaseController {

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseGoodsService purchaseGoodsService;

    @ModelAttribute
    public PurchaseOrder get(@RequestParam(required = false) String id) {
        PurchaseOrder entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = purchaseOrderService.get(id);
        }
        if (entity == null) {
            entity = new PurchaseOrder();
            entity.setOrderTime(new Date());
        }
        return entity;
    }

    @RequiresPermissions("purchase:purchaseOrder:view")
    @RequestMapping(value = {"list", ""})
    public String list(PurchaseOrder purchaseOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PurchaseOrder> page = purchaseOrderService.findPage(new Page<PurchaseOrder>(request, response), purchaseOrder);
        model.addAttribute("page", page);
        return "modules/purchase/purchaseOrderList";
    }

    @RequiresPermissions("purchase:purchaseOrder:view")
    @RequestMapping(value = "form")
    public String form(PurchaseOrder purchaseOrder, Model model) {
        model.addAttribute("purchaseOrder", purchaseOrder);
        return "modules/purchase/purchaseOrderForm";
    }

    @RequiresPermissions("purchase:purchaseOrder:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseOrder purchaseOrder, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, purchaseOrder)) {
            return form(purchaseOrder, model);
        }
        purchaseOrderService.save(purchaseOrder);
        addMessage(redirectAttributes, "保存采购订单成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseOrder/?repage";
    }

    @RequiresPermissions("purchase:purchaseOrder:edit")
    @RequestMapping(value = "delete")
    public String delete(PurchaseOrder purchaseOrder, RedirectAttributes redirectAttributes) {
        purchaseOrderService.delete(purchaseOrder);
        addMessage(redirectAttributes, "删除采购订单成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseOrder/?repage";
    }

}