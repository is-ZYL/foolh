package com.fh.controller.system.appuser;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.appuser.WeixinUserManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 类名称：会员管理 创建人：FH Q728971035 修改时间：2014年11月17日
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/hweixinuser")
public class HweixinUserController extends BaseController {

	String menuUrl = "hweixinuser/listUsers.do"; // 菜单地址(权限用)
	@Resource(name = "hweixinUserService")
	private WeixinUserManager wum;


	/**
	 * 显示用户列表
	 * 
	 * @param page 
	 * @return
	 */
	@RequestMapping(value = "/listUsers")
	public ModelAndView listUsers(Page page) {
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String keywords = pd.getString("keywords");				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData> userList = wum.listPdPageUser(page); // 列出会员列表
			mv.setViewName("system/appuser/weixinuser_list");
			mv.addObject("userList", userList);
			mv.addObject("pd", pd);
			mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	@RequestMapping(value = "updateState")
	public void editP(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改用户状态");
		
		PageData pd = new PageData();
		pd = this.getPageData();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("updated", time); // 更新时间
		this.wum.editW(pd);
		out.write("success");
		out.close();
	}
	
	@RequestMapping(value = "updateLine")
	public void editL(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改用户权限");
		
		PageData pd = new PageData();
		pd = this.getPageData();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("updated", time); // 更新时间
		this.wum.editL(pd);
		out.write("success");
		out.close();
	}
	@RequestMapping(value = "updateCheck")
	public void updateCheck(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改审核状态");
		
		PageData pd = new PageData();
		pd = this.getPageData();
		Integer i=Integer.parseInt(pd.getString("checkId"));
		Integer i1=Integer.parseInt(pd.getString("ischeck"));
		this.wum.editW(pd);
		out.write("success");
		out.close();
	}
	
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
        pd=this.wum.findById(pd);
		mv.setViewName("system/appuser/wuser_xq");
		mv.addObject("msg", "saveU");
		mv.addObject("pd", pd);
		return mv;
	}
	

}
