package com.fh.controller.lw.back;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.web.session.HttpServletSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolLibraryPrepare;
import com.fh.lw.pojo.FoolLibraryPrepareCreate;
import com.fh.lw.pojo.FoolLibrarySeas;
import com.fh.lw.pojo.FoolMenu;
import com.fh.lw.pojo.FoolPrepare;
import com.fh.lw.pojo.FoolShop;
import com.fh.lw.pojo.FoolUserLog;
import com.fh.lw.pojo.Help;
import com.fh.lw.pojo.Jianyi;
import com.fh.lw.service.FoolAndUserService;
import com.fh.lw.service.FoolLibraryMenuService;
import com.fh.lw.service.FoolLibraryPrepareCreateService;
import com.fh.lw.service.FoolLibraryPrepareService;
import com.fh.lw.service.FoolLibrarySeasService;
import com.fh.lw.service.FoolMenuService;
import com.fh.lw.service.FoolPrepareCreateService;
import com.fh.lw.service.FoolPrepareService;
import com.fh.lw.service.FoolSeasService;
import com.fh.lw.service.FoolShopService;
import com.fh.lw.service.FoolUserLogService;
import com.fh.lw.service.HelpService;
import com.fh.lw.service.JinyanService;
import com.fh.lw.service.RedisService;
import com.fh.lw.service.UserWxService;
import com.fh.lw.utils.EasyUIResult;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.github.pagehelper.PageInfo;

import oracle.net.aso.e;

/**
 * 菜品材料
 * 
 * @author yuanyuana
 *
 *         2018年7月28日 下午1:33:03
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping("foolseas")
public class FoolSeasController extends BaseController {

	@Autowired(required = true)
	private RedisService rService;
	private static final ObjectMapper MAPPER = new ObjectMapper();
	private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;

	@Autowired
	private FoolAndUserService foolAndUserService;
	@Autowired
	private FoolLibraryMenuService foolLibraryMenuService;
	@Autowired
	private FoolLibraryPrepareCreateService foolLibraryPrepareCreateService;
	@Autowired
	private FoolLibraryPrepareService foolLibraryPrepareService;
	@Autowired
	private FoolLibrarySeasService foolLibrarySeasService;
	@Autowired
	private FoolMenuService foolMenuService;
	@Autowired
	private FoolPrepareCreateService foolPrepareCreateService;
	@Autowired
	private FoolPrepareService foolPrepareService;
	@Autowired
	private HelpService helpService;
	@Autowired
	private JinyanService jinyanService;
	@Autowired
	private UserWxService us;
	@Autowired
	private FoolShopService foolShopService;
	@Autowired
	private FoolSeasService foolSeasService;
	@Autowired
	private FoolUserLogService foolUserLogService;

	/**
	 * 添加调料
	 * 
	 * @param fm
	 * @return
	 */
	@RequestMapping(value = "addFoolSeasLibraryByMenuId", method = RequestMethod.POST)
	public ResponseEntity<Void> addFoolSeasByMenuId(FoolLibrarySeas fs,HttpSession session) {
		try {
			User user = (User) session.getAttribute(Const.SESSION_USER);
			fs.setSeasWeigetCatty(fs.getSeasWeigetKg()*2);
			FoolLibraryMenu fm = this.foolLibraryMenuService.queryById(fs.getFoolId());
			fs.setFoolTitle(fm.getFoolTitle());
			fs.setSeasAddUserId(user.getUSER_ID());
			this.foolLibrarySeasService.saveSelective(fs);
			// 查看
			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据foolID查询所有材料
	 * 
	 * @param fm
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getFoolSeasListByFoolId", method = RequestMethod.GET)
	public ResponseEntity<List<FoolLibrarySeas>> getFoolSeasListByFoolId(FoolLibrarySeas f, Model model) {
		try {
		List<FoolLibrarySeas> list = this.foolLibrarySeasService.getSeasListByMenuId(f);
		model.addAttribute("foolLibrarySeasList", list);
		return ResponseEntity.ok(list);
	} catch (Exception e) {
		e.printStackTrace();
	}
	// 出错500
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	
	/**
	 * 查询菜品相关的材料名 判断是否重复
	 * 
	 * @param foolTitle
	 * @return
	 */
	@RequestMapping(value = "getFoolSeasLibraryTitle", method = RequestMethod.GET)
	public ResponseEntity<FoolLibrarySeas> getFoolMenuLibraryTitle(FoolLibrarySeas foolSeas) {
		try {
			FoolLibrarySeas fs = this.foolLibrarySeasService.queryFoolLibrarySeasByWhere(foolSeas);
			// 查看
			return ResponseEntity.ok(fs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 查询菜品相关的材料名 判断是否重复
	 * 
	 * @param foolTitle
	 * @return
	 */
	@RequestMapping(value = "deleteFoolseasByid", method = RequestMethod.GET)
	public ResponseEntity<List<FoolLibrarySeas>> deleteFoolseasByid(FoolLibrarySeas foolSeas) {
		try {
			
			 this.foolLibrarySeasService.deleteById(foolSeas.getId());
			 List<FoolLibrarySeas> fs =  this.foolLibrarySeasService.queryListByWhereInfoASC(foolSeas, "seas_select");
			// 查看
			return ResponseEntity.ok(fs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
}
