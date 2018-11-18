package com.thinkgem.fast.modules.supplier.service;

import java.util.List;

import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import com.thinkgem.fast.modules.attachment.service.MeisAttachmentService;
import com.thinkgem.fast.modules.hrmuser.entity.HrmAddress;
import com.thinkgem.fast.modules.settlement.entity.SettlementObject;
import com.thinkgem.fast.modules.settlement.service.SettlementObjectService;
import com.thinkgem.fast.modules.supplier.entity.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.supplier.dao.SupplierDao;

/**
 * 供应商信息Service
 * @author 任硕
 * @version 2018-11-10
 */
@Service
@Transactional(readOnly = true)
public class SupplierService extends CrudService<SupplierDao, Supplier> {

	@Autowired
	private SupplierDao supplierDao;

	@Autowired
	private SupplierAddressService supplierAddressService;
	@Autowired
	private SupplierBankService supplierBankService;
	@Autowired
	private SupplierConsignerService supplierConsignerService;
	@Autowired
	private SupplierDocumentTemplateService supplierDocumentTemplateService;
	@Autowired
	private SupplierInvoiceInfoService supplierInvoiceInfoService;
	@Autowired
	private MeisAttachmentService meisAttachmentService;
	@Autowired
	private SettlementObjectService settlementObjectService;

	public Supplier get(String id) {
		Supplier supplier= super.get(id);

		String supplierId = supplier.getId();
		SupplierAddress sa = new SupplierAddress();
		sa.setSupplierId(supplierId);
		List<SupplierAddress> supplierAddressList = supplierAddressService.findList(sa);
		supplier.setSupplierAddressList(supplierAddressList);
		SupplierBank sb=new SupplierBank();
		sb.setSupplierId(supplierId);
		List<SupplierBank> supplierBankList = supplierBankService.findList(sb);
		for (SupplierBank supplierBank : supplierBankList) {
			MeisAttachment bankAttachment = new MeisAttachment();
			bankAttachment.setBizId(supplierBank.getId());
			List<MeisAttachment> bankAttchList = meisAttachmentService.findAttchList(bankAttachment);
			for (MeisAttachment attachment : bankAttchList) {
				String path = attachment.getPath();
				if ("positivePhoto".equals(attachment.getBizType())) {
					supplierBank.setPositivePhoto(path);
				}
				if ("backPhoto".equals(attachment.getBizType())) {
					supplierBank.setBackPhoto(path);
				}
			}
		}
		supplier.setSupplierBankList(supplierBankList);

		SupplierConsigner sc =new SupplierConsigner();
		sc.setSupplierId(supplierId);
		List<SupplierConsigner> supplierConsignerList = supplierConsignerService.findList(sc);
		//获取照片
		for (SupplierConsigner supplierConsigner : supplierConsignerList) {
			MeisAttachment bankAttachment = new MeisAttachment();
			bankAttachment.setBizId(supplierConsigner.getId());
			List<MeisAttachment> bankAttchList = meisAttachmentService.findAttchList(bankAttachment);
			for (MeisAttachment attachment : bankAttchList) {
				String path = attachment.getPath();
				if ("proxyBookImgPath".equals(attachment.getBizType())) {
					supplierConsigner.setProxyBookImgPath(path);
				}
				if ("idCardImgPath".equals(attachment.getBizType())) {
					supplierConsigner.setIdCardImgPath(path);
				}
			}
		}
		supplier.setSupplierConsignerList(supplierConsignerList);
		SupplierDocumentTemplate sd =new SupplierDocumentTemplate();
		sd.setSupplierId(supplierId);
		List<SupplierDocumentTemplate> supplierDocumentTemplateList = supplierDocumentTemplateService.findList(sd);

		for (SupplierDocumentTemplate supplierDocumentTemplate : supplierDocumentTemplateList) {
			MeisAttachment attachment = new MeisAttachment();
			attachment.setBizId(supplierDocumentTemplate.getId());
			List<MeisAttachment> attachmentList = meisAttachmentService.findAttchList(attachment);
			for (MeisAttachment att : attachmentList) {
				String path = att.getPath();
				if ("imgPath".equals(att.getBizType())) {
					supplierDocumentTemplate.setImgPath(path);
				}
			}
		}

		supplier.setSupplierDocumentTemplateList(supplierDocumentTemplateList);
		SupplierInvoiceInfo si= new SupplierInvoiceInfo();
		si.setSupplierId(supplierId);
		List<SupplierInvoiceInfo> supplierInvoiceInfoList = supplierInvoiceInfoService.findList(si);
		for (SupplierInvoiceInfo supplierInvoiceInfo : supplierInvoiceInfoList) {
			MeisAttachment attachment = new MeisAttachment();
			attachment.setBizId(supplierInvoiceInfo.getId());
			List<MeisAttachment> attachmentList = meisAttachmentService.findAttchList(attachment);
			for (MeisAttachment att : attachmentList) {
				String path = att.getPath();
				if ("invoicePath".equals(att.getBizType())) {
					supplierInvoiceInfo.setInvoicePath(path);
				}
			}
		}
		supplier.setSupplierInvoiceInfoList(supplierInvoiceInfoList);
		return supplier;
	}
	
	public List<Supplier> findList(Supplier supplier) {
		return super.findList(supplier);
	}
	
	public Page<Supplier> findPage(Page<Supplier> page, Supplier supplier) {
		return super.findPage(page, supplier);
	}
	
	@Transactional(readOnly = false)
	public void save(Supplier supplier) {
		super.save(supplier);

		saveCollections(supplier);

	}

	private void saveCollections(Supplier supplier) {
		String sId=supplier.getId();
		if ("1".equals(supplier.getSettlementFlag())) {
			SettlementObject settlementObject = new SettlementObject();
			settlementObject.setOuterId(supplier.getId());
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
		List<SupplierAddress> supplierAddressList = supplier.getSupplierAddressList();
		List<SupplierBank> supplierBankList = supplier.getSupplierBankList();
		List<SupplierConsigner> supplierConsignerList = supplier.getSupplierConsignerList();
		List<SupplierDocumentTemplate> sdList = supplier.getSupplierDocumentTemplateList();
		List<SupplierInvoiceInfo> siList = supplier.getSupplierInvoiceInfoList();
		if (CollectionUtils.isNotEmpty(supplierAddressList)) {
			for (SupplierAddress supplierAddress : supplierAddressList) {
				supplierAddress.setSupplierId(sId);
				supplierAddressService.save(supplierAddress);
			}
		}
		if (CollectionUtils.isNotEmpty(supplierBankList)) {
			for (SupplierBank sb : supplierBankList) {
				sb.setSupplierId(sId);
				supplierBankService.save(sb);
				meisAttachmentService.saveAttachment(sb.getPositivePhoto(), sb.getId(), "positivePhoto", "img");
				meisAttachmentService.saveAttachment(sb.getBackPhoto(), sb.getId(), "backPhoto", "img");
			}
		}

		if (CollectionUtils.isNotEmpty(supplierConsignerList)) {
			for (SupplierConsigner sc : supplierConsignerList) {
				sc.setSupplierId(sId);
				supplierConsignerService.save(sc);
				meisAttachmentService.saveAttachment(sc.getProxyBookImgPath(), sc.getId(), "proxyBookImgPath", "img");
				meisAttachmentService.saveAttachment(sc.getIdCardImgPath(), sc.getId(), "idCardImgPath", "img");
			}
		}
		if (CollectionUtils.isNotEmpty(sdList)) {
			for (SupplierDocumentTemplate sd : sdList) {
				sd.setSupplierId(sId);
				supplierDocumentTemplateService.save(sd);
				meisAttachmentService.saveAttachment(sd.getImgPath(), sd.getId(), "imgPath", "img");
			}
		}
		if (CollectionUtils.isNotEmpty(siList)) {
			for (SupplierInvoiceInfo si : siList) {
				si.setSupplierId(sId);
				supplierInvoiceInfoService.save(si);
				meisAttachmentService.saveAttachment(si.getInvoicePath(), si.getId(), "invoicePath", "img");
			}
		}
	}

	@Transactional(readOnly = false)
	public void delete(Supplier supplier) {
		super.delete(supplier);
	}

	public int findCount() {
		return supplierDao.findCount();
	}
}