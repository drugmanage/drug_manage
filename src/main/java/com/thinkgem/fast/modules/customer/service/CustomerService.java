package com.thinkgem.fast.modules.customer.service;

import java.util.List;

import com.thinkgem.fast.modules.customer.dao.CustomerBankDao;
import com.thinkgem.fast.modules.customer.entity.CustomerAddress;
import com.thinkgem.fast.modules.customer.entity.CustomerBank;
import com.thinkgem.fast.modules.customer.entity.CustomerInvoiceInfo;
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;
import com.thinkgem.fast.modules.settlement.service.SettlementObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.customer.entity.Customer;
import com.thinkgem.fast.modules.customer.dao.CustomerDao;

/**
 * 客户资料Service
 *
 * @author 任硕
 * @version 2018-11-17
 */
@Service
@Transactional(readOnly = true)
public class CustomerService extends CrudService<CustomerDao, Customer> {

    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private SettlementObjectService settlementObjectService;
    @Autowired
    private CustomerAddressService customerAddressService;
    @Autowired
    private CustomerBankDao customerBankDao;

    public Customer get(String id) {
        Customer customer = super.get(id);
        String customerId = customer.getId();

        CustomerAddress customerAddress = new CustomerAddress();
        customerAddress.setCustomerId(customerId);
        List<CustomerAddress> customerAddressList = customerAddressService.findList(customerAddress);
        customer.setCustomerAddressList(customerAddressList);

        CustomerBank customerBank = new CustomerBank();
        customerBank.setCustomerId(customerId);
        List<CustomerBank> customerBankList = customerBankDao.findList(customerBank);
        customer.setCustomerBankList(customerBankList);

//        CustomerInvoiceInfo customerInvoiceInfo = new CustomerInvoiceInfo();
//        customerInvoiceInfo.set
        return customer;
    }

    public List<Customer> findList(Customer customer) {
        return super.findList(customer);
    }

    public Page<Customer> findPage(Page<Customer> page, Customer customer) {
        return super.findPage(page, customer);
    }

    @Transactional(readOnly = false)
    public void save(Customer customer) {
        super.save(customer);
        if ("1".equals(customer.getSettlementFlag())) {
            SettlementObject settlementObject = new SettlementObject();
            settlementObject.setOuterId(customer.getId());
            /**
             * 结算对象类型
             1-客户资料
             2-业务组
             3-供应商业务组
             4-区域经理
             5-业务员
             */
            settlementObject.setSettlementType("3");
            settlementObjectService.save(settlementObject);
        }
    }

    @Transactional(readOnly = false)
    public void delete(Customer customer) {
        super.delete(customer);
    }

    public int findCount() {
        return customerDao.findCount();
    }
}