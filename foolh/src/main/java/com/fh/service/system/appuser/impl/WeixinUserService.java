package com.fh.service.system.appuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.system.appuser.WeixinUserManager;
import com.fh.util.PageData;


/**类名称：AppuserService
 * @author FH Q728971035
 * 修改时间：2015年11月6日
 */
@Service("hweixinUserService")
public class WeixinUserService implements WeixinUserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("WeixinUserMapper.userlistPage", page);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getWeixinUserCount(String user_id)throws Exception{
		return (PageData)dao.findForObject("WeixinUserMapper.getWeixinUserCount", user_id);
	}
	@Override
	public void editW(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		this.dao.update("WeixinUserMapper.editW", pd);
	}
	@Override
	public void editL(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		this.dao.update("WeixinUserMapper.editL", pd);
	}
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("WeixinUserMapper.findById", pd);
	}
}

