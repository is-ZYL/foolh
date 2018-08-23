<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<style>
#manage .goodsOrder,.good,.manage{cursor:pointer}
h5 {
	float: left
}
.active{border:1px solid transparent;padding: 0; margin-left: -1px; margin-bottom: -1px;}
h4{margin: 0 10px;background-color:rgba(209,91,71,.03);}
label:hover{cursor: pointer;}
.active:hover{border:1px solid rgb(209, 91, 71)}
.h5Title{
    margin:10px 16px 0 16px;}
.widthTd{
width:105px;
}
.widthTd100{
  width:100px;
}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout style="position:fixed;top:-10px;left:0;right:0;" -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<!-- <div class="hr hr-18 dotted hr-double"></div> -->
				  <div class="content" id="manage">
					
			
					<!-- 展示的详细内容-->
					
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
	<div id="iframeShow" class="show">
			<iframe name="mainFrame" id="mainFrame" frameborder="0" src="" style="margin:0 auto;width:100%;height:800px;margin-top:138px;"></iframe>
	</div>
	
		
	
	
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->

	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<script src="https://cdn.bootcss.com/vue/2.4.0/vue.js"></script>
	<script src="https://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.js"></script>
	<script>
	$(top.hangge());
	
	</script>
</body>
</html>