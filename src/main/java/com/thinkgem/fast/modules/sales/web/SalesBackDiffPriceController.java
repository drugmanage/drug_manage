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
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPrice;
import com.thinkgem.fast.modules.sales.entity.SalesBackDiffPriceVo;
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;
import com.thinkgem.fast.modules.sales.service.SalesBackDiffPriceService;
import com.thinkgem.fast.modules.sales.service.SalesOrderService;

/**
 * 销售退补差价单Controller
 * @author shiao
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesBackDiffPrice")
public class SalesBackDiffPriceController extends BaseController {

	@Autowired
	private SalesBackDiffPriceService salesBackDiffPriceService;
	
	@Autowired
	private SalesOrderService salesOrderService;
	
	private static String orderNumberMain = "000000";
	
	@ModelAttribute
	public SalesBackDiffPrice get(@RequestParam(required=false) String id) {
		SalesBackDiffPrice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesBackDiffPriceService.get(id);
		}
		if (entity == null){
			entity = new SalesBackDiffPrice();
		}
		entity.setSalesOrderList(salesOrderService.findList(new SalesOrder()));
		return entity;
	}
	
	@RequiresPermissions("sales:salesBackDiffPrice:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesBackDiffPrice salesBackDiffPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesBackDiffPrice> page = salesBackDiffPriceService.findPage(new Page<SalesBackDiffPrice>(request, response), salesBackDiffPrice); 
		model.addAttribute("page", page);
		return "modules/sales/salesBackDiffPriceList";
	}

	@RequiresPermissions("sales:salesBackDiffPrice:view")
	@RequestMapping(value = "form")
	public String form(SalesBackDiffPrice salesBackDiffPrice, Model model) {
		if (StringUtils.isBlank(salesBackDiffPrice.getId())) {
            // 退回单编号
			salesBackDiffPrice.setBackDiffPriceNumber(this.getOrderNumber());
        }
		model.addAttribute("salesBackDiffPrice", salesBackDiffPrice);
		return "modules/sales/salesBackDiffPriceForm";
	}

	@RequiresPermissions("sales:salesBackDiffPrice:edit")
	@RequestMapping(value = "save")
	public String save(SalesBackDiffPrice salesBackDiffPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesBackDiffPrice)){
			return form(salesBackDiffPrice, model);
		}
		 // 过滤无效数据
        this.filterParam(salesBackDiffPrice);
        if (CollectionUtils.isEmpty(salesBackDiffPrice.getSalesBackDiffPriceVoList())) {
            return form(salesBackDiffPrice, model);
        }
		salesBackDiffPriceService.save(salesBackDiffPrice);
		addMessage(redirectAttributes, "保存销售退补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackDiffPrice/?repage";
	}
	
	@RequiresPermissions("sales:salesBackDiffPrice:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesBackDiffPrice salesBackDiffPrice, RedirectAttributes redirectAttributes) {
		salesBackDiffPriceService.delete(salesBackDiffPrice);
		addMessage(redirectAttributes, "删除销售退补差价单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesBackDiffPrice/?repage";
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
	
	         String preCode = "SXTB";
	         if ("000000".equals(orderNumberMain)) {
	             SalesBackDiffPrice salesBackDiffPrice = salesBackDiffPriceService.findFirstByOrderNumLikeOrderByOrderNumDesc();
	             if (salesBackDiffPrice != null) {
	                 orderNumberMain = salesBackDiffPrice.getBackDiffPriceNumber();
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
	  * @param salesBackDiffPrice
	  */
	 private void filterParam(SalesBackDiffPrice salesBackDiffPrice) {
	     List<SalesBackDiffPriceVo> salesBackDiffPriceVoList = salesBackDiffPrice.getSalesBackDiffPriceVoList();
	     if (CollectionUtils.isNotEmpty(salesBackDiffPriceVoList)) {
	         Iterator<SalesBackDiffPriceVo> it = salesBackDiffPriceVoList.iterator();
	         while (it.hasNext()) {
	             SalesBackDiffPriceVo salesBackDiffPriceVo = it.next();
	             if (salesBackDiffPriceVo == null) {
	                 it.remove();
	             } else {
	                 if (StringUtils.isBlank(salesBackDiffPriceVo.getSalesGoodsId()) || salesBackDiffPriceVo.getBackPriceUnit()==null || salesBackDiffPriceVo.getBackPriceUnit()<=0) {
	                     it.remove();
	                 }
	             }
	         }
	     }
	 }
}