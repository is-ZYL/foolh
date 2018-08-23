package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜品和用户的绑定表 CREATE TABLE `tb_fool_log_user` (
 */
@Table(name = "tb_fool_log_user")
public class FoolUserLog extends BasePojo {
	@Id
	private Long id;// id主键
	private String log_content;// 操作内容
	private String userId;// 用户id

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLog_content() {
		return log_content;
	}

	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
