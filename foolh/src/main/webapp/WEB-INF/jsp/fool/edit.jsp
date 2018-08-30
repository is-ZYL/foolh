<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>

<style type="text/css">
	body{
		z-index:100000;
	}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									编辑
								</small>
							</h1>
					</div><!-- /.page-header -->
					<div class="row">
						<div class="col-xs-12">
								<form action="" name="foolMenuUpdate" id="foolMenuUpdate" method="post">
									<div id="zhongxin" style="padding-top: 13px;">
									<input type="hidden" name="id" value="${fm.id }"  />
									<input type="hidden" id="foolId" value="${fm.foolType }"  />
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">ID</td>
											<td><input type="number"  name="id"  id="id1" value="${fm.id }"  maxlength="32" placeholder="菜品名"  style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">菜名</td>
											<td><input type="text" name="foolTitle" id="foolTitle" value="${fm.foolTitle }" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="这里输入菜品名称"  onblur="checkfoolTitle(this)" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">价格:</td>
											<td><input type="text" name="foolPrice" id="foolPrice"  maxlength="32" placeholder="输入单价 title="菜品单价" value="${fm.foolPrice }" onfocus="this.value=${fm.foolPrice }"  onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">制作时间:</td>
											<td><input type="text" name="foolMakeTime" id="foolMakeTime"  maxlength="32" placeholder="输入制作时间" title="制作时间" value="${fm.foolMakeTime }" onfocus="this.value=${fm.foolMakeTime }"  onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" style="width:98%;"/></td>
										</tr>
										
										
										<c:if test="${fm.foolShopId != null  }">
											<tr>
												<td style="width:79px;text-align:right;padding-top: 13px;">店铺id:</td>
												<td>
													<select  class="col-xs-10 col-sm-5 form-control"  name="foolShopId" id="foolShopId" style="width:98%;">
														<option selected="selected" value="${fm.foolShopId }">${fm.foolShopId }</option>
													</select>
											</td>
											</tr>
										</c:if>
										<c:if test="${fm.foolShopId == null  }">
											<tr>
												<td style="width:79px;text-align:right;padding-top: 13px;">店铺id:</td>
												<td>
													<select  class="col-xs-10 col-sm-5 form-control"  name="foolShopId" id="foolShopId" style="width:98%;">
														<option selected="selected" value="0">公共菜品</option>
													</select>
											</td>
											</tr>
										</c:if>
										<c:if test="${fm.foolType != null  }">
											<tr>
												<td style="width:79px;text-align:right;padding-top: 13px;">菜品类型:</td>
												<td>
													<select  class="col-xs-10 col-sm-5 form-control"  name="foolType" id="foolType" style="width:98%;">
													
													</select>
											</td>
											</tr>
										</c:if>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">制作方法:</td>
											<td><input type="text" name="foolMsg" id="foolMsg" value="${fm.foolMsg == null?'无': fm.foolMsg}"  placeholder="菜品制作方法" title="菜品备注" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="update();" id="edit">编辑</a>
												<a  class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"> <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i></a>
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
	<script type="text/javascript" src="static/js/myjs/fool/foolEdit.js"></script>
	<script type="text/javascript">
	//判断文本框是否更改 
	function checkInfoIsChanged(){
		var foolTitle = $("#foolTitle").val();
		var foolTitleByht = "${fm.foolTitle }";
		
		var foolPrice = $("#foolPrice").val();
		var foolPriceByht = "${fm.foolPrice }";
		
		var foolMakeTime = $("#foolMakeTime").val();
		var foolMakeTimeByht = "${fm.foolMakeTime }";
		
		var foolShopId = $("#foolShopId").val();
		var foolShopIdByht = "${fm.foolShopId }";
		
		var foolMsg = $("#foolMsg").val();
		var foolMsgByht = "${fm.foolMsg }";
		
		var foolType = $("#foolType").val();
		var foolTypeByht = "${fm.foolType }";
		
		if(foolTitle == foolTitleByht && foolPrice ==foolPriceByht && foolMakeTime == foolMakeTimeByht && foolShopId == foolShopIdByht && foolMsg == foolMsgByht && foolTypeByht == foolType ){
			alert("未更改任何数据！！！");
			return false ;
		}else{
			return true;
		}
		
	}

</script>
</body>
</html>