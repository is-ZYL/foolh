package com.fh.entity.system;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
* 类名称：角色
* 类描述： 
* @author FH QQ 728971035[庸人修行录]
* 作者单位： 
* 联系方式：
* 创建时间：2014年3月10日
* @version 1.0
 */
@Table(name="sys_role")

public class Role{
	@Id
	private String ROLE_ID;
	private String ROLE_NAME;
	private String RIGHTS;
	private String PARENT_ID;
	private String ADD_QX;
	private String DEL_QX;
	private String EDIT_QX;
	private String CHA_QX;
	private Integer mdeduct;//金额折扣
	private String role_condition;//要求条件
	private Integer role_money;//成为代理金额
	
	
	public Integer getRole_money() {
		return role_money;
	}
	public void setRole_money(Integer role_money) {
		this.role_money = role_money;
	}
	public String getRole_condition() {
		return role_condition;
	}
	public void setRole_condition(String role_condition) {
		this.role_condition = role_condition;
	}
	public Integer getMdeduct() {
		return mdeduct;
	}
	public void setMdeduct(Integer mdeduct) {
		this.mdeduct = mdeduct;
	}
	public String getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getROLE_NAME() {
		return ROLE_NAME;
	}
	public void setROLE_NAME(String rOLE_NAME) {
		ROLE_NAME = rOLE_NAME;
	}
	public String getRIGHTS() {
		return RIGHTS;
	}
	public void setRIGHTS(String rIGHTS) {
		RIGHTS = rIGHTS;
	}
	public String getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}
	public String getADD_QX() {
		return ADD_QX;
	}
	public void setADD_QX(String aDD_QX) {
		ADD_QX = aDD_QX;
	}
	public String getDEL_QX() {
		return DEL_QX;
	}
	public void setDEL_QX(String dEL_QX) {
		DEL_QX = dEL_QX;
	}
	public String getEDIT_QX() {
		return EDIT_QX;
	}
	public void setEDIT_QX(String eDIT_QX) {
		EDIT_QX = eDIT_QX;
	}
	public String getCHA_QX() {
		return CHA_QX;
	}
	public void setCHA_QX(String cHA_QX) {
		CHA_QX = cHA_QX;
	}
	
	
}
