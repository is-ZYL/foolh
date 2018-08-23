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

</head>
<!-- 新增后台店铺 -->
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
									新增
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="<%=basePath%>user/addFoolMenuLibrary" name="menuForm" id="menuForm" method="post" class="form-horizontal">
							<input type="hidden" name="foolIsShop" id="foolIsShop" value="1"/>
							<input type="hidden" name="foolAddUserId" id="foolAddUserId" value="admin"/>
							
						
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜品名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="foolTitle" id="foolTitle"  value="${pd.foolTitle }" placeholder="这里输入名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 制作时间 :</label>
								<div class="col-sm-9">
									<input type="text" name="foolMakeTime" id="foolMakeTime" value="${pd.foolMakeTime }"  class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">菜品价格:</label>
								<div class="col-sm-9">
									<input type="text" name="foolPrice" id="foolPrice" value="${pd.foolPrice }"  class="col-xs-10 col-sm-5" />
								</div>
							</div>

							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" >取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		//返回
		function goback(id){
			
			window.location.href="<%=basePath%>address.do?id="+id;
		}
		
		//保存
		function save(){
			if($("#foolTitle").val()==""){
				$("#foolTitle").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#foolTitle").focus();
				return false;
			}
			if($("#foolMakeTime").val()==""){
				$("#foolMakeTime").tips({
					side:3,
		            msg:'请输入制作时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#foolMakeTime").focus();
				return false;
			}
			if($("#foolPrice").val()==""){
				$("#foolPrice").tips({
					side:3,
		            msg:'请输入菜品价格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#foolPrice").focus();
				return false;
			}
			
			$("#menuForm").submit();
		}
		
	</script>


</body>
</html>