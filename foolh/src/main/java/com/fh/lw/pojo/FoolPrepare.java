package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品准备表
 */
@Table(name = "tb_fool_prepare")
public class FoolPrepare extends BasePojo {

	@Id
	private Long id;// id主键
	private Long foolId;// 菜品id
	private String prepAddUserId;// 添加准备的用户id
	private Integer prepTime;// 准备的时间，可以明天，后天等（准备的菜品使用时间）
	private Integer prepNum;// 准备的份数
	private Integer prepMsg;// 准备的说明

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

	public Integer getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(Integer prepTime) {
		this.prepTime = prepTime;
	}

	public Integer getPrepNum() {
		return prepNum;
	}

	public void setPrepNum(Integer prepNum) {
		this.prepNum = prepNum;
	}

	public Integer getPrepMsg() {
		return prepMsg;
	}

	public void setPrepMsg(Integer prepMsg) {
		this.prepMsg = prepMsg;
	}

}
