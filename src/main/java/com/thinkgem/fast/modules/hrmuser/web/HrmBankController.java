package com.thinkgem.fast.modules.hrmuser.web;

import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.modules.hrmuser.entity.HrmAddress;
import com.thinkgem.fast.modules.hrmuser.entity.HrmBank;
import com.thinkgem.fast.modules.hrmuser.service.HrmBankService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Lenovo on 2018/11/6.
 */
@Controller
@RequestMapping(value = "${adminPath}/hrmuser/hrmBank")
public class HrmBankController extends BaseController {

    @Autowired
    private HrmBankService hrmBankService;

    @ModelAttribute
    public HrmBank get(@RequestParam(required = false) String id) {
        HrmBank entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = hrmBankService.get(id);
        }
        if (entity == null) {
            entity = new HrmBank();
        }
        return entity;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "delete")
    public Map<String, Object> delete(HrmBank bank) {
        Map<String, Object> res= new HashMap<String, Object>();
        hrmBankService.delete(bank);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }
}
