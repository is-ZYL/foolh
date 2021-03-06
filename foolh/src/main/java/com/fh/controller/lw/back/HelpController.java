package com.fh.controller.lw.back;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fh.controller.base.BaseController;
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
import com.github.pagehelper.PageInfo;

import oracle.net.aso.h;

/**
 * 菜品
 * 
 * @author yuanyuana
 *
 *         2018年7月28日 下午1:33:03
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping("help")
public class HelpController extends BaseController {

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
	 * 获取所有的建议
	 * 
	 * @param allInfo
	 * @return
	 */
	@RequestMapping(value = "getHelpList", method = RequestMethod.GET)
	public ResponseEntity<PageInfo<Help>> getHelpList(@RequestParam("allInfo") String[] allInfo) {
		try {
			PageInfo<Help> list = this.helpService.getJianyiByKeywordsAndOtherInfo(allInfo);
			// 查看
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 修改建议状态
	 * @param help
	 * @return
	 */
	@RequestMapping(value = "changeHelpStatus", method = RequestMethod.POST)
	public ResponseEntity<Void> changeHelpStatus(Help help) {
		try {
			// 通过id获取店铺
			this.helpService.changeJianyiStatus(help);
			// 查看
			return ResponseEntity.status(HttpStatus.OK).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 批量删除建议数据
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "delHelpis", method = RequestMethod.POST)
	public ResponseEntity<Void> delJianyis(@RequestParam("ids") String ids) {
		try {
			if (this.helpService.deleteByIds(ids))
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
	 * 删除建议数据
	 * 
	 * @param help
	 * @return
	 */
	@RequestMapping(value = "delHelp", method = RequestMethod.POST)
	public ResponseEntity<Void> delJianyi(Help help) {
		try {
			if (this.helpService.deleteByWhere(help) > 0)
				return ResponseEntity.status(HttpStatus.OK).build();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

}
