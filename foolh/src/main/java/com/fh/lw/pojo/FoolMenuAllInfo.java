package com.fh.lw.pojo;

import java.util.List;

/**
 * 菜品库
 */
public class FoolMenuAllInfo {

	
	private FoolLibraryMenu foolMenuInfo; // 菜品对象
	private List<FoolLibrarySeas> foolseasInfoArray;// 菜品所需材料的对象

	public FoolMenuAllInfo() {
		super();
	}

	public FoolMenuAllInfo(FoolLibraryMenu foolMenuInfo, List<FoolLibrarySeas> foolseasInfoArray) {
		super();
		this.foolMenuInfo = foolMenuInfo;
		this.foolseasInfoArray = foolseasInfoArray;
	}

	public FoolLibraryMenu getFoolMenuInfo() {
		return foolMenuInfo;
	}

	public void setFoolMenuInfo(FoolLibraryMenu foolMenuInfo) {
		this.foolMenuInfo = foolMenuInfo;
	}

	public List<FoolLibrarySeas> getFoolseasInfoArray() {
		return foolseasInfoArray;
	}

	public void setFoolseasInfoArray(List<FoolLibrarySeas> foolseasInfoArray) {
		this.foolseasInfoArray = foolseasInfoArray;
	}

	@Override
	public String toString() {
		return "FoolMenuAllInfo [foolMenuInfo=" + foolMenuInfo + ", foolseasInfoArray=" + foolseasInfoArray + "]";
	}

}
