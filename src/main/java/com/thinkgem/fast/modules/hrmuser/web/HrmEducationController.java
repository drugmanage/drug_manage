package com.thinkgem.fast.modules.hrmuser.web;

import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.modules.hrmuser.entity.HrmAddress;
import com.thinkgem.fast.modules.hrmuser.entity.HrmEducation;
import com.thinkgem.fast.modules.hrmuser.service.HrmEducationService;
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
@RequestMapping(value = "${adminPath}/hrmuser/hrmEdu")
public class HrmEducationController extends BaseController {

    @Autowired
    private HrmEducationService hrmEducationService;

    @ModelAttribute
    public HrmEducation get(@RequestParam(required = false) String id) {
        HrmEducation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = hrmEducationService.get(id);
        }
        if (entity == null) {
            entity = new HrmEducation();
        }
        return entity;
    }

    @RequiresPermissions("hrmuser:hrmUser:edit")
    @ResponseBody
    @RequestMapping(value = "delete")
    public Map<String, Object> delete(HrmEducation edu) {
        Map<String, Object> res= new HashMap<String, Object>();

        hrmEducationService.delete(edu);
        res.put("code",200);
        res.put("msg","删除成功");
        return res;
    }
}
