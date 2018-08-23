package com.fh.service.system.appuser;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;


/** 会员接口类
 * @author fh728971035qq(庸人修行录)
 * 修改时间：2015.11.2
 */
public interface WeixinUserManager {
	

	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPdPageUser(Page page)throws Exception;
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getWeixinUserCount(String user_id)throws Exception;
	public void editW(PageData pd)throws Exception;
	public void editL(PageData pd)throws Exception;
	public PageData findById(PageData pd)throws Exception;
}

