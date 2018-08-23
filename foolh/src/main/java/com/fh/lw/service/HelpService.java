package com.fh.lw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.HelpMapper;
import com.fh.lw.pojo.Help;
import com.fh.lw.pojo.Jianyi;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class HelpService extends BaseService<Help> {
	@Autowired
	private HelpService h;

	@Autowired
	private HelpMapper hMapper;

	public PageInfo<Help> getListMenu(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		Help help = new Help();
		List<Help> flist = this.h.queryListByWhereDesc(help);
		return new PageInfo<Help>(flist);
	}

	public Integer changeJianyiStatus(Help help) {
		if (help.getHelpStatus() == 1) {
			help.setHelpStatus(0);
		} else {
			help.setHelpStatus(1);
		}
		return super.updateSelective(help);
	}

	public PageInfo<Help> getJianyiByKeywordsAndOtherInfo(String[] allInfo) {

		if ("".equals(allInfo[3]) && "".equals(allInfo[4]) && "".equals(allInfo[5])) {
			return this.h.getListMenu(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
		} else {
			Example example = new Example(Help.class);
			PageHelper.startPage(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
			Criteria criteria = example.createCriteria();
			// [ page, rows, type, helpTitle, is_check, created];
			// 菜名进行查找
			if (!"".equals(allInfo[3])) {
				criteria.andLike("helpTitle", "%" + allInfo[3] + "%");
			}
			// 为空则说明查询全部类型
			if (!"".equals(allInfo[4])) {
				criteria.andEqualTo("helpStatus", allInfo[4]);
			}
			// 创建时间
			if (!"".equals(allInfo[5])) {
				criteria.andLike("created", "%" + allInfo[5] + "%");
			}
			example.setOrderByClause("created DESC");
			List<Help> list = this.hMapper.selectByExample(example);
			return new PageInfo<Help>(list);
		}
	}
}
