package com.thinkgem.fast.modules.attachment.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.fast.common.persistence.Page;
import com.thinkgem.fast.common.service.CrudService;
import com.thinkgem.fast.common.utils.StringUtils;
import com.thinkgem.fast.modules.attachment.dao.MeisAttachmentDao;
import com.thinkgem.fast.modules.attachment.entity.MeisAttachment;
import com.thinkgem.fast.modules.sys.entity.User;
import com.thinkgem.fast.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * 附件管理Service
 *
 * @author renshuo
 * @version 2018-10-24
 */
@Service
@Transactional(readOnly = true)
public class MeisAttachmentService extends
        CrudService<MeisAttachmentDao, MeisAttachment> {

    @Autowired
    private MeisAttachmentDao meisAttachmentDao;

    public MeisAttachment get(String id) {
        return super.get(id);
    }

    public List<MeisAttachment> findList(MeisAttachment meisAttachment) {
        return super.findList(meisAttachment);
    }

    public Page<MeisAttachment> findPage(Page<MeisAttachment> page,
                                         MeisAttachment meisAttachment) {
        return super.findPage(page, meisAttachment);
    }

    @Transactional(readOnly = false)
    public void save(MeisAttachment meisAttachment) {
        super.save(meisAttachment);
    }

    @Transactional(readOnly = false)
    public void delete(MeisAttachment meisAttachment) {
        super.delete(meisAttachment);
    }

    /**
     * 查看附件
     *
     * @param officeid 机构id
     * @param bizid    附件所属的业务ID (例：商品)
     * @return 相关附件列表 类型 imagepath docpath videopath audiopath pdfpath
     */
    public List<Map<String, String>> findMeisAttachmentByBizId(String officeid,
                                                               String bizid) {
        List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
        List<MeisAttachment> list = meisAttachmentDao
                .findMeisAttachmentByBizId(officeid, bizid);
        String imagepath = "";
        String filepath = "";
        String videopath = "";
        String audiopath = "";
        for (int i = 0; i < list.size(); i++) {
            MeisAttachment meisAttachment = list.get(i);
            // 根据type判断是图片还是文件
            if ("img".equals(meisAttachment.getType())) {
                imagepath = "|" + imagepath + meisAttachment.getPath() + "|";
            } else if ("doc".equals(meisAttachment.getType())) {
                filepath = "|" + filepath + meisAttachment.getPath() + "|";
            } else if ("video".equals(meisAttachment.getType())) {
                videopath = "|" + videopath + meisAttachment.getPath() + "|";
            } else if ("audio".equals(meisAttachment.getType())) {
                audiopath = "|" + audiopath + meisAttachment.getPath() + "|";
            } else if ("pdf".equals(meisAttachment.getType())) {
                filepath = "|" + filepath + meisAttachment.getPath() + "|";
            } else {

            }
        }
        if (StringUtils.isNoneEmpty(imagepath) && imagepath.endsWith("|")) {
            imagepath = imagepath.substring(0, imagepath.length() - 1);
            Map<String, String> map = new HashMap<String, String>();
            map.put("imagepath", imagepath);
            resultList.add(map);
        }
        if (StringUtils.isNoneEmpty(filepath) && filepath.endsWith("|")) {
            filepath = filepath.substring(0, filepath.length() - 1);
            Map<String, String> map = new HashMap<String, String>();
            map.put("filepath", filepath);
            resultList.add(map);
        }
        if (StringUtils.isNoneEmpty(videopath) && videopath.endsWith("|")) {
            videopath = videopath.substring(0, videopath.length() - 1);
            Map<String, String> map = new HashMap<String, String>();
            map.put("videopath", videopath);
            resultList.add(map);
        }
        if (StringUtils.isNoneEmpty(audiopath) && audiopath.endsWith("|")) {
            audiopath = audiopath.substring(0, audiopath.length() - 1);
            Map<String, String> map = new HashMap<String, String>();
            map.put("audiopath", audiopath);
            resultList.add(map);
        }

        return resultList;
    }

    /**
     * 保存附件
     *
     * @param parstr  存储的附件路径 可为多个 以 | 分割
     * @param bizid   bizid (例：商品)
     * @param biztype
     */
    @Transactional(readOnly = false)
    public void saveAttachment(String parstr, String bizid, String biztype,
                               String type) {

        //保存时先删除附件
        deleteByMeis(bizid,biztype);

        String pathflag;
        if (StringUtils.isBlank(parstr))
            return;
        if (parstr.startsWith("|")) {
            // 有时候会出现第一个字符为"|"
            pathflag = parstr.substring(1);
        } else {
            pathflag = parstr;
        }
        String[] arrstr = pathflag.split("\\|");
        for (String s : arrstr) {
            if (!"".equals(s)) {
                MeisAttachment meisAttachment = new MeisAttachment();
                User user = UserUtils.getUser();
                meisAttachment.setUpdateBy(user);
                meisAttachment.setCreateBy(user);
                meisAttachment.setUpdateDate(new Date());
                meisAttachment.setCreateDate2(meisAttachment.getUpdateDate());
                meisAttachment.setBizId(bizid);
                meisAttachment.setOffice(UserUtils.getUser().getCompany());
                meisAttachment.setPath(s);
                meisAttachment.setBizType(biztype);
                meisAttachment.setType(type);
                String[] str = s.split("\\.");
                meisAttachment.setMimeType(str[1]);
                String[] name = s.split("/");
                meisAttachment.setTitle(name[name.length - 1]);
                this.save(meisAttachment);
            }
        }
    }

    @Transactional(readOnly = false)
    public void deleteByBizId(String bizId,String bizType) {
        meisAttachmentDao.deleteByBizId(bizId);
    }

    @Transactional(readOnly = false)
    public void deleteByMeis(String bizId,String bizType) {
        MeisAttachment meis = new MeisAttachment();
        meis.setBizId(bizId);
        meis.setBizType(bizType);
        meisAttachmentDao.deleteByMeis(meis);
    }

    public List<MeisAttachment> findAttchList(MeisAttachment meisAttachment) {
        return meisAttachmentDao.findAttchList(meisAttachment);
    }

}