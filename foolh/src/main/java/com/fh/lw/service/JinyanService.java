package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.FoolLibraryMenuMapper;
import com.fh.lw.mapper.JianyiMapper;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolShop;
import com.fh.lw.pojo.Jianyi;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class JinyanService extends BaseService<Jianyi> {
	@Autowired
	private JianyiMapper jianYiMapper;
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
	@Autowired
	private JinyanService jianyi;

	
	public PageInfo<Jianyi> getListMenu(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		Jianyi jianyi = new Jianyi();
		List<Jianyi> flist = this.jianyi.queryListByWhereDesc(jianyi);
		return new PageInfo<Jianyi>(flist);
	}
	
	
	public PageInfo<Jianyi> getJianyiByKeywordsAndOtherInfo(String[] allInfo) {

		if ("".equals(allInfo[3]) && "".equals(allInfo[4])&& "".equals(allInfo[5])) {
			return this.jianyi.getListMenu(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
		}else {
			Example example = new Example(Jianyi.class);
			PageHelper.startPage(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
			Criteria criteria = example.createCriteria();
			//[ page, rows, type, jianYiTitle, is_check, created];
			// 菜名进行查找
			if (!"".equals(allInfo[3])) {
				criteria.andLike("propTitle", "%" + allInfo[3] + "%");
			}
			// 为空则说明查询全部类型
			if (!"".equals(allInfo[4])) {
				criteria.andEqualTo("propIsCheck", allInfo[4]);
			}
			//创建时间
			if (!"".equals(allInfo[5])) {
				criteria.andLike("created", "%" +allInfo[5]+ "%");
			}
			example.setOrderByClause("created DESC");
			List<Jianyi> list = this.jianYiMapper.selectByExample(example);
			return new PageInfo<>(list);
		}
	}


	public Integer changeJianyiStatus(Jianyi jianyi) {
		if (jianyi.getPropIsCheck() == 1) {
			jianyi.setPropIsCheck(0);
		} else {
			jianyi.setPropIsCheck(1);
		}
		return super.updateSelective(jianyi);
	}	
		

}
