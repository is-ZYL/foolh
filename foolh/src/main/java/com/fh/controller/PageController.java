package com.fh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("page")
@Controller
public class PageController {

	@RequestMapping(value = "{pageName}", method = RequestMethod.GET)
	public String toPage(@PathVariable("pageName") String pageName, HttpServletRequest request) {

		return pageName;

	}

	/**
	 * 跳转到有一个文件夹的网页
	 * 
	 * @param pageName
	 * @param cat
	 * @return
	 */
	@RequestMapping(value = "{cat}/{pageName}", method = RequestMethod.GET)
	public String toPage(@PathVariable("pageName") String pageName, HttpServletRequest request,
			@PathVariable("cat") String cat) {

		return cat + "/" + pageName;

	}
	/**
	 * 跳转到有2个文件夹的网页
	 * 
	 * @param pageName
	 * @param cat
	 * @return
	 */
	@RequestMapping(value = "{cat}/{folder}/{pageName}", method = RequestMethod.GET)
	public String twoPage(@PathVariable("pageName") String pageName, HttpServletRequest request,
			@PathVariable("cat") String cat,@PathVariable("folder") String folder) {
		
		return cat + "/" +folder+"/"+ pageName;
		
	}
}
