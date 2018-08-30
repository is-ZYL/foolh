package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品库
 */
@Table(name = "tb_fool_library_menu")
public class FoolLibraryMenu extends BasePojo {

	@Id
	private Long id;// id主键
	private String foolTitle;// 菜品标题
	private String foolImgTitle;// 菜品小图
	private Integer foolMakeTime;// 菜品制作时间
	private Integer foolPrice;// 菜品价格
	private Integer foolType;// 菜品类型id
	private Integer foolIsShop;// 菜品是否有用户，1.公共大家都可以看，2.私有菜品
	private String foolAddUserId;// 菜品上传的用户id
	private Long foolShopId;// 菜品店铺id
	private String userName;// 上传菜品用户名
	private String foolMsg;// 菜品备注
	

	public String getFoolMsg() {
		return foolMsg;
	}

	public void setFoolMsg(String foolMsg) {
		this.foolMsg = foolMsg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFoolTitle() {
		return foolTitle;
	}

	public void setFoolTitle(String foolTitle) {
		this.foolTitle = foolTitle;
	}

	public String getFoolImgTitle() {
		return foolImgTitle;
	}

	public void setFoolImgTitle(String foolImgTitle) {
		this.foolImgTitle = foolImgTitle;
	}

	public Integer getFoolMakeTime() {
		return foolMakeTime;
	}

	public void setFoolMakeTime(Integer foolMakeTime) {
		this.foolMakeTime = foolMakeTime;
	}

	public Integer getFoolPrice() {
		return foolPrice;
	}

	public void setFoolPrice(Integer foolPrice) {
		this.foolPrice = foolPrice;
	}

	public Integer getFoolIsShop() {
		return foolIsShop;
	}

	public void setFoolIsShop(Integer foolIsShop) {
		this.foolIsShop = foolIsShop;
	}

	public String getFoolAddUserId() {
		return foolAddUserId;
	}

	public void setFoolAddUserId(String foolAddUserId) {
		this.foolAddUserId = foolAddUserId;
	}

	public Long getFoolShopId() {
		return foolShopId;
	}

	public void setFoolShopId(Long foolShopId) {
		this.foolShopId = foolShopId;
	}

	public Integer getFoolType() {
		return foolType;
	}

	public void setFoolType(Integer foolType) {
		this.foolType = foolType;
	}

	@Override
	public String toString() {
		return "FoolLibraryMenu [id=" + id + ", foolTitle=" + foolTitle + ", foolImgTitle=" + foolImgTitle
				+ ", foolMakeTime=" + foolMakeTime + ", foolPrice=" + foolPrice + ", foolType=" + foolType
				+ ", foolIsShop=" + foolIsShop + ", foolAddUserId=" + foolAddUserId + ", foolShopId=" + foolShopId
				+ ", userName=" + userName + ", foolMsg=" + foolMsg + "]";
	}



}
