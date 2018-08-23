package com.foolh.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fh.dao.DaoSupport;
import com.fh.lw.mapper.FoolLibrarySeasMapper;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolLibrarySeas;
import com.fh.lw.service.FoolLibraryMenuService;
import com.fh.lw.service.FoolLibrarySeasService;
import com.github.abel533.entity.Example;
import com.github.abel533.mapper.Mapper;

import oracle.net.aso.s;


public class FoolCRUD {

	@Autowired
	private Mapper<FoolLibraryMenu> mapper;
	@Autowired
	private Mapper<FoolLibrarySeas> mappers;
	@Autowired
	private FoolLibrarySeasService s;
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	@Test
	public void test() throws ParseException {
	ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"spring/ApplicationContext-main.xml","spring/ApplicationContext-dataSource.xml"});
	FoolLibraryMenuService service = context.getBean(FoolLibraryMenuService.class);
	FoolLibraryMenu fm =  new FoolLibraryMenu();
	fm.setFoolShopId(new Long(2));
	fm.setId(new Long(61));
	System.out.println(service.updateSelective(fm));
	}
	
	
	@Test
	public void test02() {
		Example example = new Example(FoolLibraryMenu.class);
		example.setDistinct(true);
		example.createCriteria().andLike("id", "大").andLessThan("id",151);
		example.or().andLessThan("id", 41);
		List<FoolLibraryMenu> countries = mapper.selectByExample(example);
	}
	
	@Test
	public void test03() throws Exception {
		FoolLibraryMenu f =	new FoolLibraryMenu();
		f.setCreated(new Date());
		f.setFoolAddUserId("123");
		f.setFoolPrice(1000);
		f.setFoolMakeTime(1000);
		dao.save("tb_fool_library_menu",f);
	}
	
	@Test
	public void test04() throws Exception {
	
	}

}
