package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 *生成的菜品调料库
 */
@Table(name = "tb_fool_library_prepare_create")
public class FoolPrepareCreate extends BasePojo {

	@Id
	private Long id;// id主键
	private Long foolId;// 菜品id
	private String createTitle;// 生成的菜品配料名称
	private Integer createWeight;// 生成的菜品配料重量kg
	private Integer createType;// 生成的配料属于：0：其它，1.水产，2.蔬菜，3.海鲜，4.干杂
	private Integer createShopId;// 属于哪个饭店生成的

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

	public String getCreateTitle() {
		return createTitle;
	}

	public void setCreateTitle(String createTitle) {
		this.createTitle = createTitle;
	}

	public Integer getCreateWeight() {
		return createWeight;
	}

	public void setCreateWeight(Integer createWeight) {
		this.createWeight = createWeight;
	}

	public Integer getCreateType() {
		return createType;
	}

	public void setCreateType(Integer createType) {
		this.createType = createType;
	}

	public Integer getCreateShopId() {
		return createShopId;
	}

	public void setCreateShopId(Integer createShopId) {
		this.createShopId = createShopId;
	}

}
