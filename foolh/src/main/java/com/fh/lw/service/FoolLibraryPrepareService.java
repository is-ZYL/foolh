package com.fh.lw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.FoolLibraryPrepare;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolLibraryPrepareService extends BaseService<FoolLibraryPrepare>{

	public PageInfo<FoolLibraryPrepare> getFoolPrepareList(Integer page, Integer rows, String prepAddUserId) {
		PageHelper.startPage(page, rows);
		FoolLibraryPrepare fp = new FoolLibraryPrepare();
		fp.setPrepAddUserId(prepAddUserId);
		List<FoolLibraryPrepare> list = super.queryListByWhere(fp);
		return new PageInfo<FoolLibraryPrepare>(list);
	}
	
}
