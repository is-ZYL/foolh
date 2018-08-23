package com.fh.lw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.lw.pojo.FoolMenu;
import com.fh.lw.pojo.FoolUserLog;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolUserLogService extends BaseService<FoolUserLog> {

	public PageInfo<FoolUserLog> getUserLogList(Integer page, Integer rows, String userId) {
		PageHelper.startPage(page, rows);
		FoolUserLog fs = new FoolUserLog();
		if (!userId.equals("0")) {
			fs.setUserId(userId);
		}
		List<FoolUserLog> flist = super.queryListByWhereDesc(null);
		return new PageInfo<FoolUserLog>(flist);
	}

}
