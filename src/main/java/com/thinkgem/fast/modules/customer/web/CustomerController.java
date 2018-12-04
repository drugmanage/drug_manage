package com.thinkgem.fast.modules.customer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.fast.common.utils.DateUtils;
import com.thinkgem.fast.modules.customer.entity.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.fast.common.config.Global;
import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.web.BaseController;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.customer.service.CustomerService;

import java.util.Iterator;
import java.util.List;

/**
 * 客户资料Controller
 * @author 任硕
 * @version 2018-11-17
 */
@Controller
@RequestMapping(value = "${adminPath}/customer/customer")
public class CustomerController extends BaseController {

	@Autowired
	private CustomerService customerService;
	
	@ModelAttribute
	public Customer get(@RequestParam(required=false) String id) {
		Customer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = customerService.get(id);
		}
		if (entity == null){
			entity = new Customer();
		}
		return entity;
	}
	
	@RequiresPermissions("customer:customer:view")
	@RequestMapping(value = {"list", ""})
	public String list(Customer customer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Customer> page = customerService.findPage(new Page<Customer>(request, response), customer); 
		model.addAttribute("page", page);
		return "modules/customer/customerList";
	}

	@RequiresPermissions("customer:customer:view")
	@RequestMapping(value = "form")
	public String form(Customer customer, Model model) {
		if (StringUtils.isBlank(customer.getId())) {
			String yy = DateUtils.getLastYearYY();
			int total = customerService.findCount();
			int sup = total + 1;
			String ss = StringUtils.frontCompWithZore(sup, 4);
			String supNumber = yy + ss;
			customer.setCustomerNumber(supNumber);
		}
		model.addAttribute("customer", customer);
		return "modules/customer/customerForm";
	}

	@RequiresPermissions("customer:customer:edit")
	@RequestMapping(value = "save")
	public String save(Customer customer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, customer)){
			return form(customer, model);
		}
		this.filterParam(customer);
		customerService.save(customer);
		addMessage(redirectAttributes, "保存客户资料成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customer/?repage";
	}

	/**
	 * 过滤customer中的参数
	 *
	 * @param customer
	 */
	private void filterParam(Customer customer){
		 List<CustomerAddress> addressList = customer.getCustomerAddressList();
		 if(CollectionUtils.isNotEmpty(addressList)){
			 Iterator<CustomerAddress> it = addressList.iterator();
			 while (it.hasNext()){
			 	CustomerAddress customerAddress = it.next();
			 	if (customerAddress == null) {
			 		it.remove();
				} else {
			 		if (customerAddress.getArea() == null ||
					StringUtils.isBlank(customerAddress.getArea().getId())||
					StringUtils.isBlank(customerAddress.getContactPhone())||
					StringUtils.isBlank(customerAddress.getReceivingAddress())||
					StringUtils.isBlank(customerAddress.getReceivingName())){
			 			it.remove();
					}
				}
			 }
		 } else {
		 	if (CollectionUtils.isNotEmpty(addressList)){
		 		addressList.clear();
			}
		 }

		 List<CustomerBank> bankList = customer.getCustomerBankList();
		 if(CollectionUtils.isNotEmpty(bankList)){
		 	Iterator<CustomerBank> it = bankList.iterator();
		 	while (it.hasNext()){
		 		CustomerBank customerBank = it.next();
				if (customerBank == null) {
					it.remove();
				} else {
					if (StringUtils.isBlank(customerBank.getBank())||
					StringUtils.isBlank(customerBank.getBankNumber())||
					StringUtils.isBlank(customerBank.getOpenAccountName())) {
						it.remove();
					}
				}
			}
		 }
		 List<CustomerInvoiceInfo> invoiceInfoList = customer.getCustomerInvoiceInfoList();
		if(CollectionUtils.isNotEmpty(invoiceInfoList)){
			Iterator<CustomerInvoiceInfo> it = invoiceInfoList.iterator();
			while (it.hasNext()){
				CustomerInvoiceInfo customerInvoiceInfo = it.next();
				if (customerInvoiceInfo == null) {
					it.remove();
				} else {
					if (StringUtils.isBlank(customerInvoiceInfo.getAccountName()) ||
							StringUtils.isBlank(customerInvoiceInfo.getBankDeposit())||
							customerInvoiceInfo.getArea() == null ||
							StringUtils.isBlank(customerInvoiceInfo.getArea().getId())||
							StringUtils.isBlank(customerInvoiceInfo.getDetailAddress())||
							StringUtils.isBlank(customerInvoiceInfo.getPhone())||
							StringUtils.isBlank(customerInvoiceInfo.getAccountNumber())||
							StringUtils.isBlank(customerInvoiceInfo.getDutyParagraph())||
							StringUtils.isBlank(customerInvoiceInfo.getInvoicePath())||
							StringUtils.isBlank(customerInvoiceInfo.getStopFlag())) {
						it.remove();
					}
				}
			}
		}

		List<CustomerDocumentTemplate> documentTemplateList = customer.getCustomerDocumentTemplateList();
		if(CollectionUtils.isNotEmpty(documentTemplateList)){
			Iterator<CustomerDocumentTemplate> it = documentTemplateList.iterator();
			while (it.hasNext()){
				CustomerDocumentTemplate customerDocumentTemplate = it.next();
				if (customerDocumentTemplate == null) {
					it.remove();
				} else {
					if (StringUtils.isBlank(customerDocumentTemplate.getName()) ||
							StringUtils.isBlank(customerDocumentTemplate.getCertCode())||
							StringUtils.isBlank(customerDocumentTemplate.getIssuingOrgan())||
                            customerDocumentTemplate.getDateIssue() == null||
                            customerDocumentTemplate.getValidityDate() == null||
							StringUtils.isBlank(customerDocumentTemplate.getImgPath())) {
						it.remove();
					}
				}
			}
		}

		List<CustomerConsigner> consignerList = customer.getCustomerConsignerList();
		if(CollectionUtils.isNotEmpty(consignerList)){
			Iterator<CustomerConsigner> it = consignerList.iterator();
			while (it.hasNext()){
                CustomerConsigner customerConsigner = it.next();
				if (customerConsigner == null) {
					it.remove();
				} else {
					if (StringUtils.isBlank(customerConsigner.getContactsName()) ||
							StringUtils.isBlank(customerConsigner.getSex())||
							StringUtils.isBlank(customerConsigner.getPhone())||
							StringUtils.isBlank(customerConsigner.getCertNumber())||
							StringUtils.isBlank(customerConsigner.getConsignerVali())||
							StringUtils.isBlank(customerConsigner.getProxyBook())||
							StringUtils.isBlank(customerConsigner.getProxyBookVali())||
							StringUtils.isBlank(customerConsigner.getProxyBookImgBook())||
							StringUtils.isBlank(customerConsigner.getIdCardImgBook())||
							StringUtils.isBlank(customerConsigner.getStopFlag())) {
						it.remove();
					}
				}
			}
		}
	}

	@RequiresPermissions("customer:customer:edit")
	@RequestMapping(value = "delete")
	public String delete(Customer customer, RedirectAttributes redirectAttributes) {
		customerService.delete(customer);
		addMessage(redirectAttributes, "删除客户资料成功");
		return "redirect:"+Global.getAdminPath()+"/customer/customer/?repage";
	}

}