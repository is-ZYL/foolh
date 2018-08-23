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
 * 菜品
 * @author yuanyuana
 *
 * 2018年7月28日 下午1:33:03
 */

@CrossOrigin(origins = "http://127.0.0.1", maxAge = 3600)
@Controller
@RequestMapping("help")
public class HelpController extends BaseController{
	
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

	/***
	 * 获取所有帮助
	 * 
	 * @return
	 */
	@RequestMapping(value = "getHelpList", method = RequestMethod.GET)
	public ResponseEntity<List<Help>> getHelpList() {
		try {

			List<Help> queryAll = this.helpService.queryAll();
			// 查看
			return ResponseEntity.ok(queryAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据id查询帮助详情
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getHelpDetail", method = RequestMethod.GET)
	public ResponseEntity<Help> getHelpDetail(@RequestParam("id") Long id) {
		try {

			Help queryAll = this.helpService.queryById(id);
			// 查看
			return ResponseEntity.ok(queryAll);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 添加帮助
	 * 
	 * @param help
	 * @return
	 */
	@RequestMapping(value = "addHelp", method = RequestMethod.POST)
	public ResponseEntity<List<Help>> getHelpList(Help help) {
		try {
			// 添加帮助
			this.helpService.saveSelective(help);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 修改帮助
	 * 
	 * @param help
	 * @return
	 */
	@RequestMapping(value = "updateHelp", method = RequestMethod.POST)
	public ResponseEntity<Void> updateHelp(Help help) {
		try {
			// 修改帮助
			this.helpService.updateSelective(help);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据id删除帮助
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "deleteHelp", method = RequestMethod.POST)
	public ResponseEntity<Void> deleteHelp(@RequestParam("id") Long id) {
		try {
			// 修改帮助
			this.helpService.deleteById(id);

			return ResponseEntity.status(HttpStatus.CREATED).build();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 出错500
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

}
