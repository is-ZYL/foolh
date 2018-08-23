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

import com.fh.controller.base.BaseController;
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

/**
 * 建议
 * @author yuanyuana
 *
 * 2018年7月28日 下午1:33:03
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping("jianyi")
public class JianyiController extends BaseController{
	
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
	 * 
	 * 获取所有的建议
	 * 
	 * @return
	 */
	@RequestMapping(value = "getJianyiList", method = RequestMethod.GET)
	public ResponseEntity<List<Jianyi>> getJianyiList() {
		try {

			List<Jianyi> queryAll = this.jinyanService.queryAll();
			// 查看
			return ResponseEntity.ok(queryAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 修改建议状态
	 * 
	 * @return
	 */
	@RequestMapping(value = "updateJianyiById", method = RequestMethod.POST)
	public ResponseEntity<Void> updateJianyiById(Jianyi jy) {
		try {
			this.jinyanService.updateSelective(jy);
			// 修改建议状态
			return ResponseEntity.status(HttpStatus.RESET_CONTENT).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	
}