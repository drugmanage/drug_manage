package com.thinkgem.fast.modules.oa.service;

import com.google.common.collect.Maps;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.act.service.ActTaskService;
import com.thinkgem.fast.modules.act.utils.ActUtils;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUser;
import com.thinkgem.fast.modules.hrmuser.service.HrmUserService;
import com.thinkgem.fast.modules.oa.dao.HrmRegularApplyDao;
import com.thinkgem.fast.modules.oa.entity.HrmRegularApply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 转正申请Service
 *
 * @author 任硕
 * @version 2018-11-07
 */
@Service
@Transactional(readOnly = true)
public class HrmRegularApplyService extends CrudService<HrmRegularApplyDao, HrmRegularApply> {

    @Autowired
    private ActTaskService actTaskService;
    @Autowired
    private HrmUserService hrmUserService;

    public HrmRegularApply get(String id) {
        return super.get(id);
    }

    public List<HrmRegularApply> findList(HrmRegularApply hrmRegularApply) {
        return super.findList(hrmRegularApply);
    }

    public Page<HrmRegularApply> findPage(Page<HrmRegularApply> page, HrmRegularApply hrmRegularApply) {
        return super.findPage(page, hrmRegularApply);
    }

    @Override
    @Transactional
    public void save(HrmRegularApply hrmRegularApply) {
//		super.save(hrmRegularApply);
        // 申请发起
        if (StringUtils.isBlank(hrmRegularApply.getId())) {
            hrmRegularApply.preInsert();
            dao.insert(hrmRegularApply);

            // 启动流程
            actTaskService.startProcess(ActUtils.PD_HRM_REGULAR_APPLY[0], ActUtils.PD_HRM_REGULAR_APPLY[1], hrmRegularApply.getId(), hrmRegularApply.getContent());
        }
        // 重新编辑申请
        else {

            String taskDefKey = hrmRegularApply.getAct().getTaskDefKey();
            hrmRegularApply.preUpdate();
            dao.update(hrmRegularApply);

            hrmRegularApply.getAct().setComment(("1".equals(hrmRegularApply.getAct().getFlag()) ? "[重申] " : "[驳回] ") + hrmRegularApply.getAct().getComment());

            //TODO 根据审核节点结束后并且是通过yes 修改员工状态
            if ("apply_end".equals(taskDefKey) && "1".equals(hrmRegularApply.getAct().getFlag())) {
                HrmUser hrmUser = new HrmUser();
                hrmUser.setId(hrmRegularApply.getHrmUser().getId());
                //转正
                hrmUser.setUserStatus("2");
                hrmUserService.updateUserUpdate(hrmUser);
            }
            // 完成流程任务
            Map<String, Object> vars = Maps.newHashMap();
//			vars.put("flag", "yes".equals(hrmRegularApply.getAct().getFlag())? "1" : "0");
            //0驳回，1通过，2拨回到部长，3拨回到主管
            vars.put("flag", hrmRegularApply.getAct().getFlag());
            actTaskService.complete(hrmRegularApply.getAct().getTaskId(), hrmRegularApply.getAct().getProcInsId(), hrmRegularApply.getAct().getComment(), hrmRegularApply.getContent(), vars);

        }
    }

    @Transactional(readOnly = false)
    public void delete(HrmRegularApply hrmRegularApply) {
        super.delete(hrmRegularApply);
    }

}