package com.fh.lw.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.system.User;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolSeas;

@Service
public class FoolSeasService extends BaseService<FoolSeas> {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	//添加菜品的所有材料
	public Integer saveSelectiveAll(List<FoolSeas> foolseasInfoArray,User user,FoolLibraryMenu f) throws ParseException {
		//dao.batchSave("", objs)
		//影响行数
		int result = 0;
		for (FoolSeas foolSeas : foolseasInfoArray) {
			foolSeas.setSeasAddUserId(user.getROLE_ID());
			foolSeas.setSeasWeigetCatty(foolSeas.getSeasWeigetKg()*2);
			foolSeas.setFoolId(f.getId());
			foolSeas.setFoolTitle(f.getFoolTitle());
			result += super.saveSelective(foolSeas);
		}
		return result;
	}

	

}
