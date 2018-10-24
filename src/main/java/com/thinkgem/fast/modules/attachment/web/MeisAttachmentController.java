package com.thinkgem.fast.modules.attachment.web;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import com.thinkgem.fast.modules.attachment.service.MeisAttachmentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 附件管理Controller
 *
 * @author renshuo
 * @version 2018-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/attachment/meisAttachment")
public class MeisAttachmentController extends BaseController {

    @Autowired
    private MeisAttachmentService meisAttachmentService;

    @ModelAttribute
    public MeisAttachment get(@RequestParam(required = false) String id) {
        MeisAttachment entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = meisAttachmentService.get(id);
        }
        if (entity == null) {
            entity = new MeisAttachment();
        }
        return entity;
    }

    @RequiresPermissions("attachment:meisAttachment:view")
    @RequestMapping(value = {"list", ""})
    public String list(MeisAttachment meisAttachment, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<MeisAttachment> page = meisAttachmentService.findPage(new Page<MeisAttachment>(request, response), meisAttachment);
        model.addAttribute("page", page);
        return "modules/attachment/meisAttachmentList";
    }

    @RequiresPermissions("attachment:meisAttachment:view")
    @RequestMapping(value = "form")
    public String form(MeisAttachment meisAttachment, Model model) {
        model.addAttribute("meisAttachment", meisAttachment);
        return "modules/attachment/meisAttachmentForm";
    }

    @RequiresPermissions("attachment:meisAttachment:edit")
    @RequestMapping(value = "save")
    public String save(MeisAttachment meisAttachment, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, meisAttachment)) {
            return form(meisAttachment, model);
        }
        meisAttachmentService.save(meisAttachment);
        addMessage(redirectAttributes, "保存附件管理成功");
        return "redirect:" + Global.getAdminPath() + "/attachment/meisAttachment/?repage";
    }

    @RequiresPermissions("attachment:meisAttachment:edit")
    @RequestMapping(value = "delete")
    public String delete(MeisAttachment meisAttachment, RedirectAttributes redirectAttributes) {
        meisAttachmentService.delete(meisAttachment);
        addMessage(redirectAttributes, "删除附件管理成功");
        return "redirect:" + Global.getAdminPath() + "/attachment/meisAttachment/?repage";
    }

}