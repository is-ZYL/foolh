package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.entity.system.User;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolShop;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolLibraryMenuService extends BaseService<FoolLibraryMenu> {
	
	@Autowired
	private FoolShopService fs;

	public PageInfo<FoolLibraryMenu> getListMenu(Integer page, Integer rows,Integer type,String uId) {

		PageHelper.startPage(page, rows);
		FoolLibraryMenu flm = new FoolLibraryMenu();
		if(type==1) {
			flm.setFoolIsShop(1);
		}else {
			FoolShop sh = new FoolShop();
			//如果这个店铺是这个用户添加的
			sh.setShopAddUserId(uId);
			FoolShop f = this.fs.queryOne(sh);
			flm.setFoolIsShop(2);
			flm.setFoolShopId(f.getId());
		}
		
		List<FoolLibraryMenu> flms = super.queryListByWhere(flm);
		return new PageInfo<FoolLibraryMenu>(flms);
	}

	
	public FoolLibraryMenu queryByfoolTitle(FoolLibraryMenu foolmenu) {
		return super.queryOne(foolmenu);
	}
	
}
