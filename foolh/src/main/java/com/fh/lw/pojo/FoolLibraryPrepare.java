package com.fh.lw.pojo;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品准备库
 */
@Table(name = "tb_fool_library_prepare")
public class FoolLibraryPrepare extends BasePojo {

	@Id
	private Long id;// id主键
	private Long foolId;// 菜品id
	private Long shopId;// 店铺id
	private String shopTitle;// 店铺名称
	private String foolTitle;// 菜品名
	private String prepAddUserId;// 添加准备的用户id
	private String prepAddUserName;// 添加准备的用户名称
	private Date prepTime;// 准备的时间，可以明天，后天等（准备的菜品使用时间）
	private Integer prepNum;// 准备的份数
	private String prepMsg;// 准备的说明
	private Integer status;// 当前状态 0 未配送 1 已配送

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFoolId() {
		return foolId;
	}

	public void setFoolId(Long foolId) {
		this.foolId = foolId;
	}

	public String getPrepAddUserId() {
		return prepAddUserId;
	}

	public void setPrepAddUserId(String prepAddUserId) {
		this.prepAddUserId = prepAddUserId;
	}

	public Date getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(Date prepTime) {
		this.prepTime = prepTime;
	}

	public Integer getPrepNum() {
		return prepNum;
	}

	public void setPrepNum(Integer prepNum) {
		this.prepNum = prepNum;
	}

	public String getPrepMsg() {
		return prepMsg;
	}

	public void setPrepMsg(String prepMsg) {
		this.prepMsg = prepMsg;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getFoolTitle() {
		return foolTitle;
	}

	public void setFoolTitle(String foolTitle) {
		this.foolTitle = foolTitle;
	}

	public String getPrepAddUserName() {
		return prepAddUserName;
	}

	public void setPrepAddUserName(String prepAddUserName) {
		this.prepAddUserName = prepAddUserName;
	}

	public String getShopTitle() {
		return shopTitle;
	}

	public void setShopTitle(String shopTitle) {
		this.shopTitle = shopTitle;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	@Override
	public String toString() {
		return "FoolLibraryPrepare [id=" + id + ", foolId=" + foolId + ", shopId=" + shopId + ", shopTitle=" + shopTitle
				+ ", foolTitle=" + foolTitle + ", prepAddUserId=" + prepAddUserId + ", prepAddUserName="
				+ prepAddUserName + ", prepTime=" + prepTime + ", prepNum=" + prepNum + ", prepMsg=" + prepMsg
				+ ", status=" + status + "]";
	}

}
