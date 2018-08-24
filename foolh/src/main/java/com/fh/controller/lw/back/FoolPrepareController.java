package com.fh.controller.lw.back;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fh.controller.base.BaseController;
import com.fh.lw.mapper.FoolPrepareMapper;
import com.fh.lw.pojo.FoolLibraryPrepare;
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
import com.github.pagehelper.PageInfo;

/**
 * 菜品准备
 * 
 * @author yuanyuana 2018年7月28日 下午1:30:51
 */
@Controller
@RequestMapping(value = { "foolprepare", "order" })
public class FoolPrepareController extends BaseController {

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
	 * 获取所有订单
	 * 
	 * @param allInfo
	 * @return
	 */
	@RequestMapping(value = "getOrderList", method = RequestMethod.GET)
	public ResponseEntity<PageInfo<FoolLibraryPrepare>> getOrderList(@RequestParam("allInfo") String[] allInfo) {
		try {
			PageInfo<FoolLibraryPrepare> list = this.foolLibraryPrepareService
					.getFoolLibraryPrepareByKeywordsAndOtherInfo(allInfo);
			// 查看
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 改变订单状态
	 * 
	 * @param f
	 * @return
	 */
	@RequestMapping(value = "changeOrderStatus", method = RequestMethod.POST)
	public ResponseEntity<Void> changeOrderStatus(FoolLibraryPrepare f) {
		try {
			// 通过id获取店铺
			this.foolLibraryPrepareService.changeOrderStatus(f);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 批量删除订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "delOrders", method = RequestMethod.POST)
	public ResponseEntity<Void> delOrders(@RequestParam("ids") String ids) {
		try {
			if (this.foolLibraryPrepareService.deleteByIds(ids))
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
	 * 删除指定订单
	 * 
	 * @param f
	 * @return
	 */
	@RequestMapping(value = "delOrder", method = RequestMethod.POST)
	public ResponseEntity<Void> delOrder(FoolLibraryPrepare f) {
		try {
			if (this.foolLibraryPrepareService.deleteByWhere(f) > 0)
				return ResponseEntity.status(HttpStatus.OK).build();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

}
