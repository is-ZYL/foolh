package com.fh.lw.service;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.WeixinUser;

@Service
public class UserWxService extends BaseService<WeixinUser> {

	public WeixinUser getWxUserByOpenid(String openid) {	
		WeixinUser U = new WeixinUser();
		U.setOpenId(openid);

		return super.queryOne(U);

}
}
