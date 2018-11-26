package com.thinkgem.fast.modules.hrmuser.service;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.common.utils.Collections3;
import com.thinkgem.fast.modules.hrmuser.dao.HrmUserCustomerDao;
import com.thinkgem.fast.modules.hrmuser.dao.ManageSalesmanDao;
import com.thinkgem.fast.modules.hrmuser.entity.HrmUserCustomer;
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
public class HrmUserCustomerService extends CrudService<HrmUserCustomerDao, HrmUserCustomer> {

    @Autowired
    private HrmUserCustomerDao HrmUserCustomerDao;

    public HrmUserCustomer get(String id) {
        return super.get(id);
    }

    public List<HrmUserCustomer> findList(HrmUserCustomer hrmUserCustomer) {
        return super.findList(hrmUserCustomer);
    }

    public Page<HrmUserCustomer> findPage(Page<HrmUserCustomer> page, HrmUserCustomer hrmUserCustomer) {
        return super.findPage(page, hrmUserCustomer);
    }

    @Transactional(readOnly = false)
    public void save(HrmUserCustomer hrmUserCustomer) {
        super.save(hrmUserCustomer);
    }

    @Transactional(readOnly = false)
    public void delete(HrmUserCustomer hrmUserCustomer) {
        super.delete(hrmUserCustomer);
    }

    @Transactional(readOnly = false)
    public void assignCustomer(String manageId, String[] idsArr) {
        HrmUserCustomer param = new HrmUserCustomer();
        param.setHrmUserId(manageId);
        List<HrmUserCustomer> msList = findList(param);
        List<String> customerIdList = Collections3.extractToList(msList, "customerId");

        for (int i = 0; i < idsArr.length; i++) {
            if (customerIdList.contains(idsArr[i])) {
                continue;
            }

            HrmUserCustomer hc = new HrmUserCustomer();
            hc.setHrmUserId(manageId);
            hc.setCustomerId(idsArr[i]);
            this.save(hc);
        }
    }
}