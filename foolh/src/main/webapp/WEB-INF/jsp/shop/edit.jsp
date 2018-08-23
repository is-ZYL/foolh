<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									编辑店铺基本信息
								</small>
							</h1>
					</div><!-- /.page-header -->
					<div class="row">
						<div class="col-xs-12">
								<form action="" name="foolMenuUpdate" id="foolMenuUpdate" method="post">
									<div id="zhongxin" style="padding-top: 13px;">
									<input type="hidden" name="id" value="${foolShop.id }"  />
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">ID</td>
											<td><input type="number"  name="id"  id="id1" value="${foolShop.id }"   placeholder="店铺Id"  style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">店铺名称:</td>
											<td><input type="text" name="shopTitle" id="shopTitle" value="${foolShop.shopTitle }" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="这里输入店铺名称"  style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">店铺地址:</td>
											<td><input type="text" name="shopAddress" id="shopAddress"   title="店铺地址" value="${foolShop.shopAddress }"    style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">店铺详情介绍:</td>
											<td><input type="text" name="shopMsg" id="shopMsg"   placeholder="输入店铺介绍" title="店铺介绍" value="${foolShop.shopMsg }"    style="width:98%;"/></td>
										</tr>
										<tr>
										
											<td style="width:79px;text-align: right;padding-top: 13px;">店铺类型:</td>
											<td>
											<select  class="col-xs-10 col-sm-5 form-control"  name="shopType" id="shopType" style="width:98%;">
												<!--  1.饭店，2. 蔬菜配送，3.水果4.调料干杂，5. 水产，6.海鲜，7.其它 -->
												<c:if test="${foolShop.shopType == 1 }"><option selected="selected" value="${foolShop.shopType }">饭店</option></c:if>
												<c:if test="${foolShop.shopType == 2 }"><option selected="selected" value="${foolShop.shopType }">蔬菜配送</option></c:if>
												<c:if test="${foolShop.shopType == 3 }"><option selected="selected" value="${foolShop.shopType }">水果</option></c:if>
												<c:if test="${foolShop.shopType == 4 }"><option selected="selected" value="${foolShop.shopType }">调料干杂</option></c:if>
												<c:if test="${foolShop.shopType == 5 }"><option selected="selected" value="${foolShop.shopType }">水产</option></c:if>
												<c:if test="${foolShop.shopType == 6 }"><option selected="selected" value="${foolShop.shopType }">海鲜</option></c:if>
												<c:if test="${foolShop.shopType == 7 }"><option selected="selected" value="${foolShop.shopType }">其他</option></c:if>
												<option value="1">饭店</option>
												<option  value="2">蔬菜配送</option>
												<option  value="3">水果</option>
												<option  value="4">调料干杂</option>
												<option  value="5">水产</option>
												<option  value="6">海鲜</option>
												<option  value="7">其他</option>
											</select>
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
	<script type="text/javascript" src="static/js/myjs/shop/shopEdit.js"></script>
	<script type="text/javascript">
			
			//判断文本框是否更改 
			function checkInfoIsChanged(){
				
				var foolTitle = $("#shopTitle").val();
				var foolTitleByht = "${foolShop.shopTitle }";
				
				var shopAddress = $("#shopAddress").val();
				var shopAddressByht = "${foolShop.shopAddress }";
				
				var foolMsg = $("#shopMsg").val();
				var foolMsgByht = "${foolShop.shopMsg }";
				
				var shopType = $("#shopType").val();
				var shopTypeByht = "${foolShop.shopType }";
				
				if(foolTitle == foolTitleByht && shopAddress == shopAddressByht && foolMsg==foolMsgByht && shopType == shopTypeByht){
					layer.msg("没有更改任何数据",{icon:6});
					return false;
				}else{
					return true;
				}
			}
	</script>

</body>
</html>