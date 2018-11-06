package com.thinkgem.fast.modules.hrmuser.web;

import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.modules.hrmuser.entity.HrmFamilyContact;
import com.thinkgem.fast.modules.hrmuser.entity.HrmWorkExper;
import com.thinkgem.fast.modules.hrmuser.service.HrmWorkExperService;
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
@RequestMapping(value = "${adminPath}/hrmuser/hrmWork")
public class HrmWorkExperController extends BaseController {

    @Autowired
    private HrmWorkExperService hrmWorkExperService;

    @ModelAttribute
    public HrmWorkExper get(@RequestParam(required = false) String id) {
        HrmWorkExper entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = hrmWorkExperService.get(id);
        }
        if (entity == null) {
            entity = new HrmWorkExper();
        }
        return entity;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "delete")
    public Map<String, Object> delete(HrmWorkExper work) {
        Map<String, Object> res= new HashMap<String, Object>();

        hrmWorkExperService.delete(work);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }
}
