package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 意见建议表
 *
 */
@Table(name = "tb_fool_jianyi")
public class Jianyi extends BasePojo {
	/**
	 *   
	 */

	@Id
	private Long id;// id主键
	private String propAddUserId;// 提交建议的用户id
	private String propTitle;// 标题
	private String propMsg;// 内容
	private Integer propIsCheck;// 是否采纳，0：未审核，1.审核, 审核通过后可以给与奖励

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPropAddUserId() {
		return propAddUserId;
	}

	public void setPropAddUserId(String propAddUserId) {
		this.propAddUserId = propAddUserId;
	}

	public String getPropTitle() {
		return propTitle;
	}

	public void setPropTitle(String propTitle) {
		this.propTitle = propTitle;
	}

	public String getPropMsg() {
		return propMsg;
	}

	public void setPropMsg(String propMsg) {
		this.propMsg = propMsg;
	}

	public Integer getPropIsCheck() {
		return propIsCheck;
	}

	public void setPropIsCheck(Integer propIsCheck) {
		this.propIsCheck = propIsCheck;
	}

}
