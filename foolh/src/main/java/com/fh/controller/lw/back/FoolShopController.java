package com.fh.controller.lw.back;

import java.util.List;

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

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.lw.pojo.FoolLibraryMenu;
import com.fh.lw.pojo.FoolShop;
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
import com.fh.lw.utils.Layui;
import com.fh.util.Const;
import com.github.pagehelper.PageInfo;

/**
 * 菜品店铺处理器
 * 
 * @author yuanyuana
 *
 *         2018年8月13日 下午4:04:13
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping("foolshop")
public class FoolShopController extends BaseController {

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
	 * 添加字段不为空的店铺
	 * 
	 * @param page
	 * @param rows
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "addShop", method = RequestMethod.POST)
	public ResponseEntity<Void> addShop(@RequestBody FoolShop f,HttpSession session) {
		try {
			User user = (User) session.getAttribute(Const.SESSION_USER);
			f.setShopAddUserId(user.getUSER_ID());
			if (f.getShopPhone() == null || "".equals(f.getShopPhone())) {
				f.setShopPhone(user.getPHONE());
			}
			if (f.getShopBossName() == null || "".equals(f.getShopBossName())) {
				f.setShopBossName(user.getUSERNAME());
			}
			this.foolShopService.saveSelective(f);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 查询店铺列表
	 * 
	 * @param page
	 * @param rows
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "getShopList", method = RequestMethod.GET)
	public ResponseEntity<PageInfo> getShopList(@RequestParam String[] allInfo) {
		try {
			PageInfo<FoolShop> list = this.foolShopService.getListShopByKeywordsAndOtherInfo(allInfo);
			// 查看
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 获取所有饭店店铺信息
	 * 
	 * @param page
	 * @param rows
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "getShopLists", method = RequestMethod.GET)
	public ResponseEntity<EasyUIResult> getShopList(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "20") Integer rows, @RequestParam("type") Integer type) {
		try {
			PageInfo<FoolShop> list = this.foolShopService.getShopLists(page, rows, type);
			EasyUIResult s = new EasyUIResult(list.getTotal(), list.getList());
			// 查看
			return ResponseEntity.ok(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 店铺删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "deleteShopByid", method = RequestMethod.GET)
	public ResponseEntity<Void> DeletefoolMenuLibraryById(@RequestParam("id") Long id) {
		try {
			this.foolShopService.deleteById(id);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 店铺批量删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "DeleteShops", method = RequestMethod.GET)
	public ResponseEntity<Void> DeletefoolMenuLibrarysById(@RequestParam("ids") String ids) {
		try {
			if (this.foolShopService.deleteByIds(ids))
				// 查看
				return ResponseEntity.status(HttpStatus.OK).build();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据id查询店铺信息 并进入编辑页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/foolShopMenuEdit")
	public String editFoolMenuLibraryById(@RequestParam("shopId") Long shopId, Model model) {
		logBefore(logger, "去编辑店铺页面");
		try {
			FoolShop fshop = this.foolShopService.queryById(shopId);
			model.addAttribute(fshop);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return "/shop/edit";
	}

	/**
	 * 根据id更新店铺信息
	 * 
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = "updateFoolShop", method = RequestMethod.POST)
	public ResponseEntity<Void> updateFoolMenuLibraryById(FoolShop shop) {
		try {
			this.foolShopService.updateSelective(shop);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据店铺id查询该店铺的所有私房菜信息
	 * 
	 * @param shop
	 * @return
	 */
	@RequestMapping(value = "getFoolListByShopId", method = RequestMethod.GET)
	public ResponseEntity<Layui> getFoolByShopId(FoolLibraryMenu fm, @RequestParam("page") Integer page,
			@RequestParam Integer limit) {
		try {
			PageInfo<FoolLibraryMenu> list = this.foolLibraryMenuService.queryPageListByWhere(page, limit, fm);
			Layui layui = Layui.data(list.getTotal(), list.getList());
			// 查看
			return ResponseEntity.ok(layui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据店铺id获取店铺跟其他店铺绑定的所有店铺信息
	 * 
	 * @param fShop
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "getBindShopByShopId", method = RequestMethod.GET)
	public ResponseEntity<Layui> getBindShopByShopId(FoolShop fShop,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "10") Integer limit) {
		try {
			// 通过id获取店铺
			PageInfo<FoolShop> list = this.foolShopService.queryPageShopListByWhere(page, limit, fShop);
			Layui layui = Layui.data(list.getTotal(), list.getList());
			// 查看
			return ResponseEntity.ok(layui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * 根据店铺id其他类型的店铺方便进行绑定
	 * 
	 * @param fShop
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping(value = "getBindShopListByShopId", method = RequestMethod.GET)
	public ResponseEntity<Layui> getBindShopListByShopId(FoolShop fShop,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "10") Integer limit ,
		@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		try {
			// 通过id获取店铺
			PageInfo<FoolShop> list  = this.foolShopService.queryBindShopListByShopId(page, limit,fShop,keyword);
			Layui layui = Layui.data(list.getTotal(), list.getList());
			// 查看
			return ResponseEntity.ok(layui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 根据绑定店铺的id与被绑定的id店铺进行绑定
	 * @param oldId 绑定id
	 * @param newId 被绑定id 
	 * @return
	 */
	
	@RequestMapping(value = "bindShopByShopId", method = RequestMethod.POST)
	public ResponseEntity<Void> bindShopByShopId(@RequestParam Long oldId,@RequestParam Long newId) {
		try {
			// 通过id获取店铺
			this.foolShopService.bindShopByShopId(oldId,newId);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 取消店铺之间的绑定
	 * @param oldId 绑定id
	 * @param newId 被绑定id 
	 * @return 
	 */
	
	@RequestMapping(value = "cancelBindShopByShopId", method = RequestMethod.POST)
	public ResponseEntity<Void> cancelBindShopByShopId(@RequestParam("oldId") Long oldId,@RequestParam("newId") Long newId) {
		try {
			// 通过id获取店铺
			this.foolShopService.cancelBindShopByShopId(oldId,newId);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/**
	 * 取消店铺之间的绑定
	 * @param oldId 绑定id
	 * @param newId 被绑定id 
	 * @return 
	 */
	
	@RequestMapping(value = "changeShopStatus", method = RequestMethod.POST)
	public ResponseEntity<Void> changeShopStatus(@RequestParam("shopStatus") Integer shopStatus,@RequestParam("id") Long id) {
		try {
			// 通过id获取店铺
			this.foolShopService.changeShopStatus(shopStatus,id);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

}
