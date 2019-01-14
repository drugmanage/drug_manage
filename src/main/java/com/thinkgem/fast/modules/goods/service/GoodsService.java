package com.thinkgem.fast.modules.goods.service;

import java.util.List;

import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import com.thinkgem.fast.modules.attachment.service.MeisAttachmentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.modules.goods.entity.Goods;
import com.thinkgem.fast.modules.goods.dao.GoodsDao;

/**
 * 商品资料Service
 * @author 刘海涛
 * @version 2019-01-04
 */
@Service
@Transactional(readOnly = true)
public class GoodsService extends CrudService<GoodsDao, Goods> {

	@Autowired
	private GoodsDao goodsDao;

	@Autowired
	private MeisAttachmentService meisAttachmentService;

	public Goods get(String id) {

		Goods goods =super.get(id);
		MeisAttachment attr =new MeisAttachment();
		attr.setBizId(id);
		//查询所有相关的图片
		List<MeisAttachment> attchList = meisAttachmentService.findAttchList(attr);
		String pathGoods="";
		String pathGoodsCode="";
		String pathGoodsRegulatory="";
		for (MeisAttachment meisAttachment : attchList) {

			if ("pathGoods".equals(meisAttachment.getBizType())) {
				if (StringUtils.isNotBlank(pathGoods)) {
					pathGoods += "|";
				}
				pathGoods += meisAttachment.getPath();
			}
			if ("pathGoodsCode".equals(meisAttachment.getBizType())) {
				if (StringUtils.isNotBlank(pathGoodsCode)) {
					pathGoodsCode += "|";
				}
				pathGoodsCode += meisAttachment.getPath();
			}
			if ("pathGoodsRegulatory".equals(meisAttachment.getBizType())) {
				if (StringUtils.isNotBlank(pathGoodsRegulatory)) {
					pathGoodsRegulatory += "|";
				}
				pathGoodsRegulatory += meisAttachment.getPath();
			}
		}
		if(StringUtils.isNotBlank(pathGoods) ){
			goods.setPathGoodsImage(pathGoods);
		}
		if(StringUtils.isNotBlank(pathGoodsCode)){
			goods.setPathGoodsCodeImage(pathGoodsCode);
		}
		if(StringUtils.isNotBlank(pathGoodsRegulatory) ){
			goods.setPathGoodsRegulatoryImage(pathGoodsRegulatory);
		}
		return goods;
	}
	
	public List<Goods> findList(Goods goods) {
		return super.findList(goods);
	}
	
	public Page<Goods> findPage(Page<Goods> page, Goods goods) {
		return super.findPage(page, goods);
	}
	
	@Transactional(readOnly = false)
	public void save(Goods goods) {
		super.save(goods);
	}

	@Transactional(readOnly = false)
	public void saveAndImg(Goods goods) {
		this.save(goods);
		//保存图片信息
		meisAttachmentService.saveAttachment(goods.getPathGoodsImage(),goods.getId(),"pathGoods","img");
		meisAttachmentService.saveAttachment(goods.getPathGoodsCodeImage(),goods.getId(),"pathGoodsCode","img");
		meisAttachmentService.saveAttachment(goods.getPathGoodsRegulatoryImage(),goods.getId(),"pathGoodsRegulatory","img");
	}
	
	@Transactional(readOnly = false)
	public void delete(Goods goods) {
		super.delete(goods);
	}

    public int findCount() {
		return goodsDao.findCount();
    }
}