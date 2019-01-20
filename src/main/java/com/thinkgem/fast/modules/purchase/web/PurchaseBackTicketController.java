package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.modules.purchase.entity.PurchaseOrder;
import com.thinkgem.fast.modules.purchase.service.PurchaseOrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicket;
import com.thinkgem.fast.modules.purchase.service.PurchaseBackTicketService;

import java.util.Date;

/**
 * 采购退款开票单Controller
 *
 * @author 刘海涛
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchaseBackTicket")
public class PurchaseBackTicketController extends BaseController {

    @Autowired
    private PurchaseBackTicketService purchaseBackTicketService;

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @ModelAttribute
    public PurchaseBackTicket get(@RequestParam(required = false) String id) {
        PurchaseBackTicket entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = purchaseBackTicketService.get(id);
            // 采购订单列表
            entity.setPurchaseOrderList(purchaseOrderService.findList(new PurchaseOrder()));
        }
        if (entity == null) {
            entity = new PurchaseBackTicket();
            // 采购订单列表
            entity.setPurchaseOrderList(purchaseOrderService.findList(new PurchaseOrder()));
        }
        return entity;
    }

    @RequiresPermissions("purchase:purchaseBackTicket:view")
    @RequestMapping(value = {"list", ""})
    public String list(PurchaseBackTicket purchaseBackTicket, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PurchaseBackTicket> page = purchaseBackTicketService.findPage(new Page<PurchaseBackTicket>(request, response), purchaseBackTicket);
        model.addAttribute("page", page);
        return "modules/purchase/purchaseBackTicketList";
    }

    @RequiresPermissions("purchase:purchaseBackTicket:view")
    @RequestMapping(value = "form")
    public String form(PurchaseBackTicket purchaseBackTicket, Model model) {
        model.addAttribute("purchaseBackTicket", purchaseBackTicket);
        return "modules/purchase/purchaseBackTicketForm";
    }

    @RequiresPermissions("purchase:purchaseBackTicket:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseBackTicket purchaseBackTicket, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, purchaseBackTicket)) {
            return form(purchaseBackTicket, model);
        }
        purchaseBackTicketService.save(purchaseBackTicket);
        addMessage(redirectAttributes, "保存采购退款开票单成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseBackTicket/?repage";
    }

    @RequiresPermissions("purchase:purchaseBackTicket:edit")
    @RequestMapping(value = "delete")
    public String delete(PurchaseBackTicket purchaseBackTicket, RedirectAttributes redirectAttributes) {
        purchaseBackTicketService.delete(purchaseBackTicket);
        addMessage(redirectAttributes, "删除采购退款开票单成功");
        return "redirect:" + Global.getAdminPath() + "/purchase/purchaseBackTicket/?repage";
    }

    /**
     * 跳转到采购订单对应的采购商品列表
     *
     * @param purchaseId
     * @param model
     * @return
     */
    @RequiresPermissions("purchase:purchaseOrder:view")
    @RequestMapping(value="toPurchaseGoodsList")
    public String toPurchaseGoodsList(@RequestParam(value = "purchaseId") String purchaseId , Model model) {
        PurchaseOrder purchaseOrderForQuery = new PurchaseOrder();
        purchaseOrderForQuery.setId(purchaseId);
        PurchaseOrder purchaseOrder = purchaseOrderService.findList(purchaseOrderForQuery).get(0);
        model.addAttribute("purchaseOrder", purchaseOrder);
        return "modules/purchase/purchaseGoodsList";
    }
}