package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品组成库
 */
@Table(name = "tb_fool_library_seasoning")
public class FoolSeas extends BasePojo {

	@Id
	private Long id;// id主键
	private Long foolId;// 菜品id
	private String seasAddUserId;// 添加的用户id
	private String seasTitle;// 名称
	private Integer seasWeigetKg;// 重量kg
	private Integer seasWeigetCatty;// 重量斤
	private String seasMsg;// 备注：例如莲藕需要脆藕
	private String seasGiveShopUserId;// 配送该料的用户id
	private Integer seasSelect;// 配料表：0：主料，1.配料，2.调料，3.其它搭配的
	private String seasGiveShopUserPhone;// 配送该料的用户电话
	private String foolTitle;// 菜名
	
	
	public String getFoolTitle() {
		return foolTitle;
	}

	public void setFoolTitle(String foolTitle) {
		this.foolTitle = foolTitle;
	}

	public FoolSeas() {
		super();
	}


	public FoolSeas(Long id, Long foolId, String seasAddUserId, String seasTitle, Integer seasWeigetKg,
			Integer seasWeigetCatty, String seasMsg, String seasGiveShopUserId, Integer seasSelect,
			String seasGiveShopUserPhone, String foolTitle) {
		super();
		this.id = id;
		this.foolId = foolId;
		this.seasAddUserId = seasAddUserId;
		this.seasTitle = seasTitle;
		this.seasWeigetKg = seasWeigetKg;
		this.seasWeigetCatty = seasWeigetCatty;
		this.seasMsg = seasMsg;
		this.seasGiveShopUserId = seasGiveShopUserId;
		this.seasSelect = seasSelect;
		this.seasGiveShopUserPhone = seasGiveShopUserPhone;
		this.foolTitle = foolTitle;
	}

	public String getSeasGiveShopUserPhone() {
		return seasGiveShopUserPhone;
	}

	public void setSeasGiveShopUserPhone(String seasGiveShopUserPhone) {
		this.seasGiveShopUserPhone = seasGiveShopUserPhone;
	}
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

	public String getSeasAddUserId() {
		return seasAddUserId;
	}

	public void setSeasAddUserId(String seasAddUserId) {
		this.seasAddUserId = seasAddUserId;
	}

	public String getSeasTitle() {
		return seasTitle;
	}

	public void setSeasTitle(String seasTitle) {
		this.seasTitle = seasTitle;
	}

	public Integer getSeasWeigetKg() {
		return seasWeigetKg;
	}

	public void setSeasWeigetKg(Integer seasWeigetKg) {
		this.seasWeigetKg = seasWeigetKg;
	}

	public Integer getSeasWeigetCatty() {
		return seasWeigetCatty;
	}

	public void setSeasWeigetCatty(Integer seasWeigetCatty) {
		this.seasWeigetCatty = seasWeigetCatty;
	}

	public String getSeasMsg() {
		return seasMsg;
	}

	public void setSeasMsg(String seasMsg) {
		this.seasMsg = seasMsg;
	}

	public String getSeasGiveShopUserId() {
		return seasGiveShopUserId;
	}

	public void setSeasGiveShopUserId(String seasGiveShopUserId) {
		this.seasGiveShopUserId = seasGiveShopUserId;
	}

	public Integer getSeasSelect() {
		return seasSelect;
	}

	public void setSeasSelect(Integer seasSelect) {
		this.seasSelect = seasSelect;
	}

	
	@Override
	public String toString() {
		return "FoolSeas [id=" + id + ", foolId=" + foolId + ", seasAddUserId=" + seasAddUserId + ", seasTitle="
				+ seasTitle + ", seasWeigetKg=" + seasWeigetKg + ", seasWeigetCatty=" + seasWeigetCatty + ", seasMsg="
				+ seasMsg + ", seasGiveShopUserId=" + seasGiveShopUserId + ", seasSelect=" + seasSelect
				+ ", seasGiveShopUserPhone=" + seasGiveShopUserPhone + "]";
	}

	
	
}
