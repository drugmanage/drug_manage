package com.thinkgem.fast.modules.purchase.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.modules.purchase.entity.PurchaseGoods;
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

    @Autowired
    private PurchaseGoodsService purchaseGoodsService;

    @ModelAttribute
    public PurchaseOrder get(@RequestParam(required = false) String id) {
        PurchaseOrder entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = purchaseOrderService.get(id);
            // 供应商列表
            entity.setSuppliers(supplierService.findList(new Supplier()));
            // 订单编号
        }
        if (entity == null) {
            entity = new PurchaseOrder();
            // 供应商列表
            entity.setSuppliers(supplierService.findList(new Supplier()));
            // 订单编号
            entity.setPurchaseNumber(this.getNewPurchaseNumber());
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
                            StringUtils.isBlank(purchaseGoodsVo.getNumber())) {
                        it.remove();
                    }
                }
            }
        }
    }

    private String getNewPurchaseNumber(){
        String purchaseNumber = "";

        // 获取一天的最早时间
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        today.set(Calendar.MINUTE, 0);
        today.set(Calendar.SECOND, 0);
        today.set(Calendar.MILLISECOND, 0);

        PurchaseOrder purchaseOrder = new PurchaseOrder();
        purchaseOrder.setCreateDate(today.getTime());
        List<PurchaseOrder> list =  purchaseOrderService.findTodayList(purchaseOrder);
        if (list.isEmpty()) {
            String year = today.get(Calendar.YEAR) + "";
            String month = today.get(Calendar.MONTH) + 1 + "";
            String day = today.get(Calendar.DAY_OF_MONTH) + "";
            purchaseNumber = year+month+day + "00001";
        }else {
            PurchaseOrder purchaseOrderFromDB = list.get(0);
            String oldPurchaseNumber = purchaseOrderFromDB.getPurchaseNumber();
            String newNum = String.format("%05d",Integer.parseInt(oldPurchaseNumber.substring(7)) + 1);
            purchaseNumber = oldPurchaseNumber.substring(0,8) + newNum;
        }

        return purchaseNumber;
    }
}