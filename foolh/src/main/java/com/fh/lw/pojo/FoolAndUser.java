package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品和用户的绑定表
 */
@Table(name = "tb_fool_and_user")
public class FoolAndUser extends BasePojo {

	@Id
	private Long id;// id主键
	private Long foolId;// 菜品id
	private String userId;// 用户id

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
