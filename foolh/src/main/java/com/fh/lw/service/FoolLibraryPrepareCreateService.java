package com.fh.lw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.FoolLibraryPrepareCreate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolLibraryPrepareCreateService extends BaseService<FoolLibraryPrepareCreate> {

	public PageInfo<FoolLibraryPrepareCreate> getFoolPrepareCrateLibraryList(Integer page, Integer rows,
			Long createShopId) {
		PageHelper.startPage(page, rows);
		FoolLibraryPrepareCreate fp = new FoolLibraryPrepareCreate();
		fp.setCreateShopId(createShopId);
		List<FoolLibraryPrepareCreate> list = super.queryListByWhere(fp);
		return new PageInfo<FoolLibraryPrepareCreate>(list);
	}

}
