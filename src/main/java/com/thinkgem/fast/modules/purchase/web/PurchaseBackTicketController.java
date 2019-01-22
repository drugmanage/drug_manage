package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.purchase.entity.PurchaseBackTicketVo;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoodsVo;
import com.thinkgem.fast.modules.purchase.entity.PurchaseOrder;
import com.thinkgem.fast.modules.purchase.service.PurchaseOrderService;
import org.apache.commons.collections.CollectionUtils;
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

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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

    private static String orderNumberMain = "000000";

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
        if (StringUtils.isBlank(purchaseBackTicket.getId())) {
            // 退回单编号
            purchaseBackTicket.setBackTicketNumber(this.getOrderNumber());
        }
        model.addAttribute("purchaseBackTicket", purchaseBackTicket);
        return "modules/purchase/purchaseBackTicketForm";
    }

    @RequiresPermissions("purchase:purchaseBackTicket:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseBackTicket purchaseBackTicket, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, purchaseBackTicket)) {
            return form(purchaseBackTicket, model);
        }
        // 过滤无效数据
        this.filterParam(purchaseBackTicket);
        if (CollectionUtils.isEmpty(purchaseBackTicket.getPurchaseBackTicketVoList())) {
            return form(purchaseBackTicket, model);
        }
        // todo 剩余可退回商品检查
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
    @RequestMapping(value = "toPurchaseGoodsList")
    public String toPurchaseGoodsList(@RequestParam(value = "purchaseId") String purchaseId, Model model) {
        PurchaseOrder purchaseOrderForQuery = new PurchaseOrder();
        purchaseOrderForQuery.setId(purchaseId);
        PurchaseOrder purchaseOrder = purchaseOrderService.findList(purchaseOrderForQuery).get(0);
        List<PurchaseGoodsVo> goodsList = purchaseOrder.getGoodsList();
        model.addAttribute("goodsList", goodsList);
        return "modules/purchase/purchaseGoodsList";
    }

    /**
     * 拼接订单编号
     *
     * @return
     */
    private String getOrderNumber() {
        synchronized (orderNumberMain) {
            String nowDate = DateUtils.getDate("yyMMdd");

            String preCode = "CGTH";
            if ("000000".equals(orderNumberMain)) {
                PurchaseBackTicket purchaseBackTicket = purchaseBackTicketService.findFirstByOrderNumLikeOrderByOrderNumDesc();
                if (purchaseBackTicket != null) {
                    orderNumberMain = purchaseBackTicket.getBackTicketNumber();
                }
            }
            if (orderNumberMain != null && !"".equals(orderNumberMain) && orderNumberMain.length() > 6) {
                Integer code = Integer.valueOf(orderNumberMain.substring(10)) + 1;
                String codeNum = String.format("%06d", code);
                Calendar calendar = Calendar.getInstance();
                int today = calendar.get(Calendar.DAY_OF_MONTH);
                if (today == 1) {//每个月重新计算
                    orderNumberMain = preCode + nowDate + "000001";
                } else {
                    orderNumberMain = preCode + nowDate + codeNum;
                }
            } else {
                orderNumberMain = preCode + nowDate + "000001";
            }
            String orderNumber = new String(orderNumberMain);
            return orderNumber;
        }
    }

    /**
     * 过滤数据
     *
     * @param purchaseBackTicket
     */
    private void filterParam(PurchaseBackTicket purchaseBackTicket) {
        List<PurchaseBackTicketVo> purchaseBackTicketVoList = purchaseBackTicket.getPurchaseBackTicketVoList();
        if (CollectionUtils.isNotEmpty(purchaseBackTicketVoList)) {
            Iterator<PurchaseBackTicketVo> it = purchaseBackTicketVoList.iterator();
            while (it.hasNext()) {
                PurchaseBackTicketVo purchaseBackTicketVo = it.next();
                if (purchaseBackTicketVo == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(purchaseBackTicketVo.getPurchaseGoodsId()) ||
                            StringUtils.isBlank(purchaseBackTicketVo.getUnitBackNumber()) ||
                            StringUtils.isBlank(purchaseBackTicketVo.getReturnReason())) {
                        it.remove();
                    }
                }
            }
        }
    }

}