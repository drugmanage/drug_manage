package com.thinkgem.fast.modules.customer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.modules.customer.entity.CustomerAddress;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.customer.entity.CustomerInvoiceInfo;
import com.thinkgem.fast.modules.customer.service.CustomerInvoiceInfoService;

import java.util.HashMap;
import java.util.Map;

/**
 * 开票信息Controller
 *
 * @author 刘海涛
 * @version 2018-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customerInvoiceInfo")
public class CustomerInvoiceInfoController extends BaseController {

    @Autowired
    private CustomerInvoiceInfoService customerInvoiceInfoService;

    @ModelAttribute
    public CustomerInvoiceInfo get(@RequestParam(required = false) String id) {
        CustomerInvoiceInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = customerInvoiceInfoService.get(id);
        }
        if (entity == null) {
            entity = new CustomerInvoiceInfo();
        }
        return entity;
    }

    @RequiresPermissions("customer:customerAddress:edit")
    @ResponseBody
    @RequestMapping(value = "delete")
    public Map<String, Object> delete(CustomerInvoiceInfo customerInvoiceInfo) {
        Map<String, Object> res = new HashMap<String, Object>();
        customerInvoiceInfoService.delete(customerInvoiceInfo);
        res.put("code", 200);
        res.put("msg", "删除成功");
        return res;
    }

}