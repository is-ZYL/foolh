package com.fh.lw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.FoolPrepare;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolPrepareService extends BaseService<FoolPrepare> {

	public PageInfo<FoolPrepare> getFoolPrepareList(Integer page, Integer rows, String prepAddUserId) {
		PageHelper.startPage(page, rows);
		FoolPrepare fp = new FoolPrepare();
		fp.setPrepAddUserId(prepAddUserId);
		List<FoolPrepare> list = super.queryListByWhere(fp);
		return new PageInfo<>(list);
	}

	public PageInfo<FoolPrepare> getFoolPrepareAll(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<FoolPrepare> list = super.queryListByWhere(null);
		return new PageInfo<>(list);
	}

}
