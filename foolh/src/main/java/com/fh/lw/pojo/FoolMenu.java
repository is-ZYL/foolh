package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品库
 */
@Table(name = "tb_fool_menu")
public class FoolMenu extends BasePojo {

	@Id
	private Long id;// id主键
	private String foolTitle;// 菜品标题
	private String foolImgTitle;// 菜品小图
	private Integer foolMakeTime;// 菜品制作时间
	private Integer foolPrice;// 菜品价格
	private Integer foolIsShop;// 菜品是否有用户，1.公共大家都可以看，2.私有菜品
	private String foolAddUserId;// 菜品上传的用户id
	private Long foolShopId;// 菜品店铺id

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

}
