<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<style type="text/css">
body {
	z-index: 100000;
}
.my-container{
	max-width:500px;
	margin: 0 auto;
}
</style>
</head>

<body>


	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content my-container">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									新增
								</small>
							</h1>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
								<form class="form-horizontal"  action="<%=basePath%>foolshop/addShop" name="menuForm" id="menuForm" method="post" >
									<div id="zhongxin" style="padding-top: 13px;">
									<table  id="table_report" class="table table-striped table-bordered table-hover">
									
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺名称:</td>
											<td><input type="text" class="form-control" name="shopTitle" id="shopTitle"  onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="这里输入店铺名称"  /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺执照: </td>
											<td><button type="button" class="btn btn-info btn-mini form-control glyphicon glyphicon-plus" style="outline:none;opacity: 0.5;" name="shopImg" id="shopImg" onclick="toImgEdit();" >添加店铺执照</button></td>
										</tr>

										<!-- 菜品小图回显 -->
										<tr id="shopImgViews" style="display: none">
											<td style="width:79px;text-align: right;padding-top: 13px;"></td>
											<td>
												<center>
													<img  id="xhImgMin"  alt="店铺小图" src="" width="240" height="100px" style="border:1px solid red;">
												</center>
											</td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺地址: </td>
											<td><input type="text" class="form-control" name="shopAddress" id="shopAddress"   /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 老板姓名: </td>
											<td><input type="text" class="form-control" name="shopBossName" id="shopBossName" placeholder="老板姓名"  onkeyup="value=value.replace(/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g,'')"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 联系电话: </td>
											<td><input type="text" class="form-control" name="shopPhone" id="shopPhone" placeholder="默认为添加用户电话"  onkeyup="value=value.replace(/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g,'')"/></td>
										</tr>
										
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 店铺介绍: </td>
											<td><input type="text" class="form-control" name="shopMsg" id="shopMsg"  placeholder="请填写店铺介绍"  /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: center;padding-top: 13px;"> 店铺类型:</td>
											<td>
												<select class="col-xs-10 col-sm-5 form-control" name="shopType" onchange="setSendTime(this.value)" id="shopType">
											  		<option selected="selected" value="0">请选择店铺类型</option>
											  		<option value="1">饭店</option>
													<option value="2">蔬菜配送</option>
													<option value="3">水果</option>
													<option value="4">调料干杂</option>
													<option value="5">水产</option>
													<option value="6">海鲜</option>
													<option value="7">其它</option>
												</select>
											</td>
										</tr>
										
										<tr id="addSendTime" style="display: none">
											<td style="width:79px;text-align: right;"> 送货时间: </td>
											<td id="shopSendTime"><input style="height: 30px;text-align: center;" type="time" name="shopSendTime" id="shopSendTime_1" required/>  至   <input type="time" style="height: 30px;text-align: center;" name="shopSendTime" id="shopSendTime_2" required/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" id="swfContainer" onclick="formRestInfo('#menuForm')">重置</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>

	<!-- 删除时确认窗口 -->
	<script src="static/vue.js"></script>
	<script src="static/vue-resource.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/underscore-min.js"></script>
	<script type="text/javascript" src="static/imgUrl.js"></script>
	<script type="text/javascript" src="static/js/myjs/shop/shopAdd.js"></script>
</body>
 </html>