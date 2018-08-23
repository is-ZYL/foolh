package com.fh.lw.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang.ObjectUtils.Null;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.FoolLibraryMenuMapper;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolLibrarySeas;
import com.fh.lw.pojo.FoolMenu;
import com.fh.lw.pojo.FoolSeas;
import com.fh.lw.pojo.FoolShop;
import com.fh.lw.pojo.WeixinUser;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import oracle.net.aso.n;

@Service
public class FoolMenuService extends BaseService<FoolMenu> {
	@Autowired
	private FoolLibraryMenuMapper foolMapper;
	@Autowired
	private FoolShopService fShops;
	@Autowired
	private FoolSeasService fss;
	@Autowired
	private FoolMenuService fms;
	@Autowired
	private FoolLibraryMenuService flms;

	@Autowired
	private FoolLibrarySeasService fles;
	@Autowired
	private UserWxService us;
	@Autowired
	private FoolSeasService fle;
	@Autowired
	private FoolLibraryPrepareService flps;

	public void addFoolMenuAndSeas(WeixinUser u, FoolMenu fm) {
		FoolShop shop = new FoolShop();
		shop.setShopPhone(u.getPhone());
		FoolShop s = this.fShops.queryOne(shop);
		fm.setFoolShopId(s.getId());
		fm.setFoolAddUserId(u.getUserId());
		fm.setFoolIsShop(2);
		this.fms.saveSelective(fm);
		// 保存到库
		FoolLibraryMenu flm = new FoolLibraryMenu();
		flm.setFoolAddUserId(fm.getFoolAddUserId());
		flm.setFoolImgTitle(fm.getFoolImgTitle());
		flm.setFoolIsShop(fm.getFoolIsShop());
		flm.setFoolMakeTime(fm.getFoolMakeTime());
		flm.setFoolPrice(fm.getFoolPrice());
		flm.setFoolShopId(fm.getFoolShopId());
		flm.setFoolTitle(fm.getFoolTitle());
		this.flms.saveSelective(flm);

	}

	public void addFoolSeas(String uId, FoolSeas fs, String givePhone) {
		WeixinUser u = new WeixinUser();
		u.setPhone(givePhone);
		WeixinUser uu = this.us.queryOne(u);

		fs.setSeasAddUserId(uId);
		this.fle.saveSelective(fs);
		FoolLibrarySeas flss = new FoolLibrarySeas();
		flss.setFoolId(fs.getFoolId());
		flss.setSeasAddUserId(fs.getSeasAddUserId());
		flss.setSeasGiveShopUserPhone(givePhone);
		flss.setSeasMsg(fs.getSeasMsg());
		flss.setSeasSelect(fs.getSeasSelect());
		flss.setSeasTitle(fs.getSeasTitle());
		flss.setSeasWeigetCatty(fs.getSeasWeigetCatty());
		flss.setSeasWeigetKg(fs.getSeasWeigetKg());

		if (uu == null) {
			flss.setSeasGiveShopUserId("0");
		} else {
			// 该料的配送用户id
			flss.setSeasGiveShopUserId(fs.getSeasGiveShopUserId());
		}
		this.fles.saveSelective(flss);

	}

	public PageInfo<FoolLibraryMenu> getListMenu(Integer page, Integer rows, Integer type) {
		PageHelper.startPage(page, rows);
		FoolLibraryMenu fs = new FoolLibraryMenu();
		if (type != 100) {
			fs.setFoolIsShop(type);
		}
		List<FoolLibraryMenu> flist = this.flms.queryListByWhereASC(fs);
		return new PageInfo<FoolLibraryMenu>(flist);
	}

	public List<FoolLibraryMenu> getMenuListByShopId(Long shopId) {
		FoolLibraryMenu fm = new FoolLibraryMenu();
		fm.setFoolShopId(shopId);
		return this.flms.queryListByWhere(fm);
	}

	public List<FoolLibrarySeas> getSeasListByMenuId(Long menuId) {
		FoolLibrarySeas fl = new FoolLibrarySeas();
		fl.setFoolId(menuId);
		return this.fles.queryListByWhereDesc(fl);
	}
	
	public PageInfo<FoolLibraryMenu> getListMenuByKeywordsAndOtherInfo(String [] allInfo) {
		if ("".equals(allInfo[3]) && "".equals(allInfo[4])&& "".equals(allInfo[5])&& "0".equals(allInfo[6])&& "0".equals(allInfo[7])) {
			return this.fms.getListMenu(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]),Integer.parseInt(allInfo[2]));
		}else {
			Example example = new Example(FoolLibraryMenu.class);
			PageHelper.startPage(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
			Criteria criteria = example.createCriteria();
			//["page":1,"rows":10,"type":100,"keywords":keywords,"is_check":is_check,"created":created,"foolId":foolId,"foolShopId":foolShopId];
			// 菜名进行查找
			if (!"".equals(allInfo[3])) {
				criteria.andLike("foolTitle", "%" + allInfo[3] + "%");
			}
			// 根据id 进行查找
			if (Integer.parseInt(allInfo[6]) > 0) {
				criteria.andEqualTo("id", Integer.parseInt(allInfo[6]));
			}
			// 根据店铺IDfoolShopId 进行查找
			if (Integer.parseInt(allInfo[7]) > 0) {
				criteria.andEqualTo("foolShopId", Integer.parseInt(allInfo[7]));
			}
			// 为空则说明查询全部类型的菜品
			if (!"".equals(allInfo[4])) {
				criteria.andEqualTo("foolIsShop", allInfo[4]);
			}
			//菜品创建时间
			if (!"".equals(allInfo[5])) {
				criteria.andLike("created", "%" +allInfo[5]+ "%");
			}
			example.setOrderByClause("created ASC");
			List<FoolLibraryMenu> list = this.foolMapper.selectByExample(example);
			return new PageInfo<>(list);
		}
	}

}
