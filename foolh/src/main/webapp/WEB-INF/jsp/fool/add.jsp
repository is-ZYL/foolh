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
								<form class="form-horizontal"  action="<%=basePath%>user/addFoolMenuLibrary" name="menuForm" id="menuForm" method="post" >
									<div id="zhongxin" style="padding-top: 13px;">
									<table  id="table_report" class="table table-striped table-bordered table-hover">
									
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 菜品名称 </td>
											<td><input type="text" class="form-control" name="foolTitle" id="foolTitle"  onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="这里输入菜品名称"  onblur="checkfoolTitle(this)" /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 菜品小图 </td>
											<td><button type="button" class="btn btn-info btn-mini form-control glyphicon glyphicon-plus" style="outline:none;opacity: 0.5;" name="foolImgTitle" id="foolImgTitle" onclick="toImgEdit();" >添加图片</button></td>
										</tr>

										<!-- 菜品小图回显 -->
										<tr id="foolImgViews" style="display: none">
											<td style="width:79px;text-align: right;padding-top: 13px;"></td>
											<td>
												<center>
													<img  id="xhImgMin"  alt="菜品小图" src="" width="240" height="100px" style="border:1px solid red;">
												</center>
											</td>
										</tr>
										
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 制作时间 </td>
											<td><input  type="number" class="form-control" name="foolMakeTime" id="foolMakeTime" min="0" placeholder="单位：分钟" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"  /></td>
										</tr>
										
											
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">菜品单价 </td>
											<td><input  type="number" class="form-control" name="foolPrice" id="foolPrice" min="0" placeholder="单位：元" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"   /></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"> 菜品类型 </td>
											<td>
												<select class="col-xs-10 col-sm-5 form-control" name="foolType" id="foolType">

												</select>
											</td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">制作方法 </td>
											<td><input type="text" class="form-control" name="foolMsg" id="foolMsg"  placeholder="请填写菜品制作方法"  /></td>
										</tr>
									
										
										<tr>
											<td style="width:79px;text-align: center;padding-top: 13px;"> 店铺id</td>
											<td>
												<select class="col-xs-10 col-sm-5 form-control" name="foolShopId" id="foolShopId">
											  		<option selected="selected" value="0">请选择菜品所属店铺，默认为公共菜品</option>
												</select>
											</td>
										</tr>
										
												
												<tr id="addFoolSeasTR">
													<td style="width:79px;text-align: center;padding-top: 13px;" >添加材料</td>
													<td><button type="button"  class="glyphicon glyphicon-zoom-in form-control btn btn-mini btn-danger" style="outline:none;opacity: 0.5;" name="addFoolSeasBtn" id="addFoolSeasBtn" onclick="trShowOrHidden(arr,oldType)" >添加材料</button></td>
												</tr>
											
												<!-- 添加的材料展示 -->
												
													
												<tr id="sTitle">
													<td style="width:79px;text-align: center;padding-top: 13px;">材料名</td>
													<td><input type="text"  class="form-control"  name="seasTitle" id="seasTitle" value="${fs.seasTitle }" placeholder="材料名" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" /></td>
												</tr>
												
											
												
												<tr id="sWeight">
													<td style="width:79px;text-align: center;padding-top: 13px;">重量</td>
													<td><input  type="number"  class="form-control"  name="seasWeigetKg" id="seasWeigetKg"  min="0" placeholder="单位：kg" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" /></td>
												</tr>
												
												<tr id="sSel">
													<td style="width:79px;text-align: center;padding-top: 13px;">材料类型</td>
													<td>
														<select class="form-control" name="seasSelect" id="seasSelect">
																<option selected="selected" value="0">主料</option>
																<option value="1">配料</option>
																<option value="2">调料</option>
																<option value="3">其他</option>
														</select>
													</td>
												</tr>
												
												<tr id="sMsg">
													<td style="width:79px;text-align: center;padding-top: 13px;">菜品备注</td>
													<td><input  type="text"  class="form-control" name="seasMsg" id="seasMsg"  min="0" placeholder="备注" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" /></td>
												</tr>
												
												<tr id="sBtn">
													<td style="text-align: center;" colspan="10">
														<a class="btn btn-mini btn-info" style="opacity: 0.6;" onclick="addFoolseasInfo();">添加</a>
														<a class="btn btn-mini btn-warning" style="opacity: 0.6;" onclick="trShowOrHidden(arr,oldType);">取消</a>
													</td>
												</tr>
										
										</div>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="formRestInfo('#menuForm')">重置</a>
								
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
	<script type="text/javascript" src="static/js/myjs/fool/foolAdd.js"></script>
</body>
 </html>