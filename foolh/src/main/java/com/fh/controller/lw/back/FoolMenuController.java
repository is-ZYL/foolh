package com.fh.controller.lw.back;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolLibrarySeas;
import com.fh.lw.pojo.FoolMenuAllInfo;
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
import com.fh.lw.utils.Layui;
import com.fh.util.Const;
import com.github.pagehelper.PageInfo;

/**
 * 菜品
 * 
 * @author yuanyuana
 *
 *         2018年7月28日 下午1:33:03
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping({ "user/", "fool/" })
public class FoolMenuController extends BaseController {

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
	  *   通过关键字搜索菜品库里获取菜品 以及调料
	 * 
	 * @param page     页码
	 * @param rows     每页显示条数
	 * @param type     1. 公共菜品 2. 饭店菜品
	 * @param created  创建时间
	 * @param is_check 菜品类型 私有 公共 全部
	 * @param keywords 关键字 可通过id 菜品名 添加用户名 进行搜索
	 * @return
	 */
	@RequestMapping(value = "getFoolMenuLibraryList", method = RequestMethod.GET)
	public ResponseEntity<PageInfo> getFoolMenuLibraryList(@RequestParam("allInfo") String[] allInfo) {
		try {
			PageInfo<FoolLibraryMenu> list = this.foolMenuService.getListMenuByKeywordsAndOtherInfo(allInfo);
			// 查看
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 查询菜品名 判断是否重复
	 * 
	 * @param foolTitle
	 * @return
	 */
	@RequestMapping(value = "getFoolMenuLibraryTitle", method = RequestMethod.GET)
	public ResponseEntity<FoolLibraryMenu> getFoolMenuLibraryTitle(@RequestParam("foolTitle") String foolTitle) {
		try {
			FoolLibraryMenu fm = new FoolLibraryMenu();
			fm.setFoolTitle(foolTitle);
			FoolLibraryMenu resultFm = this.foolLibraryMenuService.queryByfoolTitle(fm);
			// 查看
			return ResponseEntity.ok(resultFm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 通过id查询菜品信息
	 * @param f
	 * @return
	 */
	@RequestMapping(value = "getFoolById", method = RequestMethod.GET)
	public ResponseEntity<Layui> getFoolById(FoolLibraryMenu f) {
		try {
			FoolLibraryMenu resultFm = this.foolLibraryMenuService.queryOne(f);
			ArrayList<FoolLibraryMenu> list = new ArrayList<>();
			list.add(resultFm);
			Layui layui = Layui.data(1l, list);
			// 查看
			return ResponseEntity.ok(layui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 *  菜品添加
	 * @param f
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "addFoolMenuLibrary", method = RequestMethod.POST)
	public ResponseEntity<Void> addFoolMenu(@RequestBody FoolMenuAllInfo f, HttpSession session) {
		try {
			User user = (User) session.getAttribute(Const.SESSION_USER);
			// 如果为0说明是 后台添加
			FoolLibraryMenu fm = f.getFoolMenuInfo();
			fm.setUserName(user.getNAME());
			if (fm.getFoolShopId() == 0) {// 说明为公共菜品
				fm.setFoolShopId(null);
				// 1.公共大家都可以看，2.私有菜品
				fm.setFoolIsShop(1);
				fm.setFoolAddUserId(user.getUSER_ID());
			} else {
				fm.setFoolIsShop(2);
				fm.setFoolAddUserId(user.getUSER_ID());
			}
			this.foolLibraryMenuService.saveSelective(fm);
			this.foolLibrarySeasService.saveSelectiveAll(f.getFoolseasInfoArray(), user, fm);
			// 查看
			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 菜品删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "DeletefoolMenuLibrary", method = RequestMethod.GET)
	public ResponseEntity<Void> DeletefoolMenuLibraryById(@RequestParam("id") Long id) {
		try {
			this.foolLibraryMenuService.deleteById(id);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 菜品批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "DeletefoolMenuLibrarys", method = RequestMethod.GET)
	public ResponseEntity<Void> DeletefoolMenuLibrarysById(@RequestParam("ids") String ids) {
		try {
			if (this.foolLibraryMenuService.deleteByIds(ids))
				// 查看
				return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 进入菜品编辑页面
	 * 
	 * @return
	 */
	@RequestMapping("/foolMenuEditViews")
	public ModelAndView edit() {
		return new ModelAndView("fool/edit");
	}

	/**
	 * 根据id查询菜品信息 并进入编辑页面
	 * @param foolMenuID
	 * @param model
	 * @return
	 */
	@RequestMapping("/foolMenuEdit")
	public String editFoolMenuLibraryById(@RequestParam("foolMenuID") Long foolMenuID, Model model) {
		logBefore(logger, "去编辑菜品页面");
		try {
			FoolLibraryMenu f = this.foolLibraryMenuService.queryById(foolMenuID);
			model.addAttribute("fm", f);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return "/fool/edit";
	}

	/**
	 * 查看菜品小图
	 * @param fm
	 * @return
	 */
	@RequestMapping("/getFoolImgTitleByid")
	public ResponseEntity<FoolLibraryMenu> getFoolImgTitleByid(FoolLibraryMenu fm) {
		logBefore(logger, "查看菜品小图");
		try {
			FoolLibraryMenu f = this.foolLibraryMenuService.queryOne(fm);
			return ResponseEntity.ok(f);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据id更新菜品信息
	 * @param fl
	 * @return
	 */
	@RequestMapping(value = "updateFoolMenu", method = RequestMethod.POST)
	public ResponseEntity<Void> updateFoolMenuLibraryById(FoolLibraryMenu fl) {
		try {
			System.out.println(fl);
			this.foolLibraryMenuService.updateSelective(fl);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 添加调料
	 * 
	 * @param fm
	 * @return
	 */
	@RequestMapping(value = "addFoolSeasLibraryByMenuId", method = RequestMethod.POST)
	public ResponseEntity<Void> addFoolSeasByMenuId(FoolLibrarySeas fm) {
		try {
			this.foolLibrarySeasService.saveSelective(fm);
			// 查看
			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

}
