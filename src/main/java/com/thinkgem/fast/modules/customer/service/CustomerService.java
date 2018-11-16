package com.thinkgem.fast.modules.customer.service;

import java.util.List;

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

    public Customer get(String id) {
        return super.get(id);
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
    }

    @Transactional(readOnly = false)
    public void delete(Customer customer) {
        super.delete(customer);
    }

    public int findCount() {
        return customerDao.findCount();
    }
}