package com.fh.lw.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.entity.system.User;
import com.fh.lw.mapper.FoolLibrarySeasMapper;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolLibrarySeas;
import com.fh.lw.pojo.FoolSeas;
import com.github.abel533.entity.Example;
import com.github.abel533.mapper.Mapper;

@Service
public class FoolLibrarySeasService extends BaseService<FoolLibrarySeas> {

	@Autowired
	private Mapper<FoolLibrarySeas> foolSeasMapper;
	
	public List<FoolLibrarySeas> getSeasListByMenuId(FoolLibrarySeas f) {
		return this.queryListByWhereInfoASC(f,"seas_select");
	}
	
	

	/**
	 * 	指定字段进行升序排序
	 * 
	 * @param record
	 * @return
	 */
	public List<FoolLibrarySeas> queryListByWhereInfoASC(FoolLibrarySeas f,String info) {
		Example example = new Example(f.getClass());
		example.createCriteria().andEqualTo("foolId", f.getFoolId());
		example.setOrderByClause(info+" ASC");
		example.setDistinct(true);//去重
		return this.foolSeasMapper.selectByExample(example);
	}
	
	
	/**
	 * 	指定字段进行升序排序
	 * 
	 * @param record
	 * @return
	 */
	public FoolLibrarySeas queryFoolLibrarySeasByWhere(FoolLibrarySeas f) {
		return super.queryOne(f);
	}
	
	//添加菜品的所有材料
		public Integer saveSelectiveAll(List<FoolLibrarySeas> foolseasInfoArray,User user,FoolLibraryMenu f) throws ParseException {
			//dao.batchSave("", objs)
			//影响行数
			int result = 0;
			for (FoolLibrarySeas foolSeas : foolseasInfoArray) {
				foolSeas.setSeasAddUserId(user.getROLE_ID());
				foolSeas.setSeasWeigetCatty(foolSeas.getSeasWeigetKg()*2);
				foolSeas.setFoolId(f.getId());
				foolSeas.setFoolTitle(f.getFoolTitle());
				result += super.saveSelective(foolSeas);
			}
			return result;
		}

	
}
