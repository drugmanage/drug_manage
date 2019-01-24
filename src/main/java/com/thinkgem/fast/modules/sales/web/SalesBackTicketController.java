package com.thinkgem.fast.modules.sales.web;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicket;
import com.thinkgem.fast.modules.sales.entity.SalesBackTicketVo;
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;
import com.thinkgem.fast.modules.sales.service.SalesBackTicketService;
import com.thinkgem.fast.modules.sales.service.SalesOrderService;

/**
 * 销售退回开票单Controller
 * @author shiao
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesBackTicket")
public class SalesBackTicketController extends BaseController {

	@Autowired
	private SalesBackTicketService salesBackTicketService;
	
	@Autowired
	private SalesOrderService salesOrderService;
	
	private static String orderNumberMain = "000000";
	
	@ModelAttribute
	public SalesBackTicket get(@RequestParam(required=false) String id) {
		SalesBackTicket entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesBackTicketService.get(id);
		}
		if (entity == null){
			entity = new SalesBackTicket();
		}
		entity.setSalesOrderList(salesOrderService.findList(new SalesOrder()));
		return entity;
	}
	
	@RequiresPermissions("sales:salesBackTicket:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesBackTicket salesBackTicket, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesBackTicket> page = salesBackTicketService.findPage(new Page<SalesBackTicket>(request, response), salesBackTicket); 
		model.addAttribute("page", page);
		return "modules/sales/salesBackTicketList";
	}

	@RequiresPermissions("sales:salesBackTicket:view")
	@RequestMapping(value = "form")
	public String form(SalesBackTicket salesBackTicket, Model model) {
		if (StringUtils.isBlank(salesBackTicket.getId())) {
            // 退回单编号
			salesBackTicket.setBackTicketNumber(this.getOrderNumber());
        }
		model.addAttribute("salesBackTicket", salesBackTicket);
		return "modules/sales/salesBackTicketForm";
	}

	@RequiresPermissions("sales:salesBackTicket:edit")
	@RequestMapping(value = "save")
	public String save(SalesBackTicket salesBackTicket, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesBackTicket)){
			return form(salesBackTicket, model);
		}
		 // 过滤无效数据
        this.filterParam(salesBackTicket);
        if (CollectionUtils.isEmpty(salesBackTicket.getSalesBackTicketVoList())) {
            return form(salesBackTicket, model);
        }
		salesBackTicketService.save(salesBackTicket);
		addMessage(redirectAttributes, "保存销售退回开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackTicket/?repage";
	}
	
	@RequiresPermissions("sales:salesBackTicket:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesBackTicket salesBackTicket, RedirectAttributes redirectAttributes) {
		salesBackTicketService.delete(salesBackTicket);
		addMessage(redirectAttributes, "删除销售退回开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackTicket/?repage";
	}
	
	
	   /**
     * 跳转到采购订单对应的采购商品列表
     *
     * @param salesId
     * @param model
     * @return
     */
    @RequiresPermissions("sales:salesOrder:view")
    @RequestMapping(value = "toSalesGoodsList")
    public String toSalesGoodsList(@RequestParam(value = "salesId") String salesId, Model model) {
        SalesOrder salesOrderForQuery = new SalesOrder();
        salesOrderForQuery.setId(salesId);
        SalesOrder salesOrder = salesOrderService.findList(salesOrderForQuery).get(0);
        List<SalesGoodsVo> goodsList = salesOrder.getGoodsList();
        model.addAttribute("goodsList", goodsList);
        return "modules/sales/salesGoodsList";
    }

    /**
     * 拼接订单编号
     *
     * @return
     */
    private String getOrderNumber() {
        synchronized (orderNumberMain) {
            String nowDate = DateUtils.getDate("yyMMdd");

            String preCode = "SXTH";
            if ("000000".equals(orderNumberMain)) {
                SalesBackTicket salesBackTicket = salesBackTicketService.findFirstByOrderNumLikeOrderByOrderNumDesc();
                if (salesBackTicket != null) {
                    orderNumberMain = salesBackTicket.getBackTicketNumber();
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
     * @param salesBackTicket
     */
    private void filterParam(SalesBackTicket salesBackTicket) {
        List<SalesBackTicketVo> salesBackTicketVoList = salesBackTicket.getSalesBackTicketVoList();
        if (CollectionUtils.isNotEmpty(salesBackTicketVoList)) {
            Iterator<SalesBackTicketVo> it = salesBackTicketVoList.iterator();
            while (it.hasNext()) {
                SalesBackTicketVo salesBackTicketVo = it.next();
                if (salesBackTicketVo == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(salesBackTicketVo.getSalesGoodsId()) ||
                            StringUtils.isBlank(salesBackTicketVo.getUnitBackNumber()) ||
                            StringUtils.isBlank(salesBackTicketVo.getReturnReason())) {
                        it.remove();
                    }
                }
            }
        }
    }
}