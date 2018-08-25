package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.FoolLibraryPrepareMapper;
import com.fh.lw.mapper.JianyiMapper;
import com.fh.lw.pojo.FoolLibraryPrepare;
import com.fh.lw.pojo.Jianyi;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolLibraryPrepareService extends BaseService<FoolLibraryPrepare> {

	@Autowired
	private FoolLibraryPrepareMapper fMapper;
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

	public PageInfo<FoolLibraryPrepare> getFoolPrepareList(Integer page, Integer rows, String prepAddUserId) {
		PageHelper.startPage(page, rows);
		FoolLibraryPrepare fp = new FoolLibraryPrepare();
		fp.setPrepAddUserId(prepAddUserId);
		List<FoolLibraryPrepare> list = super.queryListByWhere(fp);
		return new PageInfo<FoolLibraryPrepare>(list);
	}

	public PageInfo<FoolLibraryPrepare> getListMenu(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		FoolLibraryPrepare f = new FoolLibraryPrepare();
		List<FoolLibraryPrepare> flist = this.flps.queryListByWhereDesc(f);
		return new PageInfo<FoolLibraryPrepare>(flist);
	}

	public PageInfo<FoolLibraryPrepare> getFoolLibraryPrepareByKeywordsAndOtherInfo(String[] allInfo) {

		if ("".equals(allInfo[3]) && "".equals(allInfo[4]) && "".equals(allInfo[5])&& "".equals(allInfo[6])&& "".equals(allInfo[7])&& "".equals(allInfo[8])) {
			return this.flps.getListMenu(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
		} else {
			Example example = new Example(FoolLibraryPrepare.class);
			PageHelper.startPage(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
			Criteria criteria = example.createCriteria();
			//[ page, rows, type,foolTitle,shopTitle, userName, prepTime, is_check, created]

			// 菜名进行查找
			if (!"".equals(allInfo[3])) {
				criteria.andLike("foolTitle", "%" + allInfo[3] + "%");
			}
			// 店铺名进行查找
			if (!"".equals(allInfo[4])) {
				criteria.andLike("shopTitle", "%" + allInfo[4] + "%");
			}
			// 用户名进行查找
			if (!"".equals(allInfo[5])) {
				criteria.andLike("prepAddUserName", "%" + allInfo[5] + "%");
			}
			// 配送时间
			if (!"".equals(allInfo[6])) {
				criteria.andLike("prepTime", "%" + allInfo[6] + "%");
			}
			// 状态
			if (!"".equals(allInfo[7])) {
				criteria.andEqualTo("status",allInfo[7]);
			}
			// 创建时间
			if (!"".equals(allInfo[8])) {
				criteria.andLike("created", "%" + allInfo[8] + "%");
			}
			example.setOrderByClause("created DESC");
			List<FoolLibraryPrepare> list = this.fMapper.selectByExample(example);
			return new PageInfo<>(list);
		}
	}

	public Integer changeOrderStatus(FoolLibraryPrepare f) {
		if (f.getStatus() == 1) {
			f.setStatus(0);
		} else {
			f.setStatus(1);
		}
		return super.updateSelective(f);
	}

}
