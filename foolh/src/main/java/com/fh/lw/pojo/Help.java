package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 帮助表
 *
 */
@Table(name = "tb_fool_help")
public class Help extends BasePojo {

	@Id
	private Long id;// id主键
	private Long helpAddUserId;// 添加帮助的用户id
	private String helpTitle;// 标题
	private String helpMsg;// 内容
	private Integer helpStatus;// 状态 0 未查看  1 已解决

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getHelpAddUserId() {
		return helpAddUserId;
	}

	public void setHelpAddUserId(Long helpAddUserId) {
		this.helpAddUserId = helpAddUserId;
	}

	public String getHelpTitle() {
		return helpTitle;
	}

	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}

	public String getHelpMsg() {
		return helpMsg;
	}

	public void setHelpMsg(String helpMsg) {
		this.helpMsg = helpMsg;
	}


	public Integer getHelpStatus() {
		return helpStatus;
	}

	public void setHelpStatus(Integer helpStatus) {
		this.helpStatus = helpStatus;
	}

	@Override
	public String toString() {
		return "Help [id=" + id + ", helpAddUserId=" + helpAddUserId + ", helpTitle=" + helpTitle + ", helpMsg="
				+ helpMsg + ", helpStatus=" + helpStatus + "]";
	}


}
