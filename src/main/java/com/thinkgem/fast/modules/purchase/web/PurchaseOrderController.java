package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.purchase.entity.PurchaseGoodsVo;
import com.thinkgem.fast.modules.purchase.service.PurchaseGoodsService;
import com.thinkgem.fast.modules.supplier.entity.Supplier;
import com.thinkgem.fast.modules.supplier.service.SupplierService;
import org.apache.commons.collections.CollectionUtils;
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

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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
    private SupplierService supplierService;

    private static String orderNumberMain = "000000";

    @ModelAttribute
    public PurchaseOrder get(@RequestParam(required = false) String id) {
        PurchaseOrder entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = purchaseOrderService.get(id);
            // 供应商列表
            entity.setSuppliers(supplierService.findList(new Supplier()));
        }
        if (entity == null) {
            entity = new PurchaseOrder();
            // 供应商列表
            entity.setSuppliers(supplierService.findList(new Supplier()));
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
        if (StringUtils.isBlank(purchaseOrder.getId())) {
            //订单编号
            purchaseOrder.setPurchaseNumber(this.getOrderNumber());
            //订单日期
            purchaseOrder.setOrderTime(new Date());
        }
        model.addAttribute("purchaseOrder", purchaseOrder);
        return "modules/purchase/purchaseOrderForm";
    }

    @RequiresPermissions("purchase:purchaseOrder:edit")
    @RequestMapping(value = "save")
    public String save(PurchaseOrder purchaseOrder, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, purchaseOrder)) {
            return form(purchaseOrder, model);
        }
        // 判断采购商品列表不为空再保存
        this.filterParam(purchaseOrder);
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

    /**
     * 过滤采购订单中的数据
     *
     * @param purchaseOrder
     */
    private void filterParam(PurchaseOrder purchaseOrder) {
        List<PurchaseGoodsVo> purchaseGoodsVoList = purchaseOrder.getGoodsList();
        if (CollectionUtils.isNotEmpty(purchaseGoodsVoList)) {
            Iterator<PurchaseGoodsVo> it = purchaseGoodsVoList.iterator();
            while (it.hasNext()) {
                PurchaseGoodsVo purchaseGoodsVo = it.next();
                if (purchaseGoodsVo == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(purchaseGoodsVo.getGoodsId()) ||
                            StringUtils.isBlank(purchaseGoodsVo.getNumber()) ||
                            StringUtils.isBlank(purchaseGoodsVo.getPurchasePrice())) {
                        it.remove();
                    }
                }
            }
        }
    }

    /**
     * 拼接订单编号
     *
     * @return
     */
    private String getOrderNumber() {
        synchronized (orderNumberMain) {
            String nowDate = DateUtils.getDate("yyMMdd");

            String preCode = "CG";
            if ("000000".equals(orderNumberMain)) {
                PurchaseOrder purchaseOrder = purchaseOrderService.findFirstByOrderNumLikeOrderByOrderNumDesc();
                if (purchaseOrder != null) {
                    orderNumberMain = purchaseOrder.getPurchaseNumber();
                }
            }
            if (orderNumberMain != null && !"".equals(orderNumberMain) && orderNumberMain.length() > 6) {
                Integer code = Integer.valueOf(orderNumberMain.substring(8)) + 1;
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
}