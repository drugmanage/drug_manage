package com.thinkgem.fast.modules.sales.web;

import java.util.Calendar;
import java.util.Date;
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
import com.thinkgem.fast.modules.sales.entity.SalesGoodsVo;
import com.thinkgem.fast.modules.sales.entity.SalesOrder;
import com.thinkgem.fast.modules.sales.service.SalesOrderService;

/**
 * 销售开票单Controller
 * @author shiao
 * @version 2019-01-09
 */
@Controller
@RequestMapping(value = "${adminPath}/sales/salesOrder")
public class SalesOrderController extends BaseController {
	
	private static String orderNumberMain="000000";
	
	@Autowired
	private SalesOrderService salesOrderService;
	
	@ModelAttribute
	public SalesOrder get(@RequestParam(required=false) String id) {
		SalesOrder entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesOrderService.get(id);
		}
		if (entity == null){
			entity = new SalesOrder();
		}
		return entity;
	}
	
	@RequiresPermissions("sales:salesOrder:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesOrder salesOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesOrder> page = salesOrderService.findPage(new Page<SalesOrder>(request, response), salesOrder); 
		model.addAttribute("page", page);
		return "modules/sales/salesOrderList";
	}

	@RequiresPermissions("sales:salesOrder:view")
	@RequestMapping(value = "form")
	public String form(SalesOrder salesOrder, Model model) {
		if (StringUtils.isBlank(salesOrder.getId())) {
			// 订单编号
			salesOrder.setOrderNum(this.getOrderNumber());
			// 订单日期
			salesOrder.setOrderTime(new Date());
		}
		model.addAttribute("salesOrder", salesOrder);
		return "modules/sales/salesOrderForm";
	}

	@RequiresPermissions("sales:salesOrder:edit")
	@RequestMapping(value = "save")
	public String save(SalesOrder salesOrder, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesOrder)){
			return form(salesOrder, model);
		}
		// 判断销售商品列表不为空再保存
        this.filterParam(salesOrder);
		salesOrderService.save(salesOrder);
		addMessage(redirectAttributes, "保存销售开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesOrder/?repage";
	}
	
	@RequiresPermissions("sales:salesOrder:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesOrder salesOrder, RedirectAttributes redirectAttributes) {
		salesOrderService.delete(salesOrder);
		addMessage(redirectAttributes, "删除销售开票单成功");
		return "redirect:"+Global.getAdminPath()+"/sales/salesOrder/?repage";
	}
	
	/**
	 * 过滤销售订单中的数据
     *
     * @param purchaseOrder
     */
    private void filterParam(SalesOrder salesOrder) {
        List<SalesGoodsVo> salesGoodsVoList = salesOrder.getGoodsList();
        if (CollectionUtils.isNotEmpty(salesGoodsVoList)) {
            Iterator<SalesGoodsVo> it = salesGoodsVoList.iterator();
            while (it.hasNext()) {
                SalesGoodsVo salesGoodsVo = it.next();
                if (salesGoodsVo == null) {
                    it.remove();
                } else {
                    if (StringUtils.isBlank(salesGoodsVo.getGoodsId()) ||
                            StringUtils.isBlank(salesGoodsVo.getNumber())) {
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
    	synchronized(orderNumberMain){
    		String nowDate = DateUtils.getDate("yyMMdd");
    		String preCode = "SX";
	        if("000000".equals(orderNumberMain)){
	        	SalesOrder salesOrder = salesOrderService.findFirstByOrderNumLikeOrderByOrderNumDesc();
	        	if(salesOrder != null){
	        		orderNumberMain = salesOrder.getOrderNum();
	        	}
	        }
	        if(orderNumberMain != null && !"".equals(orderNumberMain)&&orderNumberMain.length()>6){
	        	Integer code = Integer.valueOf(orderNumberMain.substring(8))+1;
	        	String codeNum = String.format("%06d", code);
	        	Calendar calendar = Calendar.getInstance();
	        	int today = calendar.get(Calendar.DAY_OF_MONTH);
	        	if(today == 1){//每个月重新计算
        			orderNumberMain=preCode+nowDate+"000001";
	        	}else{
	        		orderNumberMain = preCode+nowDate+codeNum;
	        	}
	        }else{
	        	orderNumberMain=preCode+nowDate+"000001";
	        }
	    	String orderNumber = new String(orderNumberMain);
	    	return orderNumber;
    	}
    }
}