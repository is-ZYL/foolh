package com.fh.lw.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.lw.mapper.FoolShopMapper;
import com.fh.lw.pojo.FoolShop;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class FoolShopService extends BaseService<FoolShop> {

	@Autowired
	private FoolShopMapper foolshopMapper;

	/**
	 * 获取所有店铺
	 * 
	 * @param page
	 * @param rows
	 * @param type
	 * @return
	 */
	public PageInfo<FoolShop> getShopList(Integer page, Integer rows, Integer type) {
		PageHelper.startPage(page, rows);
		FoolShop fs = new FoolShop();
		// 等于100 查找所有店铺
		if (type != 100) {
			fs.setShopType(type);
		}

		List<FoolShop> flist = super.queryListByWhereDesc(fs);
		return new PageInfo<FoolShop>(flist);
	}

	/**
	 * 获取所有饭店店铺
	 * 
	 * @param page
	 * @param rows
	 * @param type
	 * @return
	 */
	public PageInfo<FoolShop> getShopLists(Integer page, Integer rows, Integer type) {
		FoolShop fs = new FoolShop();
		// 等于100 查找所有店铺
		if (type != 100) {
			fs.setShopType(type);
		}
		Example example = new Example(FoolShop.class);
		example.createCriteria().andEqualTo("shopType", 1);
		PageHelper.startPage(page, rows);
		List<FoolShop> flist = this.foolshopMapper.selectByExample(example);
		return new PageInfo<FoolShop>(flist);
	}

	/**
	 * 根据userid
	 * 
	 * @param user_ID
	 * @return
	 */
	public FoolShop queryByUId(String user_ID) {
		FoolShop fool = new FoolShop();
		fool.setShopAddUserId(user_ID);
		return foolshopMapper.selectOne(fool);

	}

	/**
	 * 根据多个店铺id获取多个店铺
	 * 
	 * @param user_ID
	 * @return
	 */
	public Page<FoolShop> queryListByShopId(List<Long> ids) {
		Page<FoolShop> lists = new Page<>();
		if (!ids.isEmpty()) {
			for (Iterator iterator = ids.iterator(); iterator.hasNext();) {
				FoolShop foolShop = super.queryById(Long.parseLong(iterator.next().toString()));
				lists.add(foolShop);
			}
		}
		return lists;
	}

	/**
	 * 通过关键字进行查找店铺，并根据参数进行排序
	 * 
	 * @param allInfo
	 * @return
	 */
	public PageInfo<FoolShop> getListShopByKeywordsAndOtherInfo(String[] allInfo) {
		// [page,rows,type,foolTitle,is_check,created,shopId,addUser,status];
		if ("".equals(allInfo[3]) && "0".equals(allInfo[4]) && "".equals(allInfo[5]) && "0".equals(allInfo[6]) && "".equals(allInfo[7])
				&& "".equals(allInfo[8])) {
			return this.getShopList(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]),
					Integer.parseInt(allInfo[2]));
		} else {
			Example example = new Example(FoolShop.class);
			PageHelper.startPage(Integer.parseInt(allInfo[0]), Integer.parseInt(allInfo[1]));
			Criteria criteria = example.createCriteria();
			// 店铺名进行查找
			if (!"".equals(allInfo[3])) {
				criteria.andLike("shopTitle", "%" + allInfo[3] + "%");
			}
			// 根据店铺类型 进行查找 等于0代表查找所有
			if (Integer.parseInt(allInfo[4]) != 0) {
				criteria.andEqualTo("shopType", Integer.parseInt(allInfo[4]));
			}
			// 根据店铺ID进行查找
			if (Integer.parseInt(allInfo[6]) > 0) {
				criteria.andEqualTo("id", Integer.parseInt(allInfo[6]));
			}
			// 店铺创建时间
			if (!"".equals(allInfo[5])) {
				criteria.andLike("created", "%" + allInfo[5] + "%");
			}
			// 根据老板进行查找
			if (!"".equals(allInfo[7])) {
				criteria.andLike("shopBossName", "%" + allInfo[7] + "%");
			}
			// 根据审核状态进行查找
			if (!"".equals(allInfo[8])) {
				criteria.andEqualTo("shopStatus", allInfo[8]);
			}

			example.setOrderByClause("created ASC");
			List<FoolShop> list = this.foolshopMapper.selectByExample(example);
			return new PageInfo<>(list);

		}

	}

	/**
	 * 利用店铺获取与其他绑定的配送店铺
	 * 
	 * @param page
	 * @param rows
	 * @param f
	 * @return
	 */
	public PageInfo<FoolShop> queryPageShopListByWhere(Integer page, Integer rows, FoolShop f) {
		f = super.queryOne(f);
		// 获取所有配送店铺的id，拆分并通过id进行查询店铺信息
		String SongShopIds = f.getSongShopIdList();
		String[] id = SongShopIds.split(",");
		long[] strArrNum = (long[]) ConvertUtils.convert(id,long.class);
		ArrayList<Long> ids = new ArrayList<Long>();
		for (int i = 0; i < strArrNum.length; i++) {
			ids.add(strArrNum[i]);
		}
		if (ids.contains(0l)) {
			ids.remove(0);
		}
		List<FoolShop> flist = this.queryListByShopId(ids);
		if (!ids.isEmpty()) {
			if (flist.contains(null)) {
				flist.remove(null);
			}
		}
		PageInfo<FoolShop> fPageInfo  = new PageInfo<FoolShop>(flist);
		return fPageInfo;
	}

	/**
	 * 根据当前店铺查询可以与当前店铺进行绑定的店铺
	 * @param page
	 * @param rows
	 * @param f
	 * @return
	 */
	public PageInfo<FoolShop> queryBindShopListByShopId(Integer page, Integer rows, FoolShop f,String keyword) {
		f = super.queryOne(f);
		String[] Myids = f.getSongShopIdList().split(",");
		ArrayList<String> myidsList = new ArrayList<>(Arrays.asList(Myids));
		if (myidsList.contains(0)) {
			myidsList.remove(0);
		}
		Example example = new Example(FoolShop.class);
		Criteria criteria = example.createCriteria();
		// 如果当前店铺为饭店 则查询其他类型的店铺list 否则就查询饭店类型店铺
		if (f.getShopType().equals(1)) {
			// 剔除掉已经绑定的店铺
			for (int i = 0; i < Myids.length; i++) {
				criteria.andNotEqualTo("id", Myids[i]);
			}
			// 排除自己类型相同的店铺和饭店
			criteria.andNotEqualTo("shopType", f.getShopType());
			criteria.andNotEqualTo("shopType", 1);
		} else {
			// 剔除已经绑定的店铺 查询饭店
			for (int i = 0; i < Myids.length; i++) {
				criteria.andNotEqualTo("id", Myids[i]);
			}
			criteria.andEqualTo("shopType", 1);
		}
		if (!"".equals(keyword)) {
			criteria.andLike("shopTitle", "%" +keyword + "%");// 店铺名称
		}
		List<FoolShop> shops = super.queryListByWhereExample(page,rows,example);
		Iterator<FoolShop> iterator = shops.iterator();
	/*	// 将查询出来的数据进行筛选掉已经相互绑定的id
		while (iterator.hasNext()) {
			FoolShop foolShop = iterator.next();
			String[] ids = foolShop.getSongShopIdList().split(",");
			if (!ids[0].equals(0)) {
				for (int i = 0; i < Myids.length; i++) {
					for (int j = 0; j < ids.length; j++) {
						if (Myids[i].equals(ids[j])) {
							iterator.remove();
						}
					}
				}
			}
		}*/
		
		return new PageInfo<FoolShop>(shops);
	}
	
	/**
	 * oldId 绑定id  newId被绑定id 
	 * @param oldId
	 * @param newId
	 * @return
	 */
	public Integer bindShopByShopId(Long oldId, Long newId) {
		// 根据id获取店铺对象
		FoolShop oldShop = super.queryById(oldId);
		FoolShop newShop = super.queryById(newId);

		// 获取配送的店铺id
		String[] oldIds = oldShop.getSongShopIdList().split(",");
		String[] newIds = newShop.getSongShopIdList().split(",");
		//去除掉第一个为0或者为空的值
		if ("0".equals(newIds[0]) || "".equals(newIds[0])) {
			newIds =ArrayUtils.remove(newIds, 0);
		}
		
		if ("0".equals(oldIds[0]) || "".equals(oldIds[0])) {
			oldIds =ArrayUtils.remove(oldIds,0);
		}
		
		List<String> oList = new ArrayList<String>();
		Collections.addAll(oList, oldIds);
		boolean ok = false;
		if (oldIds.length != 0) {
			for (int i = 0; i < oldIds.length; i++) {
				if (!oldIds[i].equals(newId.toString())) {
					ok = true;
				}else {
					ok=false;
				}
			}
		}else {
			oList.add(newId.toString());
		}
		
		if (ok) {
			oList.add(newId.toString());
		}

		//判断是否已经添加过，已添加则不进行任何操作
		List<String> nList = new ArrayList<String>();
		Collections.addAll(nList, newIds);
		boolean yes = false;
		if (newIds.length != 0) {
			for (int i = 0; i < newIds.length; i++) {
				if (!newIds[i].equals(oldId.toString())) {
					yes = true;
				}else {
					yes = false;
				}
			}
		}else {
			nList.add(oldId.toString());
		}
		if (yes) {
			nList.add(oldId.toString());
		}

		// 将数组进行转换为字符串 并以“,”隔开
		String	newidList = StringUtils.join(nList,",");
		String	oldidList = StringUtils.join(oList,",");

		newShop.setSongShopIdList(newidList);
		oldShop.setSongShopIdList(oldidList);
		int i = super.updateSelective(newShop);
		i += super.updateSelective(oldShop);
		return i;

	}

	// oldId 绑定id newId 被绑定id
	public Integer cancelBindShopByShopId(Long oldId, Long newId) {
		// 根据id获取店铺对象
		FoolShop oldShop = super.queryById(oldId);
		FoolShop newShop = super.queryById(newId);
		// 获取配送的店铺id
		String[]  oldid= oldShop.getSongShopIdList().split(",");
		String[]  newid = newShop.getSongShopIdList().split(",");

		//判断是否包含取消id 若包含则删除
		 ArrayList<String> oldList= null;
		if (ArrayUtils.contains(oldid, newId.toString())) {
			 int index = ArrayUtils.indexOf(oldid, newId.toString());
			 oldList = new ArrayList<>(Arrays.asList(oldid));
			 oldList.remove(index);
		}
		ArrayList<String> newList = null;
		if (ArrayUtils.contains(newid, oldId.toString())) {
			 int index = ArrayUtils.indexOf(newid, oldId.toString());
			 newList = new ArrayList<>(Arrays.asList(newid));
			 newList.remove(index);
		}
		// 将处理好的数组转换为以“,”为间隔的字符串 利用apache.commons.lang.StringUtils工具
		String	old_idList = StringUtils.join(oldList, ",");
		String	new_idList = StringUtils.join(newList, ",");
		
		oldShop.setSongShopIdList(old_idList);
		newShop.setSongShopIdList(new_idList);
		return super.updateSelective(oldShop) + super.updateSelective(newShop);
	}

	/**
	 * 更新店铺审核状态
	 * @param shopStatus
	 * @param f
	 */
	public Integer changeShopStatus(Integer shopStatus,Long id) {
		FoolShop f = super.queryById(id);
		if (shopStatus == 1) {
			f.setShopStatus(0);
		} else {
			f.setShopStatus(1);
		}
		return super.updateSelective(f);
	}
}
