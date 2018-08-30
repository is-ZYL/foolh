package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品和用户的绑定表 `tb_fool_shop`
 */
@Table(name = "tb_fool_shop")
public class FoolShop extends BasePojo {

	@Id
	private Long id;// id主键
	private String shopAddUserId;// 添加店铺的用户id
	private String shopTitle;// 店铺名称
	private String shopImg;// 店铺执照
	private String shopMsg;// 店铺介绍
	private Integer shopType;// 店铺类别 1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 默认0
	private String shopAddress;// 地址
	private String shopBossName;// 老板姓名
	private String shopPhone;// 老板电话
	private Long songShuichanShopId;// 饭店绑定的水产店id，默认为0:没有 表示是配送店',
	private Long songShucaiShopId;// 饭店绑定的蔬菜店id，默认为0:没有 表示是配送店',
	private Long songGanzaShopId;// 饭店绑定的干杂店id，默认为0:没有 表示是配送店',
	private Long songHaixianShopId;// 饭店绑定的海鲜店id，默认为0:没有 表示是配送店',
	private Long songQitaShopId;// 饭店绑定的其他店id，默认为0:没有 表示是配送店',
	private String songShopIdList;// 配送店绑定的店铺id，格式：3，4,5,6，7 逗号分隔
	private Integer shopStatus;// 店铺审核状态  0未审核   1已审核
	private String shopSendTime;// 店铺送货时间

	
	
	
	public Integer getShopStatus() {
		return shopStatus;
	}

	public void setShopStatus(Integer shopStatus) {
		this.shopStatus = shopStatus;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public String getShopAddUserId() {
		return shopAddUserId;
	}

	public void setShopAddUserId(String shopAddUserId) {
		this.shopAddUserId = shopAddUserId;
	}

	public String getShopTitle() {
		return shopTitle;
	}

	public void setShopTitle(String shopTitle) {
		this.shopTitle = shopTitle;
	}

	public String getShopMsg() {
		return shopMsg;
	}

	public void setShopMsg(String shopMsg) {
		this.shopMsg = shopMsg;
	}

	public Integer getShopType() {
		return shopType;
	}

	public void setShopType(Integer shopType) {
		this.shopType = shopType;
	}

	public String getShopImg() {
		return shopImg;
	}

	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopBossName() {
		return shopBossName;
	}

	public void setShopBossName(String shopBossName) {
		this.shopBossName = shopBossName;
	}

	public String getShopPhone() {
		return shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public Long getSongShuichanShopId() {
		return songShuichanShopId;
	}

	public void setSongShuichanShopId(Long songShuichanShopId) {
		this.songShuichanShopId = songShuichanShopId;
	}

	public Long getSongShucaiShopId() {
		return songShucaiShopId;
	}

	public void setSongShucaiShopId(Long songShucaiShopId) {
		this.songShucaiShopId = songShucaiShopId;
	}

	public Long getSongGanzaShopId() {
		return songGanzaShopId;
	}

	public void setSongGanzaShopId(Long songGanzaShopId) {
		this.songGanzaShopId = songGanzaShopId;
	}

	public Long getSongHaixianShopId() {
		return songHaixianShopId;
	}

	public void setSongHaixianShopId(Long songHaixianShopId) {
		this.songHaixianShopId = songHaixianShopId;
	}

	public Long getSongQitaShopId() {
		return songQitaShopId;
	}

	public void setSongQitaShopId(Long songQitaShopId) {
		this.songQitaShopId = songQitaShopId;
	}

	public String getSongShopIdList() {
		return songShopIdList;
	}

	public void setSongShopIdList(String songShopIdList) {
		this.songShopIdList = songShopIdList;
	}

	public String getShopSendTime() {
		return shopSendTime;
	}

	public void setShopSendTime(String shopSendTime) {
		this.shopSendTime = shopSendTime;
	}

	@Override
	public String toString() {
		return "FoolShop [id=" + id + ", shopAddUserId=" + shopAddUserId + ", shopTitle=" + shopTitle + ", shopImg="
				+ shopImg + ", shopMsg=" + shopMsg + ", shopType=" + shopType + ", shopAddress=" + shopAddress
				+ ", shopBossName=" + shopBossName + ", shopPhone=" + shopPhone + ", songShuichanShopId="
				+ songShuichanShopId + ", songShucaiShopId=" + songShucaiShopId + ", songGanzaShopId=" + songGanzaShopId
				+ ", songHaixianShopId=" + songHaixianShopId + ", songQitaShopId=" + songQitaShopId
				+ ", songShopIdList=" + songShopIdList + ", shopStatus=" + shopStatus + ", shopSendTime=" + shopSendTime
				+ "]";
	}




}
