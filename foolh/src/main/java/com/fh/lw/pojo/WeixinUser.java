package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 通过微信获取用户
 * 
 * @author a55660000
 *
 */
@Table(name = "tb_weixin_user")
public class WeixinUser extends BasePojo {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String userId;// 用户id
	private String openId;// 微信获取openId
	private String userName;// 用户昵称
	private Integer money;// 用户余额
	private String headUrl;// 用户头像路径
	private String phone;// 用户电话
	private Integer sex;// 1-男，2-女
	private Integer isCheck;// 审核
	private String birth;// 生日
	private String streetId;// 街圈id
	private String name;// 用户姓名
	private Integer invite;// 邀请的人数
	private String inviteId;// 邀请人id
	private Integer robMoney;// 抢到的金额
	private String xchUrl;// 小程序码地址
	private Integer offline;// 是否线下：1-是，2-否
	private Integer userWyid; // 用户唯一id
	@Transient
	private String streetName;// 街圈名称
	
	private Integer isAuthen;//是否已认证：0:已认证可以抢红包，1.待去商家认证
	private String shopUserId;//够买该用户的商家用户id号
	private Integer authenNum;//认证次数

	public Integer getIsAuthen() {
		return isAuthen;
	}

	public void setIsAuthen(Integer isAuthen) {
		this.isAuthen = isAuthen;
	}

	public String getShopUserId() {
		return shopUserId;
	}

	public void setShopUserId(String shopUserId) {
		this.shopUserId = shopUserId;
	}

	public Integer getAuthenNum() {
		return authenNum;
	}

	public void setAuthenNum(Integer authenNum) {
		this.authenNum = authenNum;
	}

	public Integer getUserWyid() {
		return userWyid;
	}

	public void setUserWyid(Integer userWyid) {
		this.userWyid = userWyid;
	}

	public String getInviteId() {
		return inviteId;
	}

	public void setInviteId(String inviteId) {
		this.inviteId = inviteId;
	}

	public Integer getOffline() {
		return offline;
	}

	public void setOffline(Integer offline) {
		this.offline = offline;
	}

	public String getXchUrl() {
		return xchUrl;
	}

	public void setXchUrl(String xchUrl) {
		this.xchUrl = xchUrl;
	}

	public Integer getRobMoney() {
		return robMoney;
	}

	public void setRobMoney(Integer robMoney) {
		this.robMoney = robMoney;
	}

	public Integer getInvite() {
		return invite;
	}

	public void setInvite(Integer invite) {
		this.invite = invite;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreetId() {
		return streetId;
	}

	public void setStreetId(String streetId) {
		this.streetId = streetId;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(Integer isCheck) {
		this.isCheck = isCheck;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
