package com.thinkgem.fast.modules.hrmuser.service;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.common.utils.Collections3;
import com.thinkgem.fast.modules.goods.dao.GoodsDao;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.hrmuser.dao.ManageSalesmanDao;
import com.thinkgem.fast.modules.hrmuser.entity.ManageSalesman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 区域经理绑定业务员Service
 *
 * @author 任硕
 * @version 2018-11-19
 */
@Service
@Transactional(readOnly = true)
public class ManageSalesmanService extends CrudService<ManageSalesmanDao, ManageSalesman> {

    @Autowired
    private ManageSalesmanDao manageSalesmanDao;

    public ManageSalesman get(String id) {
        return super.get(id);
    }

    public List<ManageSalesman> findList(ManageSalesman manageSalesman) {
        return super.findList(manageSalesman);
    }

    public Page<ManageSalesman> findPage(Page<ManageSalesman> page, ManageSalesman manageSalesman) {
        return super.findPage(page, manageSalesman);
    }

    @Transactional(readOnly = false)
    public void save(ManageSalesman manageSalesman) {
        super.save(manageSalesman);
    }

    @Transactional(readOnly = false)
    public void delete(ManageSalesman manageSalesman) {
        super.delete(manageSalesman);
    }

    @Transactional(readOnly = false)
    public void assignSaleman(String manageId, String[] idsArr) {
        ManageSalesman param = new ManageSalesman();
        param.setManageUserId(manageId);
        List<ManageSalesman> msList = findList(param);
        List<String> salesmanUserId = Collections3.extractToList(msList, "salesmanUserId");

        for (int i = 0; i < idsArr.length; i++) {
            if (salesmanUserId.contains(idsArr[i])) {
                continue;
            }
            param.setSalesmanUserId(idsArr[i]);
            delete(param);
            ManageSalesman sm = new ManageSalesman();
            sm.setManageUserId(manageId);
            sm.setSalesmanUserId(idsArr[0]);
            this.save(sm);
        }
    }


}